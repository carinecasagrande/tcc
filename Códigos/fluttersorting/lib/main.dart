import 'package:flutter/material.dart';
import 'package:fluttersorting/ui/home.dart';

void main() {
  runApp(const Sorting());
}

class Sorting extends StatelessWidget {
  const Sorting({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sorting',
      theme: ThemeData(
        fontFamily: 'Poppins',
        toggleableActiveColor: const Color.fromRGBO(241, 100, 31, 1),
      ),
      debugShowCheckedModeBanner: false,
      home: const Home(title: 'Página Inicial'),
    );
  }
}
