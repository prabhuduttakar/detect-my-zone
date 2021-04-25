import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kThemeOffWhite,
      appBar: AppBar(
        title: Text(
          'About',
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: SafeArea(
          child: ListView(
            children: [
              Column(
                children: [
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.all(5.0),
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      'Covid19 Zone Tracker app has been developed with the aim to beat the ongoing pandemic situation all over the world. Featured with the zone tracker feature, it helps the user to get notified of the current location and the zone they are present in. Thus, will make them aware and comply with the rules set for that respective zone. For the time, this feature is only available in the state of Odisha. \n\nDedicated to all those Covid fighters who are away from their families and in constant dedication towards their service to keep us safe.',
                      style: TextStyle(
                        color: Colors.black.withAlpha(180),
                        fontFamily: 'OpenSans',
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400,
                        //letterSpacing: 0.0,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.all(5.0),
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Text(
                          'Developer',
                          style: TextStyle(
                            color: kThemeGreen,
                            fontFamily: 'OpenSans',
                            fontSize: 21.0,
                            fontWeight: FontWeight.w600,
                            //letterSpacing: 0.0,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Center(
                          child: Container(
                            margin: EdgeInsets.only(top: 7.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(150.0),
                              child: Image(
                                image: AssetImage('images/me.jpg'),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: Text(
                            'Prabhudutta Kar',
                            style: TextStyle(
                              color: kThemeBlack,
                              fontFamily: 'OpenSans',
                              fontSize: 20.0,
                              fontWeight: FontWeight.w600,
                              //letterSpacing: 0.0,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Center(
                          child: Text(
                            'Fullstack Web & Android',
                            style: TextStyle(
                              color: Color.fromARGB(120, 0, 0, 0),
                              fontFamily: 'OpenSans',
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                              //letterSpacing: 0.0,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.mail,
                                color: kThemeGreen,
                              ),
                              Text(
                                ' karprabhuias@gmail.com',
                                style: TextStyle(
                                  color: kThemeBlack,
                                  fontFamily: 'OpenSans',
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FaIcon(
                                FontAwesomeIcons.github,
                                color: kThemeGreen,
                              ),
                              Text(
                                ' github.com/prabhudutta-kar',
                                style: TextStyle(
                                  color: kThemeBlack,
                                  fontFamily: 'OpenSans',
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FaIcon(
                                FontAwesomeIcons.linkedin,
                                color: kThemeGreen,
                              ),
                              Text(
                                ' linkedin.com/in/prabhudutta-kar/',
                                style: TextStyle(
                                  color: kThemeBlack,
                                  fontFamily: 'OpenSans',
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.all(5.0),
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Text(
                          'Inspiration',
                          style: TextStyle(
                            color: kThemeGreen,
                            fontFamily: 'OpenSans',
                            fontSize: 21.0,
                            fontWeight: FontWeight.w600,
                            //letterSpacing: 0.0,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'https://statedashboard.odisha.gov.in/',
                                style: TextStyle(
                                  color: kThemeBlack,
                                  fontFamily: 'OpenSans',
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.all(5.0),
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Text(
                          'Credit For API',
                          style: TextStyle(
                            color: kThemeGreen,
                            fontFamily: 'OpenSans',
                            fontSize: 21.0,
                            fontWeight: FontWeight.w600,
                            //letterSpacing: 0.0,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'https://api.rootnet.in/',
                                style: TextStyle(
                                  color: kThemeBlack,
                                  fontFamily: 'OpenSans',
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'https://corona.lmao.ninja/',
                                style: TextStyle(
                                  color: kThemeBlack,
                                  fontFamily: 'OpenSans',
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'https://openweathermap.org/api',
                                style: TextStyle(
                                  color: kThemeBlack,
                                  fontFamily: 'OpenSans',
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.all(5.0),
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Text(
                          'Credit For Illustrations',
                          style: TextStyle(
                            color: kThemeGreen,
                            fontFamily: 'OpenSans',
                            fontSize: 21.0,
                            fontWeight: FontWeight.w600,
                            //letterSpacing: 0.0,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'https://www.canva.com/',
                                style: TextStyle(
                                  color: kThemeBlack,
                                  fontFamily: 'OpenSans',
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'https://undraw.co/',
                                style: TextStyle(
                                  color: kThemeBlack,
                                  fontFamily: 'OpenSans',
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'https://dribbble.com/',
                                style: TextStyle(
                                  color: kThemeBlack,
                                  fontFamily: 'OpenSans',
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
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
