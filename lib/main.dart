import 'package:felaban/pages/agenda_on.dart';
import 'package:felaban/pages/menu_loged/perfil_usuario.dart';
import 'package:felaban/pages/menu_no_loged/about_felaban_view.dart';
import 'package:felaban/pages/menu_no_loged/about_ifc_view.dart';
import 'package:felaban/pages/home_view.dart';
import 'package:felaban/pages/menu_no_loged/settings_view.dart';
import 'package:felaban/pages/splash/splash_evento.dart';
import 'package:felaban/providers/eventos_provider.dart';
import 'package:felaban/pages/splash/splash_general.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider( builder: (context) => EventosProvider() ),
      ],
      child: MaterialApp(
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
          AgendaOnView.routeName: (BuildContext context) => AgendaOnView(),
          ProfileUserView.routeName: (BuildContext context) => ProfileUserView(),
          SplashEventView.routeName: (BuildContext context) => SplashEventView(),
        },
      ),
    );
  }
}