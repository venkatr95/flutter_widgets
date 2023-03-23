import 'package:flutter/material.dart';

List<Map> _books = [
  {
    'id': 100,
    'title': 'Flutter Basics',
    'author': 'David John'
  },
  {
    'id': 102,
    'title': 'Git and GitHub',
    'author': 'Merlin Nick'
  },
  {
    'id': 101,
    'title': 'Flutter Basics',
    'author': 'David John'
  },
];

class TableWidget extends StatefulWidget {
  const TableWidget({super.key});

  @override
  TableWidgetScreenState createState() => TableWidgetScreenState();
}

class TableWidgetScreenState extends State<TableWidget> {
  bool? _isEditMode = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('DataTable Demo'),
        ),
        body: ListView(
          children: [
            _createDataTable(),
            _createCheckboxField()
          ],
        ),
      ),
    );
  }

  DataTable _createDataTable() {
    return DataTable(columns: _createColumns(), rows: _createRows());
  }

  List<DataColumn> _createColumns() {
    return [
      const DataColumn(label: Text('ID')),
      const DataColumn(label: Text('Book')),
      const DataColumn(label: Text('Author'))
    ];
  }

  List<DataRow> _createRows() {
    return _books
        .map((book) =>
        DataRow(cells: [
          DataCell(Text('#${book['id']}')),
          _createTitleCell(book['title']),
          DataCell(Text(book['author']))
        ]))
        .toList();
  }

  DataCell _createTitleCell(bookTitle) {
    return DataCell(_isEditMode == true ?
    TextFormField(initialValue: bookTitle,
        style: const TextStyle(fontSize: 14))
        : Text(bookTitle));
  }

  Row _createCheckboxField() {
    return Row(
      children: [
        Checkbox(
          value: _isEditMode,
          onChanged: (value) {
            setState(() {
              _isEditMode = value;
            });
          },
        ),
        const Text('Edit mode'),
      ],
    );
  }
}