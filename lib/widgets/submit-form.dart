import 'package:flutter/material.dart';
import 'input.widget.dart';
import 'loading-button.widget.dart';

class SubmitForm extends StatelessWidget {
  var pesoController = new TextEditingController();
  var alturaController = new TextEditingController();
  var idadeController = new TextEditingController();

  var busy = false;
  Function submitFunc;

  SubmitForm({
    @required this.busy,
    @required this.submitFunc,
    @required this.alturaController,
    @required this.pesoController,
    @required this.idadeController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 30, right: 30),
          child: Input(
            label: "Peso",
            ctrl: pesoController,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 30, right: 30),
          child: Input(
            label: "Altura",
            ctrl: alturaController,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 30, right: 30),
          child: Input(
            label: "Idade",
            ctrl: idadeController,
          ),
        ),
        SizedBox(
          height: 25,
        ),
        LoadingButton(
          busy: false,
          func: submitFunc,
          text: "CALCULAR",
          invert: false,
        ),
      ],
    );
  }
}
