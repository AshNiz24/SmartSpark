import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:smart_energy_meter/components/round_button.dart';
import 'package:charts_flutter/flutter.dart' as charts;
//import 'package:intl/intl.dart';

class Consumption extends StatefulWidget {
  @override
  _ConsumptionState createState() {
    return _ConsumptionState();
  }
}

class _ConsumptionState extends State<Consumption> {
  //final DateFormat dateFormat = DateFormat('yyyy-MM-dd HH:mm');
  List<charts.Series<ConsumptionData, String>> _seriesBarData;
  List<ConsumptionData> mydata;
  _generateData(mydata) {
    _seriesBarData = List<charts.Series<ConsumptionData, String>>();
    _seriesBarData.add(
      charts.Series(
        labelAccessorFn: (ConsumptionData consumption, _) =>
            "${consumption.units}",

        domainFn: (ConsumptionData consumption, _) =>
            consumption.timestamp.substring(10),
        measureFn: (ConsumptionData consumption, _) => consumption.units,
        colorFn: (ConsumptionData barColour, _) =>
            charts.ColorUtil.fromDartColor(Colors.deepPurple),
        id: 'Consumption',
        data: mydata,
        //labelAccessorFn: (LuminData row, _) => "${row.timestamp}",
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Energy Consumption'),
        backgroundColor: Color(0xff77A7EF),
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance
          .collection('database')
          .orderBy('dateTime')
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return LinearProgressIndicator();
        } else {
          List<ConsumptionData> consumption = snapshot.data.documents
              .map((documentSnapshot) =>
                  ConsumptionData.fromMap(documentSnapshot.data))
              .toList();
          print(consumption);
          return _buildChart(context, consumption);
        }
      },
    );
  }

  Widget _buildChart(BuildContext context, List<ConsumptionData> saledata) {
    mydata = saledata;
    _generateData(mydata);
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(
                'Consumption per hour',
                style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff77A7EF)),
              ),
              SizedBox(
                height: 10.0,
              ),
              Expanded(
                child: charts.BarChart(
                  _seriesBarData,
                  animate: true,
                  animationDuration: Duration(seconds: 5),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              RoundButton('BACK', () {
                Navigator.pop(context);
              })
            ],
          ),
        ),
      ),
    );
  }
}

class ConsumptionData {
  final double units;
  final String timestamp;
  ConsumptionData(this.units, this.timestamp);

  ConsumptionData.fromMap(Map<String, dynamic> map)
      : assert(map['units'] != null),
        assert(map['dateTime'] != null),
        units = map['units'],
        timestamp = map['dateTime'];

  @override
  String toString() => "Record<$units:$timestamp>";
}
