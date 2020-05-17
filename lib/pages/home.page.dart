import 'package:app_tmbcalc/widgets/logo.widget.dart';
import 'package:app_tmbcalc/widgets/submit-form.dart';
import 'package:app_tmbcalc/widgets/success.widget.dart';
import 'package:flutter/material.dart';

enum EGenero { homem, mulher }

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  EGenero _genero = EGenero.homem;
  double resultado;
  Color _color = Colors.deepPurple;
  String result = "";
  var _alturaController = new TextEditingController();
  var _pesoController = new TextEditingController();
  var _idadeController = new TextEditingController();
  var _busy = false;
  var _completed = false;
  var _resultText = "";

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
              Container(
                color: Colors.white.withOpacity(0.8),
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 100),
                      child: RadioListTile<EGenero>(
                        title: const Text('Homem',
                            style: TextStyle(
                                color: Colors.deepPurple,
                                fontSize: 25,
                                fontFamily: "Big Shoulders Display")),
                        value: EGenero.homem,
                        groupValue: _genero,
                        onChanged: (EGenero value) {
                          setState(() {
                            _genero = value;
                          });
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 100),
                      child: RadioListTile<EGenero>(
                        title: const Text('Mulher',
                            style: TextStyle(
                                color: Colors.deepPurple,
                                fontSize: 25,
                                fontFamily: "Big Shoulders Display")),
                        value: EGenero.mulher,
                        groupValue: _genero,
                        onChanged: (EGenero value) {
                          setState(() {
                            _genero = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              _completed
                  ? Success(
                      result: _resultText,
                      reset: reset,
                    )
                  : SubmitForm(
                      alturaController: _alturaController,
                      idadeController: _idadeController,
                      pesoController: _pesoController,
                      submitFunc: calcular,
                      busy: _busy,
                    ),
            ],
          ),
        ));
  }

  Future calcular() {
    // print(_sexo);
    double altura = double.tryParse(_alturaController.text);
    double peso = double.tryParse(_pesoController.text);
    int idade = int.tryParse(_idadeController.text);
    if (_genero.index == 0) {
      resultado = 66 + (13.8 * peso) + (5 * altura) - (6.8 * idade);
    } else if (_genero.index == 1) {
      resultado = 655 + (9.6 * peso) + (1.8 * altura) - (4.7 * idade);
    }

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
