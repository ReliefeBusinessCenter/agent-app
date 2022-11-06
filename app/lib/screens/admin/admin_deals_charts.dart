
import 'package:app/model/chart_task.dart';
import 'package:app/translations/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:easy_localization/easy_localization.dart';


class AdminDealsCharts extends StatefulWidget {
  const AdminDealsCharts({ Key? key }) : super(key: key);

  @override
  State<AdminDealsCharts> createState() => _AdminDealsChartsState();
}

class _AdminDealsChartsState extends State<AdminDealsCharts> {
   List<charts.Series<ChartTask, String>>? _seriesPieData =[
     charts.Series(
          data: [
      ChartTask('Car', 26.6, Colors.red),
      ChartTask("Cloths", 15.3, Colors.blue),
      ChartTask("Furniture", 10.8, Colors.yellow),
      ChartTask("Farm", 15.6, Colors.green),
      ChartTask('Electronics', 19.2, Colors.purple),
      ChartTask("Construction", 10.3, Colors.orange)
    ],
          domainFn: (task, _) => task.task,
          measureFn: (task, _) => task.taskValue,
          colorFn: (task, _) => charts.ColorUtil.fromDartColor(task.colorval),
          id: "Deals Task",
          labelAccessorFn: (task, _) => '${task.taskValue}'),
   ];

  @override
  void initState() {
    super.initState();
    // _generateData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Text(
          LocaleKeys.requested_deals_label_text.tr(),
          style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10.0,
        ),
        Expanded(
          child: charts.PieChart<String>(
            _seriesPieData!,
            animate: true,
            animationDuration: Duration(seconds: 1),
            behaviors: [
              charts.DatumLegend(
                outsideJustification: charts.OutsideJustification.endDrawArea,
                horizontalFirst: false,
                desiredMaxRows: 2,
                cellPadding: EdgeInsets.only(
                  right: 4.1,
                  bottom: 4.0,
                ),
                entryTextStyle: charts.TextStyleSpec(
                    color: charts.MaterialPalette.purple.shadeDefault,
                    fontFamily: "Georgia",
                    fontSize: 11),
              )
            ],
            defaultRenderer: charts.ArcRendererConfig(
              arcWidth: 100,
              arcRendererDecorators: [
                charts.ArcLabelDecorator(
                  labelPosition: charts.ArcLabelPosition.inside
                )
              ]
            ),
          ),
        )
      ]),
    );
  }
}