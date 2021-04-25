import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//Homescreen Option Box
boxStyle(int number) {
  return Container(
    margin: EdgeInsets.all(10.0),
    padding: EdgeInsets.all(10.0),
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage('images/$number.png'),
        fit: BoxFit.contain,
      ),
      color: Colors.white,
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(20.0),
        bottomRight: Radius.circular(20.0),
        topLeft: Radius.circular(20.0),
        topRight: Radius.circular(20.0),
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 1,
          blurRadius: 4,
          offset: Offset(0, 3), // changes position of shadow
        ),
      ],
    ),
  );
}

//Symptom Box
symptomBox(int number) {
  return Container(
    margin: EdgeInsets.all(10.0),
    padding: EdgeInsets.all(10.0),
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage('images/s-$number.png'),
        fit: BoxFit.contain,
      ),
      color: Colors.white,
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(20.0),
        bottomRight: Radius.circular(20.0),
        topLeft: Radius.circular(20.0),
        topRight: Radius.circular(20.0),
      ),
//      boxShadow: [
//        BoxShadow(
//          color: Colors.grey.withOpacity(0.5),
//          spreadRadius: 1,
//          blurRadius: 4,
//          offset: Offset(0, 3), // changes position of shadow
//        ),
//      ],
    ),
  );
}
