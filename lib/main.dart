import 'services/analytics_service.dart';
import 'package:flutter/material.dart';
import 'screen/home.dart';
import 'constants.dart';
import 'package:covid19/locator.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Detect My Zone',
      theme: ThemeData.dark().copyWith(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
        primaryTextTheme: TextTheme(
          title: TextStyle(
            color: kThemeGreen,
          ),
        ),
        primaryIconTheme: IconThemeData(
          color: kThemeGreen,
        ),
      ),
      navigatorObservers: [locator<AnalyticsService>().getAnalyticsObserver()],
      home: HomeScreen(),
    );
  }
}
