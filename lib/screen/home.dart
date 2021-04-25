import 'package:covid19/screen/selfaware.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import '../functions.dart';
import 'statistics.dart';
import 'emergency.dart';
import 'package:async_loader/async_loader.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:covid19/services/location.dart';
import 'package:covid19/screen/about.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<AsyncLoaderState> asyncLoaderState =
      new GlobalKey<AsyncLoaderState>();

  var apiKey = '9fccba4b9c981be8a00fb26fae6edd60';
  var openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

  var locationName;
  String zoneStatus;
  var zoneColor;

  List datas;
  String locationDatas = "";

  Future<String> getData() async {
    Location location = Location();
    await location.getCurrentLocation();

    var locationData = await http.get(
      Uri.encodeFull(
          "$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric"),
      headers: {"Accept": "application/json"},
    );

    var response = await http.get(
      Uri.encodeFull("https://prabhuduttakar.github.io/covid19-api/zones.json"),
      headers: {"Accept": "application/json"},
    );

    this.setState(() {
      locationDatas = jsonDecode(locationData.body)["name"].toString();
      datas = jsonDecode(response.body)["zones"];
      for (var i = 0; i < datas.length; i++) {
        if (locationDatas.toLowerCase() ==
            datas[i]["district"].toString().toLowerCase()) {
          zoneStatus = datas[i]["zone"].toString();
          if (zoneStatus == 'Red') {
            zoneColor = Color(0xffe17678);
          } else if (zoneStatus == 'Orange') {
            zoneColor = Color(0xffffb259);
          } else {
            zoneColor = Color(0xff4cd97b);
          }
        } else {
          print('datas[i]["district"]');
        }
      }
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
          'Sorry, there was an error loading your Page. \n Please Check your Internet Connection. \n Restart Your App.',
          style: TextStyle(
            color: Colors.black45,
          ),
        ),
      ),
      renderSuccess: ({data}) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Stack(
            alignment: Alignment.centerLeft,
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height / 2.5,
                margin: EdgeInsets.only(bottom: 5.0),
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/header.png'),
                    fit: BoxFit.cover,
                  ),
                  //color: kThemeBlue,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40.0),
                    bottomRight: Radius.circular(40.0),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(10.0),
                  padding: EdgeInsets.all(10.0),
                  height: MediaQuery.of(context).size.height / 12,
                  decoration: BoxDecoration(
                    color: zoneColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0),
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
//                    boxShadow: [
//                      BoxShadow(
//                        color: Colors.grey.withOpacity(0.5),
//                        spreadRadius: 1,
//                        blurRadius: 2,
//                        offset: Offset(1, 3), // changes position of shadow
//                      ),
//                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.location_on,
                      ),
                      Text(
                        '$locationDatas - $zoneStatus Zone',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.9),
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    child: boxStyle(1),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return SelfAware();
                          },
                          settings: RouteSettings(name: 'SelfAwarePage'),
                        ),
                      );
                    },
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    child: boxStyle(2),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return Statistics();
                          },
                          settings: RouteSettings(name: 'StatisticsPage'),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    child: boxStyle(3),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return Emergency();
                          },
                          settings: RouteSettings(name: 'EmergencyPage'),
                        ),
                      );
                    },
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    child: boxStyle(4),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return AboutPage();
                          },
                          settings: RouteSettings(name: 'AboutPage'),
                        ),
                      );
                    },
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
      body: _asyncLoader,
    );
  }
}
