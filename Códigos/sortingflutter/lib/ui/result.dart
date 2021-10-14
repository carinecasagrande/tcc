import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:sortingflutter/model/chart_data.dart';
import 'package:sortingflutter/ui/about.dart';

class Result extends StatelessWidget {
  final String title;
  final List<num> unsortedlist;
  final List<num> sortedlist;

  const Result(
      {Key? key,
      required this.title,
      required this.unsortedlist,
      required this.sortedlist})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<ChartData> unsorted = [];
    for (var i = 0; i < unsortedlist.length; i++) {
      unsorted
          .add(ChartData(label: "${unsortedlist[i]}", number: unsortedlist[i]));
    }

    final List<ChartData> sorted = [];
    for (var i = 0; i < sortedlist.length; i++) {
      sorted.add(ChartData(label: "${sortedlist[i]}", number: sortedlist[i]));
    }

    List<charts.Series<ChartData, String>> unsortedChart = [
      charts.Series(
        id: "Ordem Inicial",
        data: unsorted,
        domainFn: (ChartData unsortedChart, _) => unsortedChart.label,
        measureFn: (ChartData unsortedChart, _) => unsortedChart.number,
        seriesColor: charts.ColorUtil.fromDartColor(
          const Color.fromRGBO(170, 170, 170, 1),
        ),
      )
    ];

    List<charts.Series<ChartData, String>> sortedChart = [
      charts.Series(
        id: "Ordem final",
        data: sorted,
        domainFn: (ChartData sortedChart, _) => sortedChart.label,
        measureFn: (ChartData sortedChart, _) => sortedChart.number,
        seriesColor: charts.ColorUtil.fromDartColor(
          const Color.fromRGBO(170, 170, 170, 1),
        ),
      )
    ];

    return LayoutBuilder(
      builder: (_, constraints) => Material(
        color: Colors.white,
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.9,
                    padding: const EdgeInsets.all(20),
                    child: Card(
                      margin: EdgeInsets.zero,
                      elevation: 0,
                      child: Column(
                        children: <Widget>[
                          const Text(
                            "Ordem Inicial",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          ),
                          Expanded(
                            child: charts.BarChart(
                              unsortedChart,
                              animate: true,
                              domainAxis: const charts.OrdinalAxisSpec(
                                renderSpec: charts.SmallTickRendererSpec(
                                  labelStyle: charts.TextStyleSpec(
                                      fontSize: 0,
                                      color: charts.MaterialPalette.black),
                                ),
                              ),
                              primaryMeasureAxis: const charts.NumericAxisSpec(
                                renderSpec: charts.GridlineRendererSpec(
                                  labelStyle: charts.TextStyleSpec(
                                      fontSize: 0,
                                      color: charts.MaterialPalette.black),
                                ),
                              ),
                            ),
                          ),
                          const Text(
                            "Ordem Inicial",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          ),
                          Expanded(
                            child: charts.BarChart(
                              sortedChart,
                              animate: true,
                              domainAxis: const charts.OrdinalAxisSpec(
                                renderSpec: charts.SmallTickRendererSpec(
                                  labelStyle: charts.TextStyleSpec(
                                      fontSize: 0,
                                      color: charts.MaterialPalette.black),
                                ),
                              ),
                              primaryMeasureAxis: const charts.NumericAxisSpec(
                                renderSpec: charts.GridlineRendererSpec(
                                  labelStyle: charts.TextStyleSpec(
                                      fontSize: 0,
                                      color: charts.MaterialPalette.black),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 25),
                            child: SizedBox(
                              height: 53,
                              width: MediaQuery.of(context).size.width,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text(
                                  'Voltar',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17),
                                ),
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                    const Color.fromRGBO(241, 100, 31, 1),
                                  ),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: TextButton(
                              child: const Text('Sobre o app'),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const About(
                                      title: 'Sobre',
                                    ),
                                  ),
                                );
                              },
                              style: TextButton.styleFrom(
                                primary: const Color.fromRGBO(241, 100, 31, 1),
                                textStyle: const TextStyle(fontSize: 17),
                              ),
                            ),
                          ),
                        ],
                      ),
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
}
