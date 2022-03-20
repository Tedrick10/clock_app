// Flutter: Existing Libraries
import 'package:flutter/material.dart';

// CircleDayWidget
Widget CircleDayWidget(String day, BuildContext context, bool enabled) {
  return Container(
    width: 50,
    height: 50,
    decoration: BoxDecoration(
      color: (enabled == true)
          ? Theme.of(context).accentColor
          : Colors.transparent,
      borderRadius: BorderRadiusDirectional.circular(100),
    ),
    child: Padding(
      padding: EdgeInsets.all(10),
      child: Center(child: Text(day, style: TextStyle(color: Colors.white, fontSize: 20,),),),
    ),
  );
}
