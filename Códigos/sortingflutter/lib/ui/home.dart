import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sortingflutter/ui/about.dart';
import 'package:sortingflutter/model/sorting_algorithm.dart';
import 'package:sortingflutter/model/sorting_list.dart';
import 'package:sortingflutter/ui/result.dart';

class Home extends StatefulWidget {
  const Home({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int quant = -1;
  String algorithm = '';
  String type = '';

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) => Material(
        color: Colors.white,
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset('lib/assets/img/icon.png', height: 90),
                  Container(
                    margin: const EdgeInsets.only(bottom: 25),
                    child: const Text(
                      'Análise de desempenho utilizando algortimos de ordenação',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                  ),
                  const Text(
                    'Selecione a quantidade de elementos',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 17),
                  ),
                  buildQuant(),
                  const Text(
                    'Selecione o algoritmo de ordenação',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 17),
                  ),
                  buildAlgorithm(),
                  const Text(
                    'Tipo de Lista',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 17),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        for (var item in ['Pré Determinada', 'Aleatória'])
                          Row(
                            children: [
                              Radio(
                                value: item,
                                groupValue: type,
                                onChanged: (String? value) {
                                  setState(() {
                                    type = value!;
                                  });
                                },
                              ),
                              Text(
                                item,
                                style: const TextStyle(fontSize: 17),
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: SizedBox(
                      height: 53,
                      child: ElevatedButton(
                        onPressed: () {
                          if (quant == -1 || algorithm == '' || type == '') {
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
                              fontSize: 17),
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
                          type = '';
                        });
                      });
                    },
                    style: TextButton.styleFrom(
                      primary: const Color.fromRGBO(241, 100, 31, 1),
                      textStyle: const TextStyle(fontSize: 17),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildQuant() {
    return Container(
      margin: const EdgeInsets.only(bottom: 25),
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
                  style: const TextStyle(fontSize: 17),
                ),
              ],
            ),
        ],
      ),
    );
  }

  Widget buildAlgorithm() {
    return Container(
      margin: const EdgeInsets.only(left: 20, bottom: 25),
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
                  style: const TextStyle(fontSize: 17),
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
        'Selecione a quantidade de elementos que será ordenado, o algoritmo que será utilizado e o tipo de lista.',
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

  sorting() async {
    int timestampInitial = DateTime.now().millisecondsSinceEpoch;

    List<int> list = [];
    List<int> listUsed = [];

    SortingList sortingList = SortingList();

    if (type == 'Pré Determinada') {
      switch (quant) {
        case 10:
          list = sortingList.size10();
          break;
        case 100:
          list = sortingList.size100();
          break;
        case 1000:
          list = sortingList.size1000();
          break;
        case 10000:
          list = sortingList.size10000();
          break;
      }
    } else {
      list = sortingList.randomList(quant);
    }

    for (var i = 0; i < list.length; i++) {
      listUsed.add(list[i]);
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
            title: 'Resultado',
            unsortedlist: listUsed,
            sortedlist: list,
            timestampInitial: timestampInitial),
      ),
    ).then((_) {
      setState(() {
        algorithm = '';
        quant = -1;
        type = '';
      });
    });
  }
}
