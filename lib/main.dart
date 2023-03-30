import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgets/styles/fl_theme.dart';
import 'package:flutter_widgets/widgets/form_validation/form_provider.dart';
import 'package:flutter_widgets/widgets/form_validation/validation_model.dart';
import 'package:flutter_widgets/widgets/list_pages/listTileWidget.dart';
import 'package:flutter_widgets/widgets/table/table_widget.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    bool isDarkTheme = lightMode;
    return ChangeNotifierProvider(
      create: (context) => FormProvider(),
         child: MaterialApp(
          theme: lightMode ? lightTheme : darkTheme,
          title: 'Flutter Demo',
          home: const MyHomePage(title: 'Flutter Demo Home Page'),
        ),
    );
  }
}

bool lightMode = true;

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

ThemeData lightTheme = ThemeData(
  primaryColor: Colors.greenAccent,
  brightness: Brightness.light
);

ThemeData darkTheme = ThemeData(
    primaryColor: Colors.blue,
    brightness: Brightness.dark
);

class _MyHomePageState extends State<MyHomePage> {
  List<String> drawerNames = [
    'Table Widget',
    'Form Validation',
  ];
  List<Widget> drawerWidgets = [const TableWidget(), const ProviderFormPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerEnableOpenDragGesture: true,
      drawer: Drawer(
        child: ListView.separated(
          itemCount: drawerNames.length,
          itemBuilder: (context, index) {
            return buildListTile(context, Icons.home, drawerNames[index], drawerWidgets[index]);
          },
          separatorBuilder: (context, index) {
            return const Divider();
          },
        )
      ),
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
            Switch(
                value: lightMode,
                onChanged: (toggle) {
                  setState(() {
                    lightMode = toggle;
                  });
                }),
          ],
        ),
      ),
    );
  }
}
