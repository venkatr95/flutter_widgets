import 'package:flutter/material.dart';

class CustomRadioWidget extends StatefulWidget {
  const CustomRadioWidget({super.key});
  final String title = "Radio Widget Demo";
  @override
  CustomRadioWidgetState createState() => CustomRadioWidgetState();
}

class CustomRadioWidgetState extends State<CustomRadioWidget> {
  late List<RadioButton> radioButtons;
  late RadioButton selectedRadioButton;
  late int selectedRadioBtn;

  @override
  void initState() {
    super.initState();
    selectedRadioBtn = 0;
    selectedRadioButton = RadioButton(radioId: 0, title: 'gg');
    radioButtons = RadioButton.getRadioButtons();
  }

  setSelectedRadio(RadioButton radioBtn) {
    setState(() {
      selectedRadioButton = radioBtn;
    });
  }

  List<Widget> createRadioListUsers() {
    List<Widget> widgets = [];
    for (RadioButton radio in radioButtons) {
      widgets.add(
        RadioListTile(
          value: radio,
          groupValue: selectedRadioButton,
          title: Text(radio.title),
          onChanged: (currentUser) {
            setSelectedRadio(radio);
          },
          selected: selectedRadioButton == radio,
          activeColor: Colors.green,
        ),
      );
    }
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(20.0),
            child: const Text("USERS"),
          ),
          Column(
            children: createRadioListUsers(),
          ),
        ],
      ),
    );
  }
}

class RadioButton {
  int radioId;
  String title;

  RadioButton({required this.radioId, required this.title});

  static List<RadioButton> getRadioButtons() {
    return <RadioButton>[
      RadioButton(radioId: 1, title: "RB1"),
      RadioButton(radioId: 2, title: "RB2"),
      RadioButton(radioId: 3, title: "RB3"),
      RadioButton(radioId: 4, title: "RB4"),
      RadioButton(radioId: 5, title: "RB5"),
    ];
  }
}
