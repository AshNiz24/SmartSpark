import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final String text;
  final Function fn;
  RoundButton(this.text, this.fn);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: fn,
      child: Container(
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.pink,
              blurRadius: 2.0,
              spreadRadius: 0.0,
              offset: Offset(2.0, 2.0), // shadow direction: bottom right
            )
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
              color: Color(0xffFDBBD6),
              borderRadius: BorderRadius.circular(40)),
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Text(
                  text,
                  style: TextStyle(
                    shadows: [
                      Shadow(
                        color: Colors.pink,
                        offset: Offset(0, 1),
                        blurRadius: 3,
                      )
                    ],
                    color: Colors.pink,
                    fontFamily: 'Montserrat',
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 1,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
