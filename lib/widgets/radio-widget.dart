import 'package:flutter/material.dart';

enum SingingCharacter { homem, mulher }

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  SingingCharacter _character = SingingCharacter.homem;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 100),
          child: RadioListTile<SingingCharacter>(
            title: const Text('Homem',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontFamily: "Big Shoulders Display")),
            value: SingingCharacter.homem,
            groupValue: _character,
            onChanged: (SingingCharacter value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 100),
          child: RadioListTile<SingingCharacter>(
            title: const Text('Mulher',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontFamily: "Big Shoulders Display")),
            value: SingingCharacter.mulher,
            groupValue: _character,
            onChanged: (SingingCharacter value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
      ],
    );
  }
}
