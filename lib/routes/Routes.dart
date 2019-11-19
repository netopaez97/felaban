import 'package:felaban/pages/home_loged_view.dart';
import 'package:felaban/pages/home_no_loged_view.dart';
import 'package:felaban/pages/menu_loged/agenda.dart';
import 'package:felaban/pages/menu_loged/detalleAgenda/detalle_agenda.dart';
import 'package:felaban/pages/menu_loged/detalleAgenda/live_poll.dart';
import 'package:felaban/pages/menu_loged/detalleAgenda/questionAndAnswerView.dart';
import 'package:felaban/pages/menu_loged/lista_attendees.dart';
import 'package:felaban/pages/menu_loged/perfil_usuario.dart';
import 'package:felaban/pages/menu_loged/speakers.dart';
import 'package:felaban/pages/menu_loged/sponsors.dart';
import 'package:felaban/pages/menu_no_loged/about_felaban_view.dart';
import 'package:felaban/pages/menu_no_loged/about_ifc_view.dart';
import 'package:felaban/pages/menu_no_loged/settings_view.dart';
import 'package:felaban/pages/splash/splash_evento.dart';

class Routes {
  static const String home = HomeView.routeName;
  static const String about_felaban = AboutFelabanView.routeName;
  static const String about_ifc = AboutIFCView.routeName;
  static const String settings = SettingsView.routeName;
  static const String splashEventos = SplashEventView.routeName;
  static const String angendaOn = AgendaOnView.routeName;
  static const String perfilUsuario = ProfileUserView.routeName;
  static const String agenda = AgendaView.routeName;
  static const String detalleAgenda = DetalleAgendaView.routeName;
  static const String speakers = SpeakersView.routeName;
  static const String qyaAgendaDetalles = QuestionAndAnswerView.routeName;
  static const String livePollAgendaDetalles = LivePollAgendaDetallesView.routeName;
  static const String sponsors = SponsorsView.routeName;
  static const String attendees = ListaAttendeesView.routeName;
}
