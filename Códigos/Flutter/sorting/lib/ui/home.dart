import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Home extends StatefulWidget {
  const Home({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int quant = -1;
  String algorithm = "";

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: const BoxDecoration(color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.only(top: 80, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                child: Image.asset('assets/img/icon.png', height: 90),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 50),
                child: const Text(
                  "Análise de desempenho utilizando algortimos de ordenação",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                child: const Text(
                  "Selecione a quantidade de elementos",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 23),
                ),
              ),
              buildQuant(),
              Container(
                margin: const EdgeInsets.only(top: 50, bottom: 20),
                child: const Text(
                  "Selecione o algoritmo de ordenação",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 23),
                ),
              ),
              buildAlgorithm(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildAlgorithm() {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        children: [
          for (var item in [
            "Bubble Sort",
            "Quick Sort",
            "Merge Sort",
            "Insertion Sort",
            "Selection Sort"
          ])
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Radio(
                  value: item,
                  groupValue: algorithm,
                  onChanged: (String? value) {
                    setState(() {
                      algorithm = value!;
                    });
                  },
                ),
                Text(
                  item,
                  style: const TextStyle(fontSize: 23),
                ),
              ],
            ),
        ],
      ),
    );
  }

  Widget buildQuant() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        for (var item in [10, 100, 1000, 10000])
          Row(
            children: [
              Radio(
                value: item,
                groupValue: quant,
                onChanged: (int? value) {
                  setState(() {
                    quant = value!;
                  });
                },
              ),
              Text(
                "$item",
                style: const TextStyle(fontSize: 23),
              ),
            ],
          )
      ],
    );
  }
}
