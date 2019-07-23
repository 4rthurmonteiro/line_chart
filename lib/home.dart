import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:line_chart/icon_rendered.dart';
import 'package:line_chart/linear_sales.dart';
import 'package:line_chart/ordinal_sales.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static List<charts.Series<LinearSales, int>> _createSampleData() {
    final myFakeDesktopData = [
      new LinearSales(0, 5),
      new LinearSales(1, 25),
      new LinearSales(2, 100),
      new LinearSales(3, 75),
    ];

    var myFakeTabletData = [
      new LinearSales(0, 10),
      new LinearSales(1, 50),
      new LinearSales(2, 200),
      new LinearSales(3, 150),
    ];

    var myFakeMobileData = [
      new LinearSales(0, 15),
      new LinearSales(1, 75),
      new LinearSales(2, 300),
      new LinearSales(3, 225),
    ];

    return [
      new charts.Series<LinearSales, int>(
        id: 'Desktop',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: myFakeDesktopData,
      ),
      new charts.Series<LinearSales, int>(
        id: 'Tablet',
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: myFakeTabletData,
      ),
      new charts.Series<LinearSales, int>(
        id: 'Mobile',
        colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: myFakeMobileData,
      )
    ];
  }

  /// Create series list with multiple series
  static List<charts.Series<OrdinalSales, String>> _createSampleData2() {
    final desktopSalesData = [
      new OrdinalSales('2014', 5),
      new OrdinalSales('2015', 25),
      new OrdinalSales('2016', 100),
      new OrdinalSales('2017', 75),
    ];

    final tableSalesData = [
      new OrdinalSales('2014', 25),
      new OrdinalSales('2015', 50),
      new OrdinalSales('2016', 10),
      new OrdinalSales('2017', 20),
    ];

    final mobileSalesData = [
      new OrdinalSales('2014', 10),
      new OrdinalSales('2015', 15),
      new OrdinalSales('2016', 50),
      new OrdinalSales('2017', 45),
    ];

//    final desktopTargetLineData = [
//      new OrdinalSales('2014', 4),
//      new OrdinalSales('2015', 20),
//      new OrdinalSales('2016', 80),
//      new OrdinalSales('2017', 65),
//    ];
//
//    final tableTargetLineData = [
//      new OrdinalSales('2014', 30),
//      new OrdinalSales('2015', 55),
//      new OrdinalSales('2016', 15),
//      new OrdinalSales('2017', 25),
//    ];
//
//    final mobileTargetLineData = [
//      new OrdinalSales('2014', 10),
//      new OrdinalSales('2015', 5),
//      new OrdinalSales('2016', 45),
//      new OrdinalSales('2017', 35),
//    ];

    return [
      new charts.Series<OrdinalSales, String>(
        id: 'Desktop',
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: desktopSalesData,
      ),
      new charts.Series<OrdinalSales, String>(
        id: 'Tablet',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: tableSalesData,
      ),
      new charts.Series<OrdinalSales, String>(
        id: 'Mobile',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: mobileSalesData,

      ),
//      new charts.Series<OrdinalSales, String>(
//        id: 'Desktop Target Line',
//        domainFn: (OrdinalSales sales, _) => sales.year,
//        measureFn: (OrdinalSales sales, _) => sales.sales,
//        data: desktopTargetLineData,
//      )
//      // Configure our custom bar target renderer for this series.
//        ..setAttribute(charts.rendererIdKey, 'customTargetLine'),
//      new charts.Series<OrdinalSales, String>(
//        id: 'Tablet Target Line',
//        domainFn: (OrdinalSales sales, _) => sales.year,
//        measureFn: (OrdinalSales sales, _) => sales.sales,
//        data: tableTargetLineData,
//      )
//      // Configure our custom bar target renderer for this series.
//        ..setAttribute(charts.rendererIdKey, 'customTargetLine'),
//      new charts.Series<OrdinalSales, String>(
//        id: 'Mobile Target Line',
//        domainFn: (OrdinalSales sales, _) => sales.year,
//        measureFn: (OrdinalSales sales, _) => sales.sales,
//        data: mobileTargetLineData,
//      )
//      // Configure our custom bar target renderer for this series.
//        ..setAttribute(charts.rendererIdKey, 'customTargetLine'),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          SizedBox(
            width: 1000,
            height: 400,
            child: new charts.LineChart(_createSampleData(), animate: false),
          ),
          Divider(),
          SizedBox(
            width: 1000,
            height: 400,
            child: new charts.LineChart(_createSampleData(), animate: false),
          ),
          Divider(),
          SizedBox(
            width: 1000,
            height: 400,
            child: new charts.BarChart(_createSampleData2(),
                animate: false,
                barGroupingType: charts.BarGroupingType.grouped,
                behaviors: [
                  new charts.SeriesLegend(
                    // Positions for "start" and "end" will be left and right respectively
                    // for widgets with a build context that has directionality ltr.
                    // For rtl, "start" and "end" will be right and left respectively.
                    // Since this example has directionality of ltr, the legend is
                    // positioned on the right side of the chart.
                    position: charts.BehaviorPosition.top
                    ,
                    // By default, if the position of the chart is on the left or right of
                    // the chart, [horizontalFirst] is set to false. This means that the
                    // legend entries will grow as new rows first instead of a new column.
                    horizontalFirst: true,
                    // This defines the padding around each legend entry.
                    // Set show measures to true to display measures in series legend,
                    // when the datum is selected.
                    // Optionally provide a measure formatter to format the measure value.
                    // If none is specified the value is formatted as a decimal.
                    entryTextStyle: charts.TextStyleSpec(
                        color: charts.MaterialPalette.purple.shadeDefault,
                        fontFamily: 'Georgia',
                        fontSize: 11),
                  )
                ],
                defaultRenderer: new charts.BarRendererConfig(
                  symbolRenderer: new IconRenderer(Icons.cloud),
                ),
//                customSeriesRenderers: [
//                  new charts.BarTargetLineRendererConfig<String>(
//                    // ID used to link series to this renderer.
//                      customRendererId: 'customTargetLine',
//                      groupingType: charts.BarGroupingType.grouped,
//                    symbolRenderer: new IconRenderer(Icons.wb_sunny),
//
//                  ),
//
//
//                ]
            ),
          )
        ],
      ),
    );
  }
}
