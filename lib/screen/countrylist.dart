import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import 'package:async_loader/async_loader.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class CountryList extends StatefulWidget {
  @override
  _CountryListState createState() => _CountryListState();
}

class _CountryListState extends State<CountryList> {
  final GlobalKey<AsyncLoaderState> asyncLoaderState =
      new GlobalKey<AsyncLoaderState>();

  List datas;
  List filteredData = List();

  Future<String> getData() async {
    var response = await http.get(
      Uri.encodeFull("https://corona.lmao.ninja/v2/countries"),
      headers: {"Accept": "application/json"},
    );

    this.setState(() {
      datas = jsonDecode(response.body);
      filteredData = datas;
    });
    return "Success!";
  }

  @override
  void initState() {
    super.initState();
    this.getData();
    filteredData = datas;
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
        child: Column(
          children: <Widget>[
            TextField(
              cursorColor: kThemeGreen,
              style: TextStyle(
                color: kThemeGreen,
              ),
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  color: kThemeGreen,
                ),
                fillColor: Colors.white,
                filled: true,
                contentPadding: EdgeInsets.all(10.0),
                hintText: 'Search Country Name',
                hintStyle: TextStyle(color: Colors.grey),
              ),
              onChanged: (string) {
                setState(() {
                  filteredData = datas
                      .where((u) => (u["country"]
                          .toLowerCase()
                          .contains(string.toLowerCase())))
                      .toList();
                });
              },
            ),
            Expanded(
              child: new ListView.builder(
                itemCount: filteredData.length,
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
                          color: Color.fromARGB(220, 255, 255, 255),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 1,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: Image(
                                    height: 50.0,
                                    image: NetworkImage(
                                      filteredData[index]['countryInfo']['flag']
                                          .toString(),
                                    ),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    filteredData[index]["country"].toString(),
                                    style: kThemeCountryTitle,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 5.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Text(
                                    'Confirmed',
                                    style: kThemeCountryCount,
                                  ),
                                  Text(
                                    'Recovered',
                                    style: kThemeCountryCount,
                                  ),
                                  Text(
                                    'Mortality',
                                    style: kThemeCountryCount,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 0.0, bottom: 0.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Text(
                                    filteredData[index]['cases'].toString(),
                                    style: kThemeCountryCountNumber,
                                  ),
                                  Text(
                                    filteredData[index]['recovered'].toString(),
                                    style: kThemeCountryCountNumber,
                                  ),
                                  Text(
                                    filteredData[index]['deaths'].toString(),
                                    style: kThemeCountryCountNumber,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );

    return Scaffold(
      backgroundColor: kThemeOffWhite,
      appBar: AppBar(
        title: Text(
          'Country List',
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: _asyncLoader,
    );
  }
}
