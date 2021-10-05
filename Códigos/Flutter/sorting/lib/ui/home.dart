import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sorting/ui/about.dart';
import 'package:sorting/model/sorting_algorithm.dart';
import 'package:sorting/ui/result.dart';

class Home extends StatefulWidget {
  const Home({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int quant = 0;
  String algorithm = '';

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) => Material(
        child: SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(color: Colors.white),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 70),
                  child: Image.asset('assets/img/icon.png', height: 90),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
                  child: const Text(
                    'Análise de desempenho utilizando algortimos de ordenação',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 27, left: 20, right: 20),
                  child: const Text(
                    'Selecione a quantidade de elementos',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 19),
                  ),
                ),
                buildQuant(),
                Container(
                  margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: const Text(
                    'Selecione o algoritmo de ordenação',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 19),
                  ),
                ),
                buildAlgorithm(),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 25, 20, 0),
                  child: SizedBox(
                    height: 53,
                    child: ElevatedButton(
                      onPressed: () {
                        if (quant == -1 || algorithm == '') {
                          showAlertDialog(context);
                        } else {
                          sorting();
                        }
                      },
                      child: const Text(
                        'Ordenar',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 19),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromRGBO(241, 100, 31, 1),
                        ),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                TextButton(
                  child: const Text('Sobre o app'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const About(
                          title: 'Sobre',
                        ),
                      ),
                    ).then((_) {
                      setState(() {
                        algorithm = '';
                        quant = -1;
                      });
                    });
                  },
                  style: TextButton.styleFrom(
                    primary: const Color.fromRGBO(241, 100, 31, 1),
                    textStyle: const TextStyle(fontSize: 19),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<String> loadAsset(String filename) async {
    return await rootBundle.loadString('assets/txt/$filename.txt');
  }

  sorting() async {
    String string;
    List<String> listString;
    List<int> listUsed = [];
    List<int> list = [];
    String filename = "";

    switch (quant) {
      case 10:
        filename = "size10";
        break;
      case 100:
        filename = "size100";
        break;
      case 1000:
        filename = "size1000";
        break;
      case 10000:
        filename = "size10000";
        break;
    }

    string = await loadAsset(filename);
    listString = string.split(", ");

    for (var i = 0; i < listString.length; i++) {
      list.add(int.parse(listString[i]));
      listUsed.add(int.parse(listString[i]));
    }

    SortingAlgorithm sortingAlgorithm = SortingAlgorithm();

    switch (algorithm) {
      case 'Bubble Sort':
        sortingAlgorithm.bubbleSort(list);
        break;
      case 'Quick Sort':
        list = sortingAlgorithm.quickSort(list);
        break;
      case 'Merge Sort':
        list = sortingAlgorithm.mergeSort(list);
        break;
      case 'Insertion Sort':
        sortingAlgorithm.insertionSort(list);
        break;
      case 'Selection Sort':
        sortingAlgorithm.selectionSort(list);
        break;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Result(
            title: "Resultado", unsortedlist: listUsed, sortedlist: list),
      ),
    ).then((_) {
      setState(() {
        algorithm = '';
        quant = -1;
      });
    });
  }

  Widget buildAlgorithm() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 10),
      child: Column(
        children: [
          for (var item in [
            'Bubble Sort',
            'Quick Sort',
            'Merge Sort',
            'Insertion Sort',
            'Selection Sort'
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
                  style: const TextStyle(fontSize: 19),
                ),
              ],
            ),
        ],
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    Widget continueButton = TextButton(
      child: const Text('Fechar'),
      onPressed: () {
        Navigator.pop(context);
      },
      style: TextButton.styleFrom(
        primary: const Color.fromRGBO(241, 100, 31, 1),
        textStyle: const TextStyle(
          fontSize: 18,
        ),
      ),
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text(
        'Ops!',
        textAlign: TextAlign.center,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      content: const Text(
        'Selecione a quantidade de elementos que será ordenado e o algoritmo que será utilizado.',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 18),
      ),
      actions: [
        continueButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  Widget buildQuant() {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Row(
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
                  '$item',
                  style: const TextStyle(fontSize: 19),
                ),
              ],
            )
        ],
      ),
    );
  }
}
