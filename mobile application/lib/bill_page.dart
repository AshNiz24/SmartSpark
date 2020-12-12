import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'components/round_button.dart';
import 'components/row.dart';
import 'brain/brain.dart';

class BillPage extends StatelessWidget {
  final Brain brain = new Brain();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: ListView(
            padding: EdgeInsets.all(10),
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              Text(
                'Monthly bill as per calculated units',
                textAlign: TextAlign.center,
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Color(0xff77A7EF),
                    fontSize: 28,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: (MediaQuery.of(context).size.height) * 0.45,
                  decoration: BoxDecoration(
                    color: Color(0xFFFDEECC),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  //color: Color(0xffB80025).withOpacity(0.9),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: ListView(
                          //mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RowFn('ELECTRICITY SLAB',
                                'Rs. ${brain.slab(brain.units)}/units'),
                            SizedBox(
                              height: 10,
                            ),
                            RowFn('ENERGY CONSUMED', '${brain.units} units'),
                            SizedBox(
                              height: 10,
                            ),
                            RowFn('FIXED CHARGE',
                                'Rs${brain.fixedCharge(brain.units)}'),
                            SizedBox(
                              height: 10,
                            ),
                            RowFn('AMOUNT', 'Rs.${brain.cost(brain.units)}'),
                            SizedBox(
                              height: 10,
                            ),
                            RowFn('TAX(total)', 'Rs.${brain.sTax}'),
                            SizedBox(
                              height: 10,
                            ),
                            RowFn('NET TOTAL', 'Rs.${brain.sNet}'),
                          ]),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: RoundButton(
                  'BACK',
                  () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
