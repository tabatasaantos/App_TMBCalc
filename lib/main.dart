import 'package:app_tmbcalc/widgets/input.widget.dart';
import 'package:app_tmbcalc/widgets/loading-button.widget.dart';
import 'package:flutter/material.dart';

import 'widgets/logo.widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculo TMB',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: ListView(
        children: <Widget>[
          Logo(),
          Container(
            margin: EdgeInsets.all(30),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.8),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 35,
                ),
                Text(
                  "O valor do seu TMB",
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 30,
                    fontFamily: "Big Shoulders Display",
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20,
                ),
                LoadingButton(
                  busy: false,
                  func: () {},
                  text: "CALCULAR NOVAMENTE",
                  invert: true,
                ),
              ],
            ),
          ),
          Input(
            label: "Peso",
          ),
          Input(
            label: "Altura",
          ),
          Input(
            label: "Idade",
          ),
          LoadingButton(
            busy: true,
            func: () {},
            text: "CALCULAR",
            invert: false,
          ),
        ],
      ),
    );
  }
}
