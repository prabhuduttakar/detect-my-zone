import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import '../functions.dart';

class SelfAware extends StatefulWidget {
  @override
  _SelfAwareState createState() => _SelfAwareState();
}

class _SelfAwareState extends State<SelfAware> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kThemeOffWhite,
      appBar: AppBar(
        title: Text(
          'Self Aware',
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Container(
        child: SafeArea(
          child: ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  SizedBox(
                    child: Container(
                      width: double.infinity,
                      margin: EdgeInsets.all(5.0),
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        'Symptoms',
                        style: TextStyle(
                          color: Colors.black.withAlpha(180),
                          fontFamily: 'OpenSans',
                          fontSize: 25.0,
                          fontWeight: FontWeight.w600,
                          //letterSpacing: 0.0,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 4,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: symptomBox(1),
                        ),
                        Expanded(
                          child: symptomBox(2),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 4,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: symptomBox(3),
                        ),
                        Expanded(
                          child: symptomBox(4),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    child: Container(
                      width: double.infinity,
                      margin: EdgeInsets.all(5.0),
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        'Prevention',
                        style: TextStyle(
                          color: Colors.black.withAlpha(180),
                          fontFamily: 'OpenSans',
                          fontSize: 25.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 4,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: symptomBox(5),
                        ),
                        Expanded(
                          child: symptomBox(6),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 4,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: symptomBox(7),
                        ),
                        Expanded(
                          child: symptomBox(8),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
