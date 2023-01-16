import 'dart:async';
import 'package:flat_3d_button/flat_3d_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/notification_services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:percent_indicator/percent_indicator.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Clima(),
    ));

class Clima extends StatefulWidget {
  const Clima({super.key});

  @override
  State<Clima> createState() => _ClimaState();
}

class _ClimaState extends State<Clima> {
  double percent4 = 0;
  static int TimeInMinutFor = 26;
  int TimeInSec4 = TimeInMinutFor * 3;
  //----------------------------
  double percent3 = 0;
  static int TimeInMinutTree = 45;
  int TimeInSec3 = TimeInMinutTree * 4;
  //-----------------------------
  double percent2 = 0;
  static int TimeInMinutTwo = 75;
  int TimeInSec2 = TimeInMinutTwo * 2;
  //-----------------------------
  double percent = 0;
  static int TimeInMinut = 37;
  int TimeInSec = TimeInMinut * 2;

  late Timer timer;

  _StartTimer() {
    TimeInMinut = 25;
    int Time = TimeInMinut * 60;
    double SecPercent = (Time / 50);
    timer = Timer.periodic(Duration(seconds: 1), (Timer) {
      setState(() {
        if (Time > 0) {
          Time--;
          if (Time % 30 == 0) {
            TimeInMinut--;
          }
          if (Time % SecPercent == 0) {
            if (percent < 1) {
              percent += 0.06;
            } else {
              percent = 1;
            }
          }
        } else {
          percent = 0;
          TimeInMinut = 25;
          timer.cancel();
        }
      });
    });
  }

  _StartTimerTwo() {
    TimeInMinutTwo = 25;
    int Time = TimeInMinutTwo * 50;
    double SecPercent = (Time / 40);
    timer = Timer.periodic(Duration(seconds: 1), (Timer) {
      setState(() {
        if (Time > 0) {
          Time--;
          if (Time % 20 == 0) {
            TimeInMinut--;
          }
          if (Time % SecPercent == 0) {
            if (percent < 1) {
              percent += 0.05;
            } else {
              percent = 1;
            }
          }
        } else {
          percent = 0;
          TimeInMinut = 75;
          timer.cancel();
        }
      });
    });
  }

  _StartTimerTree() {
    TimeInMinutTree = 41;
    int Time = TimeInMinutTree * 10;
    double SecPercent = (Time / 310);
    timer = Timer.periodic(Duration(seconds: 1), (Timer) {
      setState(() {
        if (Time > 0) {
          Time--;
          if (Time % 10 == 0) {
            TimeInMinut--;
          }
          if (Time % SecPercent == 0) {
            if (percent < 1) {
              percent += 0.02;
            } else {
              percent = 1;
            }
          }
        } else {
          percent = 0;
          TimeInMinut = 75;
          timer.cancel();
        }
      });
    });
  }

