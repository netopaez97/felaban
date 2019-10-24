import 'dart:async';

import 'package:felaban/pages/about_felaban_view.dart';
import 'package:felaban/pages/about_ifc_view.dart';
import 'package:felaban/pages/login_view.dart';
import 'package:felaban/pages/home_view.dart';
import 'package:felaban/pages/settings_view.dart';
import 'package:felaban/routes/Routes.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (BuildContext context) => new SplashView(),
        HomeView.routeName: (BuildContext context) => HomeView(),
        LoginView.routeName: (BuildContext context) => LoginView(),
        AboutFelabanView.routeName: (BuildContext context) => AboutFelabanView(),
        AboutIFCView.routeName: (BuildContext context) => AboutIFCView(),
        SettingsView.routeName: (BuildContext context) => SettingsView(),
      },
    );
  }
}

class SplashView extends StatefulWidget {
  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer(
        Duration(seconds: 3), () => Navigator.pushNamedAndRemoveUntil(context, HomeView.routeName,(Route<dynamic> route) => false));
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