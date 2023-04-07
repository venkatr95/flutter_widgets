import 'package:flutter/material.dart';
import 'package:flutter_widgets/styles/fl_theme.dart';
import 'package:flutter_widgets/utils/themeNotifier.dart';
import 'package:flutter_widgets/widgets/common_widgets/custom_radio_button.dart';
import 'package:flutter_widgets/widgets/form_validation/form_provider.dart';
import 'package:flutter_widgets/widgets/form_validation/validation_model.dart';
import 'package:flutter_widgets/widgets/search_screen/search_widget.dart';
import 'package:flutter_widgets/widgets/table/table_widget.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'widgets/models/listTileWidget.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); //required to use platform channels to call native code.
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool themeBool = prefs.getBool("isDark") ?? false; //null check
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => FormProvider()),
      ChangeNotifierProvider(
          create: (BuildContext context) => ThemeProvider(isDark: themeBool)),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
      return MaterialApp(
        theme: themeProvider.getTheme,
        title: 'Flutter Demo',
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      );
    });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

bool themeMode = false;

class _MyHomePageState extends State<MyHomePage> {
  List<String> drawerNames = [
    'Table Widget',
    'Form Validation',
    'Search Page',
    'Radio List',
  ];
  List<Widget> drawerWidgets = [
    const TableWidget(),
    const ProviderFormPage(),
    const SearchWidget(),
    const CustomRadioWidget()
  ];

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider =
        Provider.of<ThemeProvider>(context, listen: false);
    return Scaffold(
      drawerEnableOpenDragGesture: true,
      drawer: Drawer(
          child: ListView.separated(
        itemCount: drawerNames.length,
        itemBuilder: (context, index) {
          return buildListTile(
              context, Icons.home, drawerNames[index], drawerWidgets[index]);
        },
        separatorBuilder: (context, index) {
          return const Divider();
        },
      )),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Hello Widgets!',
            ),
            const Spacer(),
            const Text(
              'Switch Light/Dark Mode',
            ),
            Switch(
                value: themeProvider.getTheme == darkTheme,
                activeColor: themeProvider.getTheme == darkTheme
                    ? Colors.white
                    : Colors.black,
                onChanged: (d) {
                  setState(() {
                    themeMode = d;
                  });
                  themeProvider.changeTheme();
                })
          ],
        ),
      ),
    );
  }
}
