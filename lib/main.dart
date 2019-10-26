import 'package:felaban/pages/about_felaban_view.dart';
import 'package:felaban/pages/about_ifc_view.dart';
import 'package:felaban/pages/home_view.dart';
import 'package:felaban/pages/settings_view.dart';
import 'package:felaban/splash/splash_general.dart';
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
        '/': (BuildContext context) => new SplashGeneralView(),
        HomeView.routeName: (BuildContext context) => HomeView(),
        AboutFelabanView.routeName: (BuildContext context) => AboutFelabanView(),
        AboutIFCView.routeName: (BuildContext context) => AboutIFCView(),
        SettingsView.routeName: (BuildContext context) => SettingsView(),
      },
    );
  }
}