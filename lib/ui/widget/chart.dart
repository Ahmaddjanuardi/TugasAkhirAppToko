// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';

// class Chart extends StatefulWidget {
//   const Chart({super.key});

//   @override
//   State<Chart> createState() => _ChartState();
// }

// class _ChartState extends State<Chart> {
//   @override
//   Widget build(BuildContext context) {
//     return Builder(
// builder: (context) {
// final List<Map> chartData = [
// {
// "year": 2018,
// "sales": 40,
// },
// {
// "year": 2019,
// "sales": 90,
// },
// {
// "year": 2020,
// "sales": 30,
// },
// {
// "year": 2021,
// "sales": 80,
// },
// {
// "year": 2022,
// "sales": 90,
// }
// ];

// return Container(
// color: Theme.of(context).cardColor,
// padding: const EdgeInsets.all(12.0),
// child: SfCartesianChart(
// isTransposed: true,
// primaryXAxis: NumericAxis(
// decimalPlaces: 0,
// ),
// series: <ChartSeries>[
// BarSeries<Map, int>(
// dataSource: chartData,
// xValueMapper: (Map data, _) => data["year"],
// yValueMapper: (Map data, _) => data["sales"],
// )
// ],
// ),
// );
// },
// );
//   }
// }

