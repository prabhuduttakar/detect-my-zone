import 'dart:ui';

import 'package:covid19/screen/statelist.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:async_loader/async_loader.dart';
import '../constants.dart';
import 'countrylist.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Statistics extends StatefulWidget {
  @override
  StatisticsState createState() => StatisticsState();
}

class StatisticsState extends State<Statistics> {
  final GlobalKey<AsyncLoaderState> asyncLoaderState =
      new GlobalKey<AsyncLoaderState>();

  String totalCase = '-';
  String totalRecovered = '-';
  String totalDeath = '-';
  String indiaCase = '-';
  String indiaRecovered = '-';
  String indiaDeath = '-';
  var decodeddata;
  var indiadata;

  Future<String> getData() async {
    var response = await http.get(
      Uri.encodeFull("https://corona.lmao.ninja/v2/all"),
    );

    var indiaresponse = await http.get(
      Uri.encodeFull("https://corona.lmao.ninja/v2/countries"),
    );

    this.setState(() {
      decodeddata = jsonDecode(response.body);
      indiadata = jsonDecode(indiaresponse.body);

      totalCase = decodeddata['cases'].toString();
      totalRecovered = decodeddata['recovered'].toString();
      totalDeath = decodeddata['deaths'].toString();

      indiaCase = indiadata[93]['cases'].toString();
      indiaRecovered = indiadata[93]['recovered'].toString();
      indiaDeath = indiadata[93]['deaths'].toString();
    });
    return "Success!";
  }

  @override
  void initState() {
    super.initState();
    this.getData();
  }

  @override
  Widget build(BuildContext context) {
    var _asyncLoader = new AsyncLoader(
      key: asyncLoaderState,
      initState: () async => await getData(),
      renderLoad: () => Center(child: new RefreshProgressIndicator()),
      renderError: ([error]) => Center(
        child: new Text(
          'Sorry, there was an error loading your Page. \n Please Check your Internet Connection.',
          style: TextStyle(
            color: Colors.black45,
          ),
        ),
      ),
      renderSuccess: ({data}) => new ListView(
        children: <Widget>[
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height / 3,
                  child: Container(
                    padding: EdgeInsets.only(
                        top: 10.0, right: 10.0, left: 10.0, bottom: 0.0),
                    margin: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Text(
                          'WORLD',
                          style: TextStyle(
                            color: kThemeBlack,
                            fontFamily: 'OpenSans',
                            fontSize: 24.0,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.0,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Text(
                                'Confirmed',
                                style: TextStyle(
                                  color: kThemeGreen,
                                  fontFamily: 'OpenSans',
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                'Recovered',
                                style: TextStyle(
                                  color: kThemeGreen,
                                  fontFamily: 'OpenSans',
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                'Mortality',
                                style: TextStyle(
                                  color: kThemeGreen,
                                  fontFamily: 'OpenSans',
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Text(
                                totalCase,
                                style: TextStyle(
                                  color: kThemeBlack,
                                  fontFamily: 'OpenSans',
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                totalRecovered,
                                style: TextStyle(
                                  color: kThemeBlack,
                                  fontFamily: 'OpenSans',
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                totalDeath,
                                style: TextStyle(
                                  color: kThemeBlack,
                                  fontFamily: 'OpenSans',
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        RaisedButton(
                          elevation: 2.0,
                          color: kThemeGreen,
                          textColor: Colors.white,
                          child: Text(
                            'Country List',
                            style: TextStyle(fontSize: 18.0),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return CountryList();
                                },
                                settings:
                                    RouteSettings(name: 'CountryListPage'),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 3,
                  child: Container(
                    padding: EdgeInsets.only(
                        top: 10.0, right: 10.0, left: 10.0, bottom: 0.0),
                    margin: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Text(
                          'INDIA',
                          style: TextStyle(
                            color: kThemeBlack,
                            fontFamily: 'OpenSans',
                            fontSize: 24.0,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.0,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Text(
                                'Confirmed',
                                style: TextStyle(
                                  color: kThemeGreen,
                                  fontFamily: 'OpenSans',
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                'Recovered',
                                style: TextStyle(
                                  color: kThemeGreen,
                                  fontFamily: 'OpenSans',
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                'Mortality',
                                style: TextStyle(
                                  color: kThemeGreen,
                                  fontFamily: 'OpenSans',
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Text(
                                indiaCase,
                                style: TextStyle(
                                  color: kThemeBlack,
                                  fontFamily: 'OpenSans',
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                indiaRecovered,
                                style: TextStyle(
                                  color: kThemeBlack,
                                  fontFamily: 'OpenSans',
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                indiaDeath,
                                style: TextStyle(
                                  color: kThemeBlack,
                                  fontFamily: 'OpenSans',
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        RaisedButton(
                          elevation: 2.0,
                          color: kThemeGreen,
                          textColor: Colors.white,
                          child: Text(
                            'State List',
                            style: TextStyle(fontSize: 18.0),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return StateList();
                                },
                                settings: RouteSettings(name: 'StateListPage'),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

    return Scaffold(
      backgroundColor: kThemeOffWhite,
      appBar: AppBar(
        title: Text(
          'Statistics',
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: _asyncLoader,
    );
  }
}
