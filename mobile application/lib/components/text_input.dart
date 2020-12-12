import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smart_energy_meter/notifications/notification_dialog.dart';

class TextTimeInput extends StatefulWidget {
  final String text;
  TextTimeInput(this.text);

  @override
  _TextTimeInputState createState() => _TextTimeInputState();
}

class _TextTimeInputState extends State<TextTimeInput> {
  DateTime selectedDate = DateTime.now();
  DateTime k;

  final DateFormat dateFormat = DateFormat('yyyy/MM/dd   HH:mm');
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        showDateTimeDialog(context, initialDate: selectedDate,
            onSelectedDate: (selectedDate) {
          setState(() {
            this.selectedDate = selectedDate;
            k = selectedDate;
            print(this.selectedDate);
          });
        });
      },
      child: AbsorbPointer(
        child: TextFormField(
          autocorrect: true,
          decoration: InputDecoration(
            labelText: (widget.text == 'TO')
                ? '${widget.text}\t\t\t\t\t\t\t\t\t\t\t\t\t ${dateFormat.format(selectedDate)}'
                : '${widget.text}\t\t\t\t\t\t\t\t ${dateFormat.format(selectedDate)}',
            labelStyle: TextStyle(
                color: Color(0xff4A306D),
                fontSize: 18,
                fontWeight: FontWeight.w500),
            //suffix: Text('FROM $selectedDate'),
            suffixIcon: Icon(
              Icons.access_time,
              color: Colors.deepPurple,
              size: 30,
            ),
            hintText: widget.text,
            hintStyle: TextStyle(color: Colors.grey, fontSize: 18),
            filled: true,
            fillColor: Colors.white70,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12.0)),
              borderSide: BorderSide(color: Colors.deepPurple, width: 2),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(color: Color(0xff4A306D)),
            ),
          ),
        ),
      ),
    );
  }
}
