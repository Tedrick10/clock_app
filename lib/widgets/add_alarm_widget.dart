// Flutter: Existing Libraries
import 'package:flutter/material.dart';

// Widgets
import './circle_day_widget.dart';

// AddAlarmWidget StatefulWidget Class
class AddAlarmWidget extends StatefulWidget {
  @override
  _AddAlarmWidgetState createState() => _AddAlarmWidgetState();
}

// _AddAlarmWidgetState State Class
class _AddAlarmWidgetState extends State<AddAlarmWidget> {
  // Normal Properties
  TimeOfDay _selectedTime;
  // ValueChanged<TimeOfDay> _selectTime;

  // Lifecycle Hooks Method
  @override
  void initState() {
    super.initState();
    this._selectedTime = new TimeOfDay(hour: 13, minute: 30);
  }

  // Override Build Method
  @override
  Widget build(BuildContext context) {
    // Returning Widget
    return Scaffold(
      backgroundColor: Color(0xff1b2c57),
      appBar: AppBar(
        backgroundColor: Color(0xff1b2c57),
        title: Column(
          children: [
            Icon(
              Icons.alarm_add,
              color: Color(0xff65d1ba),
            ),
            Text(
              'Add Alarm',
              style: TextStyle(
                color: Color(0xff65d1ba),
                fontSize: 25.0,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 60.0,
            ),
            GestureDetector(
              child: Text(
                this._selectedTime.format(context),
                style: TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              onTap: () {
                this._selectTime(context);
              },
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleDayWidget('Mon', context, false),
                CircleDayWidget('Tue', context, true),
                CircleDayWidget('Wed', context, false),
                CircleDayWidget('Thu', context, true),
                CircleDayWidget('Fri', context, false),
                CircleDayWidget('Sat', context, true),
                CircleDayWidget('Sun', context, false),
              ],
            ),
            SizedBox(
              height: 60,
            ),
            SizedBox(
              height: 2,
              child: Container(
                color: Colors.white30,
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.notifications_none,
                color: Colors.white,
              ),
              title: Text(
                'Alarm Notifications',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 2,
              child: Container(
                color: Colors.white30,
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.check_box,
                color: Colors.white,
              ),
              title: Text(
                'Vibrate',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            FlatButton(
              color: Theme.of(context).accentColor,
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                'Save',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        child: Icon(
          Icons.delete,
          size: 20,
          color: Theme.of(context).accentColor,
        ),
        onPressed: () {
          return Navigator.of(context).pop();
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: this._selectedTime,
    );

    setState(() {
      this._selectedTime = picked;
    });
  }
}
