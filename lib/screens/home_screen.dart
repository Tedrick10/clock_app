// Dart: Properties
import 'dart:async';

// Flutter: Existing Libraries
import 'package:flutter/material.dart';

// Flutter: External Libraries
import 'package:intl/intl.dart';

// Styles
import '../styles/shapes_painter_style.dart';

// Widgets
import '../widgets/alarm_item_widget.dart';

// HomeScreen StatefulWidget Class
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

// _HomeScreenState State Class
class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  // Normal Properties
  String _timeString;
  TabController _tabController;

  // Lifecycle Hooks Methods
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this._tabController = new TabController(
      length: 4,
      vsync: this,
      initialIndex: 0,
    );

    this._timeString = this._formatDateTime(DateTime.now());
    Timer.periodic(
      Duration(seconds: 1),
      (Timer t) {
        return this._getTime();
      },
    );
  }

  // Normal Methods
  void _getTime() {
    final DateTime now = new DateTime.now();
    final String formattedDateTime = this._formatDateTime(now);

    setState(() {
      this._timeString = formattedDateTime;
    });
  }

  String _formatDateTime(DateTime dateTime) {
    return DateFormat('hh:mm').format(dateTime).toString();
  }

  // Build Method
  @override
  Widget build(BuildContext context) {
    // Returning Widgets
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text(''),
          backgroundColor: Theme.of(context).primaryColor,
          bottom: TabBar(
            controller: this._tabController,
            indicatorColor: Theme.of(context).accentColor,
            indicatorWeight: 4.0,
            tabs: <Widget>[
              Tab(
                icon: Icon(
                  Icons.access_time,
                ),
                text: 'Clock',
              ),
              Tab(
                icon: Icon(
                  Icons.alarm,
                ),
                text: 'Alarm',
              ),
              Tab(
                icon: Icon(
                  Icons.hourglass_empty,
                ),
                text: 'Timer',
              ),
              Tab(
                icon: Icon(
                  Icons.timer,
                ),
                text: 'Stopwatch',
              ),
            ],
          ),
        ),
        body: Container(
          color: Theme.of(context).primaryColor,
          child: TabBarView(
            controller: this._tabController,
            children: <Widget>[
              // Clock
              Container(
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CustomPaint(
                          painter: ShapesPainterStyle(),
                          child: Container(
                            height: 500.0,
                            width: double.infinity,
                          ),
                        ),
                      ),
                      Text(
                        this._timeString.toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                child: ListView(
                  children: <Widget>[
                    AlarmItemWidget(
                      this._timeString,
                      true,
                    ),
                    AlarmItemWidget(
                      this._timeString,
                      true,
                    ),
                    AlarmItemWidget(
                      this._timeString,
                      true,
                    ),
                    AlarmItemWidget(
                      this._timeString,
                      true,
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Hi'),
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Hi'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: this._bottomButtons(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }

  Widget _bottomButtons() {
    return (this._tabController.index == 1)
        ? FloatingActionButton(
            onPressed: () => Navigator.pushNamed(
              context,
              '/add-alarm',
            ),
            backgroundColor: Color(0xff65d1ba),
            child: Icon(
              Icons.add,
              size: 20.0,
            ),
          )
        : null;
  }
}
