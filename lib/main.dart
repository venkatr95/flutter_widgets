import 'package:flutter/material.dart';
import 'package:flutter_widgets/widgets/list_pages/listTileWidget.dart';
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
        primarySwatch: Colors.teal,
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
  List<String> drawerNames = [
    'Alabama',
    'Alaska',
    'Arizona',
    'Arkansas'
  ];
  List<Widget> drawerWidgets = [const TableWidget(), const TableWidget(), const TableWidget(), const TableWidget()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerEnableOpenDragGesture: true,
      drawer: Drawer(
        child: ListView.separated(
          itemCount: drawerNames.length,
          itemBuilder: (context, index) {
            for (var i = 0; i < drawerNames.length; i++) {
              return buildListTile(context, Icons.home, drawerNames[index], drawerWidgets[i]);
            }
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
