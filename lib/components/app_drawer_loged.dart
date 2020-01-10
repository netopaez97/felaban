import 'package:felaban/models/eventosModel.dart';
import 'package:felaban/pages/menu_loged/lista_attendees.dart';
import 'package:felaban/pages/menu_loged/speakers/speakers.dart';
import 'package:felaban/providers/attendees_provider.dart';
import 'package:felaban/providers/eventos_provider.dart';
import 'package:felaban/providers/speakersProvider.dart';
import 'package:felaban/providers/sponsors_provider.dart';
import 'package:felaban/providers/user_provider.dart';
import 'package:felaban/routes/Routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class AppDrawer extends StatelessWidget {

  final bool meetings = true;
  

  @override
  Widget build(BuildContext context) {

    
    final eventoInfo = Provider.of<EventosProvider>(context);
    final attendeesInfo = Provider.of<AttendeesProvider>(context);
    final speakersInfo = Provider.of<SpeakersProvider>(context);
    final sponsorsInfo = Provider.of<SponsorsProvider>(context);
    final usuario = Provider.of<UserProvider>(context);
    
    final EventosModel eventoActual = eventoInfo.eventoActual;


    return Drawer(
      child: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.1,
                  child: Container(
                    padding: EdgeInsets.only(left: 15),
                    alignment: Alignment.centerLeft,
                    color: Color(0xFF004A80),
                    child: CupertinoNavigationBarBackButton(
                      previousPageTitle: "Switch Event",
                      color: Colors.white,
                      onPressed: (){
                        
                        attendeesInfo.listaAttendeesFavoritos = [];
                        eventoInfo.listaEventEspecificosFavoritos = [];
                        speakersInfo.listaSpeakersFavoritos = [];
                        sponsorsInfo.listaSponsorsFavoritos = [];

                        Navigator.pushNamedAndRemoveUntil(context, Routes.home,  (Route<dynamic> route) => false);
                      },
                    ),
                  )
                ),
                ListTile(
                  title: Text(
                    'Home ${eventoActual.titulo}',
                    style: TextStyle(
                      color:  Color(0xff423434),
                      fontSize: 16,
                      fontFamily: 'Roboto-Medium'
                    ),
                  ),
                  leading: Container(
                    width: 46,
                    child: Icon(
                      FontAwesomeIcons.home,
                      color: Color(0xffA1A1A1),
                    ),
                  ),
                  onTap: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      Routes.angendaOn,
                      (Route<dynamic> route) => false
                    );
                  },
                ),
                ListTile(
                  title: Text(
                    'Programm / Agenda',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Roboto-medium',
                    ),
                  ),
                  leading: Container(
                    width: 46,
                    child: Image.asset("assets/drawerImages/clock.png"),
                  ),
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      Routes.agenda,
                    );
                  },
                ),
                ListTile(
                  title: Text(
                    'Speakers',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Roboto-medium',
                    ),
                  ),
                  leading: Container(
                    width: 46,
                    child: Image.asset("assets/drawerImages/speaker.png"),
                  ),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (BuildContext context) => SpeakersView(speakersInfo.speakers)
                    ));
                  },
                ),
                ListTile(
                  title: Text(
                    'Sponsors',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Roboto-medium',
                    ),
                  ),
                  leading: Container(
                    width: 46,
                    child: Image.asset("assets/drawerImages/sponsor.png"),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, Routes.sponsors);
                  },
                ),
                ListTile(
                  title: Text(
                    'Favorites',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Roboto-medium',
                    ),
                  ),
                  leading: Container(
                    width: 46,
                    child: Image.asset("assets/drawerImages/favorites.png"),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, Routes.favoritos);
                  },
                ),
                ListTile(
                  title: Text(
                    'Attendees',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Roboto-medium',
                    ),
                  ),
                  leading: Container(
                    width: 46,
                    child: Image.asset("assets/drawerImages/group.png"),
                  ),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (BuildContext context) => ListaAttendeesView(attendeesInfo.attendees)
                    ));
                  },
                ),
                ListTile(
                  title: Text(
                    'My Meetings',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Roboto-medium',
                    ),
                  ),
                  leading: Container(
                    width: 46,
                    child: Image.asset("assets/drawerImages/deal.png"),
                  ),
                  trailing:
                    meetings == true
                    ? Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.red),
                          color: Colors.red
                        ),
                        child: Text("5", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),),
                      )
                    :   Icon(null),
                  onTap: () {
                    Navigator.pushNamed(context, Routes.networking);
                  },
                ),
                ListTile(
                  title: Text(
                    'Exhibitor List',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Roboto-medium',
                    ),
                  ),
                  leading: Container(
                    width: 46,
                    child: Image.asset("assets/drawerImages/exhibitor.png"),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, Routes.exhibitorList);
                  },
                ),
                ListTile(
                  title: Text(
                    'Venue',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Roboto-medium',
                    ),
                  ),
                  leading: Container(
                    width: 46,
                    child: Image.asset("assets/drawerImages/venue.png"),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, Routes.location);
                  },
                ),
                ListTile(
                  title: Text(
                    'My Profile',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Roboto-medium',
                    ),
                  ),
                  leading: Container(
                    width: 46,
                    child: Image.asset("assets/drawerImages/speaker.png"),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, Routes.perfilUsuario);
                  },
                ),
                ListTile(
                  title: Text(
                    'Log Out',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Roboto-medium',
                    ),
                  ),
                  leading: Container(
                    width: 46,
                    child: Image.asset("assets/drawerImages/logout.png"),
                  ),
                  onTap: () {
                    
                    attendeesInfo.listaAttendeesFavoritos = [];
                    eventoInfo.listaEventEspecificosFavoritos = [];
                    speakersInfo.listaSpeakersFavoritos = [];
                    sponsorsInfo.listaSponsorsFavoritos = [];
                    
                    usuario.signOut();
                    Navigator.pushNamedAndRemoveUntil(context, Routes.home, (Route<dynamic> route) => false);
                  },
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height*0.1,
            child: Container(
              padding: EdgeInsets.only(right: 15),
              alignment: Alignment.centerRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text("Powered by: ", style: TextStyle(color: Color(0xffA1A1A1)),),
                  GestureDetector(
                    child: Image.asset("assets/drawerImages/kubilabs_logo.png"),
                    onTap:(){
                      const url = 'https://kubilabs.com';
                      if (canLaunch(url) != null) {
                        launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    }
                  ),
                ],
              )
            ),
          )
        ],
      ),
    );
  }
}