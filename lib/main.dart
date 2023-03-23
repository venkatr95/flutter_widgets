import 'package:flutter/material.dart';
import 'package:flutter_widgets/widgets/table/table_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> _listTableItem(BuildContext context) => <Widget>[
    const TableWidget()
  ];
  List<String> drawerNames = [
    'Alabama',
    'Alaska',
    'Arizona',
    'Arkansas'
  ];
  List<bool> drawerNamesSelected = [false, true, true, true];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerEnableOpenDragGesture: true,
      drawer: Drawer(
        child: ListView.separated(
          itemCount: drawerNames.length,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {
                setState(() {
                  for (var i = 0; i < drawerNamesSelected.length; i++) {
                    drawerNamesSelected[i] = false;
                  }
                  drawerNamesSelected[index] = true;
                });
              },
              trailing:
                drawerNamesSelected[index] == false ? const SizedBox.shrink() : Image.asset('assets/images/circle_avatar.png', width: 6, height: 5),
              title: Text(
                  drawerNames[index]
              ),
            );
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
          children: const <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
          ],
        ),
      ),
    );
  }
}
