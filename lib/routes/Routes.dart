import 'package:felaban/pages/home_loged_view.dart';
import 'package:felaban/pages/home_no_loged_view.dart';
import 'package:felaban/pages/menu_loged/agenda/agenda.dart';
import 'package:felaban/pages/menu_loged/agenda/detalle_agenda/detalle_agenda.dart';
import 'package:felaban/pages/menu_loged/agenda/detalle_agenda/live_poll.dart';
import 'package:felaban/pages/menu_loged/agenda/detalle_agenda/questionAndAnswerView.dart';
import 'package:felaban/pages/menu_loged/favoritos.dart';
import 'package:felaban/pages/menu_loged/location.dart';
import 'package:felaban/pages/menu_loged/map.dart';
import 'package:felaban/pages/menu_loged/networking/networking.dart';
import 'package:felaban/pages/menu_loged/networking/networking_sent_by_you.dart';
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
  static const String qyaAgendaDetalles = QuestionAndAnswerView.routeName;
  static const String livePollAgendaDetalles = LivePollAgendaDetallesView.routeName;
  static const String sponsors = SponsorsView.routeName;
  static const String perfilUsuarioPublico = PerfilUsuarioPublicoView.routeName;
  static const String mensajePerfilUsario = MessageListaAttendeesView.routeName;
  static const String invitacionReunionPerfilUsario = InvitacionReunionPerfilUsuarioView.routeName;
  static const String networking = NetworkingArea.routeName;
  static const String networkingSentByYou = NetwrokingSentByYou.routeName;
  static const String location = LocationPage.routeName;
  static const String map = MapPage.routeName;
  static const String organizers = OrganizersPage.routeName;
  static const String favoritos = FavoritosPage.routeName;
}
