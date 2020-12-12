import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'components/round_button.dart';
import 'package:intl/intl.dart';
import 'duration_page.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'graph/consumption.dart';
//import 'package:universal_html/html.dart' as html;
//import 'dart:convert';

DateTime dateTime = DateTime.now();
final DateFormat dateFormat = DateFormat('dd-MM-yyyy');
final DateFormat time = DateFormat('HH:mm');

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ListView(children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)),
            child: Container(
              margin: EdgeInsets.only(
                bottom: 6,
              ),
              height: (MediaQuery.of(context).size.height) * 0.3,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'WELCOME TO \nSMART SPARK',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color(0xffFEFDFF),
                          fontSize: 34,
                          fontWeight: FontWeight.bold),
                    ),
                    SvgPicture.asset(
                      "images/power.svg",
                      color: Colors.yellowAccent,
                      height: (MediaQuery.of(context).size.height) * 0.09,
                      width: (MediaQuery.of(context).size.width) * 0.09,
                    ),
                  ],
                ),
              ),
              decoration: BoxDecoration(
                color: Color(0xff77A7EF),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0, 22.0), //(x,y)
                    blurRadius: 6.0,
                  ),
                ],
              ),
              width: double.infinity,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              child: Container(
                margin: EdgeInsets.only(bottom: 6),
                height: (MediaQuery.of(context).size.height) * 0.15,
                width: (MediaQuery.of(context).size.width) * 0.8,
                decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 22.0), //(x,y)
                        blurRadius: 10.0,
                      )
                    ]),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      '${dateFormat.format(dateTime)}',
                      style: TextStyle(
                        color: Color(0xffFFFFF0),
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          SvgPicture.asset(
            "images/gauge.svg",
            color: Colors.deepPurple,
            height: (MediaQuery.of(context).size.height) * 0.2,
            width: (MediaQuery.of(context).size.width) * 0.2,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: RoundButton(
              'GENERATE BILL',
              () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DurationPage()));
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: RoundButton(
              'VIEW CONSUMPTION',
              () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Consumption()));
//                html.window.open(
//                    "https://stackoverflow.com/questions/43149055/how-do-i-open-a-web-browser-url-from-my-flutter-code",
//                    "consumption");
              },
            ),
          ),
        ]),
      ),
    );
  }
}
