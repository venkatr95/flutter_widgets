import 'package:flutter/material.dart';

class CustomRadioListWidget extends StatefulWidget {
  const CustomRadioListWidget({super.key});

  @override
  createState() {
    return CustomRadioListWidgetState();
  }
}

class CustomRadioListWidgetState extends State<CustomRadioListWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ListItem"),
      ),
    );
  }
}
