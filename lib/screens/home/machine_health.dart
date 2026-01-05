import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class Health extends StatefulWidget {
  final Widget child;

  Health({Key key, this.child}) : super(key: key);

  _HealthState createState() => _HealthState();
}

class _HealthState extends State<Health> {
  List<charts.Series<Temperature, String>> _seriesData;
  List<charts.Series<Vibration, String>> _seriesPieData;


  _generateData() {
    var data1 = [
      new Temperature(1905, 's1', 30),
      new Temperature(1002, 's2', 40),
      new Temperature(1820, 's3', 10),
    ];


    var piedata = [
      new Vibration('s1', 35.8, Color(0xff3366cc)),
      new Vibration('s2', 8.3, Color(0xff990099)),
      new Vibration('s3', 10.8, Color(0xff109618)),
      new Vibration('s4', 15.6, Color(0xfffdbe19)),
    ];

    _seriesData.add(
      charts.Series(
        domainFn: (Temperature temperature, _) => temperature.sensor,
        measureFn: (Temperature temperature, _) => temperature.value,
        id: '2017',
        data: data1,
        fillPatternFn: (_, __) => charts.FillPatternType.solid,
        fillColorFn: (Temperature temperature, _) =>
            charts.ColorUtil.fromDartColor(Color(0xff990099)),
      ),
    );

    _seriesPieData.add(
      charts.Series(
        domainFn: (Vibration vib, _) => vib.sensor,
        measureFn: (Vibration vib, _) => vib.vibvalue,
        colorFn: (Vibration vib, _) => charts.ColorUtil.fromDartColor(vib.colorval),
        id: 'vibration',
        data: piedata,
        labelAccessorFn: (Vibration row, _) => '${row.vibvalue}',
      ),
    );
  }

  @override
  void initState() {
    //TODO_implement initState
    super.initState();
    _seriesData = List<charts.Series<Temperature, String>>();
    _seriesPieData = List<charts.Series<Vibration, String>>();
    _generateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue[400],
            //backgroundColor: Color(0xff308e1c),
            // actions: <Widget>[
            //   FlatButton.icon(
            //     icon: Icon(Icons.arrow_back),
            //     label: Text('Back'),
            //     onPressed: () {
            //           Navigator.of(context)
            //           .push(
            //             MaterialPageRoute(builder: (context) => Home()),
            //           );
            //         }
            //     ),
            //   ] , 
            bottom: TabBar(
              indicatorColor: Color(0xff9962D0),
              tabs: [
                Tab(
                  icon: Icon(FontAwesomeIcons.solidChartBar),),
                Tab(icon: Icon(FontAwesomeIcons.chartPie)),
              ],
            ),
            title: Text('Machine Health'),
          ),
          body: TabBarView(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Text(
                          'Temperature',style: TextStyle(fontSize: 24.0,fontWeight: FontWeight.bold),),
                        Expanded(
                          child: charts.BarChart(
                            _seriesData,
                            animate: true,
                            barGroupingType: charts.BarGroupingType.grouped,
                            animationDuration: Duration(seconds: 5),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Text(
                          'Vibration',style: TextStyle(fontSize: 24.0,fontWeight: FontWeight.bold),),
                        SizedBox(height: 10.0,),
                        Expanded(
                          child: charts.PieChart(
                              _seriesPieData,
                              animate: true,
                              animationDuration: Duration(seconds: 4),
                              behaviors: [
                                new charts.DatumLegend(
                                  outsideJustification: charts.OutsideJustification.endDrawArea,
                                  horizontalFirst: false,
                                  desiredMaxRows: 2,
                                  cellPadding: new EdgeInsets.only(right: 4.0, bottom: 4.0),
                                  entryTextStyle: charts.TextStyleSpec(
                                      color: charts.MaterialPalette.purple.shadeDefault,
                                      fontFamily: 'Georgia',
                                      fontSize: 11),
                                )
                              ],
                              defaultRenderer: new charts.ArcRendererConfig(
                                  arcWidth: 100,
                                  arcRendererDecorators: [
                                    new charts.ArcLabelDecorator(
                                        labelPosition: charts.ArcLabelPosition.inside)
                                  ])),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Temperature {
  String sensor;
  int time;
  int value;

  Temperature(this.time, this.sensor, this.value);
}

class Vibration {
  String sensor;
  double vibvalue;
  Color colorval;

  Vibration(this.sensor, this.vibvalue, this.colorval);
}
