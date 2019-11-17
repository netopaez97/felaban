import 'dart:async';

import 'package:felaban/routes/Routes.dart';
import 'package:flutter/material.dart';

class SplashEventView extends StatefulWidget {

  static const routeName = "/splashEvent";

  @override
  _SplashEventViewState createState() => _SplashEventViewState();
}

class _SplashEventViewState extends State<SplashEventView> {
  Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer(
      Duration(seconds: 3), () => Navigator.pushNamedAndRemoveUntil(context, Routes.angendaOn, (Route<dynamic> route) => false)
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
            top: MediaQuery.of(context).size.height*0.15,
            width: MediaQuery.of(context).size.width,
            child: Container(
              child: Center(
                child: Image.asset('assets/images/sponsor1.png'),
              ),
            ),
          ),
          Container(
              width: double.infinity,
              height: double.infinity,
              child: Center(
                child: Image.asset('assets/images/sponsor2.png', color: Colors.red.withOpacity(0.65),),
              ),
          ),
        ],
      ),
    );
  }
}