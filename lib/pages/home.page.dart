import 'package:app_tmbcalc/widgets/logo.widget.dart';
import 'package:app_tmbcalc/widgets/submit-form.dart';
import 'package:app_tmbcalc/widgets/success.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color _color = Colors.deepPurple;
  String result = "";
  var _alturaController = new TextEditingController();
  var _pesoController = new TextEditingController();
  var _idadeController = new TextEditingController();
  var _busy = true;
  var _completed = false;
  var _resultText = "Seu TMB";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: AnimatedContainer(
          duration: Duration(milliseconds: 1200),
          color: _color,
          child: ListView(
            children: <Widget>[
              Logo(),
              _completed
                  ? Success(
                      result: _resultText,
                      reset: reset,
                    )
                  : SubmitForm(
                      submitFunc: calcular,
                      busy: _busy,
                      alturaController: _alturaController,
                      idadeController: _idadeController,
                      pesoController: _pesoController,
                    ),
            ],
          ),
        ));
  }

  Future calcular() {
    double altura = double.tryParse(_alturaController.text);
    double peso = double.tryParse(_pesoController.text);
    int idade = int.tryParse(_idadeController.text);
    double resultado = 66 + (13.8 * peso) + (5 * altura) - (6.8 * idade);

    setState(() {
      _color = Colors.deepPurpleAccent;
      _completed = false;
      _busy = true;
    });
    print(resultado);

    return new Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        _resultText = ("TMB $resultado");

        _busy = false;
        _completed = true;
      });
    });
  }

  reset() {
    setState(() {
      _alturaController = new TextEditingController();
      _pesoController = new TextEditingController();
      _idadeController = new TextEditingController();
      _completed = false;
      _busy = false;
      _color = Colors.deepPurple;
    });
  }
}
