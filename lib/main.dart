import 'package:felaban/pages/home_loged_view.dart';
import 'package:felaban/pages/home_no_loged_view.dart';
import 'package:felaban/pages/menu_loged/agenda/agenda.dart';
import 'package:felaban/pages/menu_loged/agenda/detalle_agenda/detalle_agenda.dart';
import 'package:felaban/pages/menu_loged/agenda/detalle_agenda/live_poll.dart';
import 'package:felaban/pages/menu_loged/agenda/detalle_agenda/questionAndAnswerView.dart';
import 'package:felaban/pages/menu_loged/exhibitor/exhibitor_list.dart';
import 'package:felaban/pages/menu_loged/favoritos.dart';
import 'package:felaban/pages/menu_loged/location.dart';
import 'package:felaban/pages/menu_loged/map.dart';
import 'package:felaban/pages/menu_loged/organizers.dart';
import 'package:felaban/pages/menu_loged/perfil_usuario.dart';
import 'package:felaban/pages/menu_loged/perfil_usuario/invitacion_reunion.dart';
import 'package:felaban/pages/menu_loged/perfil_usuario/message.dart';
import 'package:felaban/pages/menu_loged/perfil_usuario/perfil_usuario.dart';
import 'package:felaban/pages/menu_loged/sponsors/sponsors.dart';
import 'package:felaban/pages/menu_no_loged/about_felaban_view.dart';
import 'package:felaban/pages/menu_no_loged/about_ifc_view.dart';
import 'package:felaban/pages/menu_no_loged/settings_view.dart';
import 'package:felaban/pages/splash/splash_evento.dart';
import 'package:felaban/pages/splash/splash_general.dart';
import 'package:felaban/providers/attendees_provider.dart';
import 'package:felaban/providers/eventos_provider.dart';
import 'package:felaban/providers/speakersProvider.dart';
import 'package:felaban/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/menu_loged/networking/networking.dart';

void main() => runApp(MyApp());

//prueba

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider( builder: (context) => EventosProvider() ),
        ChangeNotifierProvider( builder: (context) => UserProvider.instance() ),
        ChangeNotifierProvider( builder: (context) => AttendeesProvider() ),
        ChangeNotifierProvider( builder: (context) => SpeakersProvider() ),
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
          QuestionAndAnswerView.routeName: (BuildContext context) => QuestionAndAnswerView(),
          LivePollAgendaDetallesView.routeName: (BuildContext context) => LivePollAgendaDetallesView(),
          SponsorsView.routeName: (BuildContext context) => SponsorsView(),
          PerfilUsuarioPublicoView.routeName: (BuildContext context) => PerfilUsuarioPublicoView(),
          MessageListaAttendeesView.routeName: (BuildContext context) => MessageListaAttendeesView(),
          InvitacionReunionPerfilUsuarioView.routeName: (BuildContext context) => InvitacionReunionPerfilUsuarioView(),
          NetworkingArea.routeName: (BuildContext context) => NetworkingArea(),
          ExhibitorListPage.routeName: (BuildContext context) => ExhibitorListPage(),
          LocationPage.routeName: (BuildContext context) => LocationPage(),
          MapPage.routeName: (BuildContext context) => MapPage(),
          OrganizersPage.routeName: (BuildContext context) => OrganizersPage(),
          FavoritosPage.routeName: (BuildContext context) => FavoritosPage(),
        },
      ),
    );
  }
}