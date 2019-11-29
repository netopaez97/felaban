import 'package:felaban/pages/home_loged_view.dart';
import 'package:felaban/pages/home_no_loged_view.dart';
import 'package:felaban/pages/menu_loged/agenda.dart';
import 'package:felaban/pages/menu_loged/detalleAgenda/detalle_agenda.dart';
import 'package:felaban/pages/menu_loged/detalleAgenda/live_poll.dart';
import 'package:felaban/pages/menu_loged/detalleAgenda/questionAndAnswerView.dart';
import 'package:felaban/pages/menu_loged/lista_attendees.dart';
import 'package:felaban/pages/menu_loged/networking/networking_recived.dart';
import 'package:felaban/pages/menu_loged/networking/networking_sent_by_you.dart';
import 'package:felaban/pages/menu_loged/perfil_usuario.dart';
import 'package:felaban/pages/menu_loged/perfil_usuario/invitacion_reunion.dart';
import 'package:felaban/pages/menu_loged/perfil_usuario/message.dart';
import 'package:felaban/pages/menu_loged/perfil_usuario/perfil_usuario.dart';
import 'package:felaban/pages/menu_loged/speakers.dart';
import 'package:felaban/pages/menu_loged/sponsors.dart';
import 'package:felaban/pages/menu_no_loged/about_felaban_view.dart';
import 'package:felaban/pages/menu_no_loged/about_ifc_view.dart';
import 'package:felaban/pages/menu_no_loged/settings_view.dart';
import 'package:felaban/pages/splash/splash_evento.dart';
import 'package:felaban/pages/splash/splash_general.dart';
import 'package:felaban/providers/eventos_provider.dart';
import 'package:felaban/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/menu_loged/networking/networking.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider( builder: (context) => EventosProvider() ),
        ChangeNotifierProvider( builder: (context) => UserProvider.instance() ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (BuildContext context) => SplashGeneralView(),
          HomeView.routeName: (context) => HomeView(),
          AboutFelabanView.routeName: (BuildContext context) => AboutFelabanView(),
          AboutIFCView.routeName: (BuildContext context) => AboutIFCView(),
          SettingsView.routeName: (BuildContext context) => SettingsView(),
          AgendaOnView.routeName: (BuildContext context) => AgendaOnView(),
          ProfileUserView.routeName: (BuildContext context) => ProfileUserView(),
          SplashEventView.routeName: (BuildContext context) => SplashEventView(),
          AgendaView.routeName: (BuildContext context) => AgendaView(),
          DetalleAgendaView.routeName: (BuildContext context) => DetalleAgendaView(),
          SpeakersView.routeName: (BuildContext context) => SpeakersView(),
          QuestionAndAnswerView.routeName: (BuildContext context) => QuestionAndAnswerView(),
          LivePollAgendaDetallesView.routeName: (BuildContext context) => LivePollAgendaDetallesView(),
          SponsorsView.routeName: (BuildContext context) => SponsorsView(),
          ListaAttendeesView.routeName: (BuildContext context) => ListaAttendeesView(),
          PerfilUsuarioPublicoView.routeName: (BuildContext context) => PerfilUsuarioPublicoView(),
          MessageListaAttendeesView.routeName: (BuildContext context) => MessageListaAttendeesView(),
          InvitacionReunionPerfilUsuarioView.routeName: (BuildContext context) => InvitacionReunionPerfilUsuarioView(),
          NetworkingArea.routeName: (BuildContext context) => NetworkingArea(),
          NetwrokingSentByYou.routeName: (BuildContext context) => NetwrokingSentByYou(),
          NetworkingRecived.routeName: (BuildContext context) => NetworkingRecived(),
        },
      ),
    );
  }
}