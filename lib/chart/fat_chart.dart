import 'package:flutter/material.dart';
import 'fat_model.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:intl/intl.dart';



class FatChart extends StatelessWidget {
  final List<FatModel> data;

  FatChart({this.data});

  @override
  Widget build(BuildContext context) {
    List<charts.Series<FatModel, String>> series = [
      charts.Series(
          seriesColor: charts.ColorUtil.fromDartColor(Color(0XFFC74DD4)),
          id: 'FatList',
          data: data,
          domainFn: (FatModel series, _) => DateFormat("dd.MM").format(series.date),
          measureFn: (FatModel series, _) => series.fatResult,
          labelAccessorFn: (FatModel series, _) =>
          '${series.fatResult.toString()}\%'
      )
    ];

    return charts.BarChart(
      series,
      animate: true,

      barRendererDecorator: new charts.BarLabelDecorator<String>(
        insideLabelStyleSpec: new charts.TextStyleSpec(fontFamily: 'RubikR',fontSize: 12),
      ),
//      defaultRenderer: new charts.BarRendererConfig(
//          cornerStrategy: const charts.ConstCornerStrategy(60)),
    );
  }
}
