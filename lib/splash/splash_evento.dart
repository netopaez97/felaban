import 'dart:async';

import 'package:felaban/routes/Routes.dart';
import 'package:flutter/material.dart';
import 'package:felaban/pages/agenda_on.dart';

class SplashEventView extends StatefulWidget {

  static const routeName = "/splashEvent";

  final String titulo;

  SplashEventView(this.titulo, {Key key}) : super(key:key);

  @override
  _SplashEventViewState createState() => _SplashEventViewState();
}

class _SplashEventViewState extends State<SplashEventView> {
  Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer(
      Duration(seconds: 3), () => Navigator.pushReplacementNamed(context, Routes.angendaOn)
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.loose,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: ExactAssetImage(
                  'assets/images/backgroundSplash.png',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 150,
            width: MediaQuery.of(context).size.width,
            child: Container(
              child: Center(
                child: Image.asset('assets/images/sponsor1.png'),
              ),
            ),
          ),
          Positioned(
            top: 400,
            width: MediaQuery.of(context).size.width,
            child: Container(
              child: Center(
                child: Image.asset('assets/images/sponsor2.png',),
              ),
            ),
          ),
        ],
      ),
    );
  }
}