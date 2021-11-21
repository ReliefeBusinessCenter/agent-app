import 'package:app/model/chart_task.dart';
import 'package:app/translations/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:easy_localization/easy_localization.dart';

class AdminDeliveryCharts extends StatefulWidget {
  const AdminDeliveryCharts({Key? key}) : super(key: key);

  @override
  AdminDeliveryChartsState createState() => AdminDeliveryChartsState();
}

class AdminDeliveryChartsState extends State<AdminDeliveryCharts> {
  
   List<charts.Series<ChartTask, String>>? _seriesPieData =[
     charts.Series(
          data: [
      ChartTask('Cat-1', 35.6, Colors.red),
      ChartTask("Cat-2", 8.3, Colors.blue),
      ChartTask("Cat-3", 10.8, Colors.yellow),
      ChartTask("Cat-4", 15.6, Colors.green),
      ChartTask('Cat-5', 19.2, Colors.purple),
      ChartTask("Cat-6", 10.3, Colors.orange),
    ],
          domainFn: (task, _) => task.task,
          measureFn: (task, _) => task.taskValue,
          colorFn: (task, _) => charts.ColorUtil.fromDartColor(task.colorval),
          id: "Delivery Task",
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
          LocaleKeys.requested_deliveries_label_text.tr(),
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
