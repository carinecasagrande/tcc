import 'package:flutter/material.dart';

class About extends StatelessWidget {
  final String title;
  const About({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) => Material(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 50),
          child: Container(
            decoration: const BoxDecoration(color: Colors.white),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 90),
                  child: const Text(
                    'Versão: Flutter',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 50),
                  child: const Text(
                    'Carine Casa Grande',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 19),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 50, 20, 0),
                  child: const Text(
                    'Comparação entre o desempenho de aplicações para smartphones desenvolvidos em Flutter e React Native:',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: const Text(
                    'Uma análise utilizando algoritmos de ordenação',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 19),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 40, right: 20, left: 20),
                  child: const Text(
                    'Trabalho de Conclusão de Curso apresentado ao Curso de Ciência da Computação do Centro Universitário Filadélfia – UniFil, como requisito parcial à obtenção do título de Bacharel em Ciência da Computação.\n\nOrientadora: Profª. Simone Sawasaki Tanaka',
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 19),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 40),
                  child: const Text(
                    'Londrina\n2021',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 19),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 30, 20, 10),
                  child: SizedBox(
                    height: 53,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Página Inicial',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 19,
                            fontWeight: FontWeight.bold),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
