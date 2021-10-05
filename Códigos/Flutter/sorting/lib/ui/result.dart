import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:sorting/model/chart_data.dart';

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
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 50, top: 50),
          child: Container(
            decoration: const BoxDecoration(color: Colors.white),
            child: Center(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.9,
                padding: const EdgeInsets.all(20),
                child: Card(
                  shadowColor: Colors.white,
                  borderOnForeground: false,
                  elevation: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        const Text(
                          "Ordem Inicial",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 19),
                        ),
                        Expanded(
                          child: charts.BarChart(
                            unsortedChart,
                            animate: false,
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
                              fontWeight: FontWeight.bold, fontSize: 19),
                        ),
                        Expanded(
                          child: charts.BarChart(
                            sortedChart,
                            animate: false,
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
                          padding: const EdgeInsets.fromLTRB(20, 25, 20, 0),
                          child: SizedBox(
                            height: 53,
                            width: MediaQuery.of(context).size.width,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text(
                                'Págna Inicial',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 19),
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
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