  _StartTimerFor() {
    TimeInMinutFor = 41;
    int Time = TimeInMinutFor * 7;
    double SecPercent = (Time / 20);
    timer = Timer.periodic(Duration(seconds: 1), (Timer) {
      setState(() {
        if (Time > 0) {
          Time--;
          if (Time % 5 == 0) {
            TimeInMinut--;
          }
          if (Time % SecPercent == 0) {
            if (percent < 1) {
              percent += 0.04;
            } else {
              percent = 1;
            }
          }
        } else {
          percent = 0;
          TimeInMinut = 75;
          timer.cancel();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromRGBO(0, 255, 13, 1),
            Color.fromARGB(255, 0, 140, 255)
          ], begin: FractionalOffset(1.5, 1))),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: Text(
                  "Clima",
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 45.0),
                ),
              ),
              const Icon(
                Icons.wind_power,
                size: 60,
                color: Colors.white,
              ),
              Text(
                "$TimeInMinut° | "
                "Clima Ventoso",
                style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255), fontSize: 15.0),
              ),
              Expanded(
                child: CircularPercentIndicator(
                  circularStrokeCap: CircularStrokeCap.round,
                  percent: percent,
                  animation: true,
                  animateFromLastPercent: true,
                  radius: 120.0,
                  lineWidth: 20.0,
                  progressColor: Color.fromARGB(255, 255, 255, 255),
                  center: Text(
                    "$TimeInMinut°",
                    style: const TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1),
                        fontSize: 80.0),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Expanded(
                  child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30.0),
                      topLeft: Radius.circular(30.0)),
                ),
                child: Padding(
                  padding: EdgeInsets.only(top: 15, left: 20.0, right: 20.0),
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: Row(children: <Widget>[
                          Expanded(
                            child: Column(
                              children: <Widget>[
                                Text(
                                  "Hace un dia",
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                                Expanded(
                                  child: CircularPercentIndicator(
                                    circularStrokeCap: CircularStrokeCap.round,
                                    percent: percent,
                                    animation: true,
                                    animateFromLastPercent: true,
                                    radius: 30.0,
                                    lineWidth: 5.0,
                                    progressColor:
                                        Color.fromARGB(255, 34, 130, 255),
                                    center: Text(
                                      "$TimeInMinutTwo°",
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 129, 129, 129),
                                          fontSize: 30.0),
                                    ),
                                  ),
                                ),
                                Icon(
                                  Icons.sunny_snowing,
                                  size: 30,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: <Widget>[
                                Text(
                                  "Hoy",
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                                Expanded(
                                  child: CircularPercentIndicator(
                                    circularStrokeCap: CircularStrokeCap.round,
                                    percent: percent,
                                    animation: true,
                                    animateFromLastPercent: true,
                                    radius: 30.0,
                                    lineWidth: 5.0,
                                    progressColor:
                                        Color.fromARGB(255, 255, 196, 1),
                                    center: Text(
                                      "$TimeInMinut°",
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 148, 148, 148),
                                          fontSize: 30.0),
                                    ),
                                  ),
                                ),
                                Icon(
                                  Icons.wind_power,
                                  size: 20,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: <Widget>[
                                Text(
                                  "Mañana",
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                                Expanded(
                                  child: CircularPercentIndicator(
                                    circularStrokeCap: CircularStrokeCap.round,
                                    percent: percent,
                                    animation: true,
                                    animateFromLastPercent: true,
                                    radius: 30.0,
                                    lineWidth: 5.0,
                                    progressColor:
                                        Color.fromARGB(141, 255, 51, 0),
                                    center: Text(
                                      "$TimeInMinutTree°",
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 148, 148, 148),
                                          fontSize: 30.0),
                                    ),
                                  ),
                                ),
                                Icon(
                                  Icons.wb_sunny_outlined,
                                  size: 20,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                              child: Column(
                            children: <Widget>[
                              Text(
                                "Proximo",
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              Expanded(
                                child: CircularPercentIndicator(
                                  circularStrokeCap: CircularStrokeCap.round,
                                  percent: percent,
                                  animation: true,
                                  animateFromLastPercent: true,
                                  radius: 30.0,
                                  lineWidth: 5.0,
                                  progressColor:
                                      Color.fromARGB(122, 255, 0, 221),
                                  center: Text(
                                    "$TimeInMinutFor°",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 148, 148, 148),
                                        fontSize: 30.0),
                                  ),
                                ),
                              ),
                              Icon(
                                Icons.cloud,
                                size: 20,
                              ),
                            ],
                          )),
                        ]),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 70.0),
                        child: MaterialButton(
                          minWidth: 400.0,
                          height: 80.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100.0)),
                          onPressed: () {
                            _StartTimer();
                            mostrarNotificacion();
                          },
                          color: Color.fromARGB(162, 94, 255, 0),
                          splashColor: Color.fromARGB(255, 112, 110, 110),
                          child: Text('Comenzar',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 22.0)),
                        ),
                      )
                    ],
                  ),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
