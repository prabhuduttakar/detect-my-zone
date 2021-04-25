import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import 'package:async_loader/async_loader.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

class Emergency extends StatefulWidget {
  @override
  _EmergencyState createState() => _EmergencyState();
}

class _EmergencyState extends State<Emergency> {
  final GlobalKey<AsyncLoaderState> asyncLoaderState =
      new GlobalKey<AsyncLoaderState>();

  List datas;

  Future<String> getData() async {
    var response = await http.get(
      Uri.encodeFull(
          "https://prabhuduttakar.github.io/covid19-api/contacts.json"),
      headers: {"Accept": "application/json"},
    );

    this.setState(() {
      datas = jsonDecode(response.body)['data']['contacts']['regional'];
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
      renderSuccess: ({data}) => new Scrollbar(
        child: new ListView.builder(
          itemCount: datas == null ? 0 : datas.length,
          itemBuilder: (BuildContext context, int index) {
            return new Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(
                      top: 10.0, right: 10.0, left: 10.0, bottom: 10.0),
                  margin: EdgeInsets.only(
                      top: 10.0, left: 10.0, right: 10.0, bottom: 0.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            datas[index]['loc'].toString(),
                            style: kThemeStateName,
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          FlatButton(
                            child: Icon(
                              Icons.call,
                              color: kThemeGreen,
                            ),
                            onPressed: () => UrlLauncher.launch(
                                'tel:${datas[index]['number'].toString()}'),
                          ),
                          Text(
                            datas[index]['number'].toString(),
                            style: kThemeNumber,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );

    return Scaffold(
      backgroundColor: kThemeOffWhite,
      appBar: AppBar(
        title: Text(
          'Emergency Contacts',
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: _asyncLoader,
    );
  }
}
