import 'dart:async';

import 'package:felaban/routes/Routes.dart';
import 'package:flutter/material.dart';

class SplashGeneralView extends StatefulWidget {
  @override
  _SplashGeneralViewState createState() => _SplashGeneralViewState();
}

class _SplashGeneralViewState extends State<SplashGeneralView> {

  Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer(
        Duration(seconds: 3), () => Navigator.pushNamedAndRemoveUntil(context, Routes.home,(Route<dynamic> route) => false));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Image.asset("assets/images/splash_home.jpeg", fit: BoxFit.cover,),
      )
    );
  }
}