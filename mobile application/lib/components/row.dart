import 'package:flutter/material.dart';

class RowFn extends StatelessWidget {
  final String keys;
  final String values;
  RowFn(this.keys, this.values);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  keys,
                  style: TextStyle(
                      color: Colors.deepPurple,
                      fontFamily: 'Montserrat',
                      letterSpacing: 0.5,
                      fontSize: 15,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  values,
                  style: TextStyle(
                      color: Colors.deepPurple,
                      fontFamily: 'Montserrat',
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.5),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
