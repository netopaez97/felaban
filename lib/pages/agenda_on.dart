import 'package:felaban/components/app_drawer_loged.dart';
import 'package:felaban/components/backgroundSuperior.dart';
import 'package:felaban/components/backgroundSuperiorPequeno.dart';
import 'package:felaban/models/eventosModel.dart';
import 'package:felaban/providers/eventos_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AgendaOnView extends StatefulWidget {

  static const routeName = '/agendaOn';

  @override
  _AgendaOnViewState createState() => _AgendaOnViewState();
}

class _AgendaOnViewState extends State<AgendaOnView> {

  final bool networking = true;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  Widget _barraSuperior(){
    return CupertinoNavigationBar(
      backgroundColor: Color(0xff8C8C8C),
      border: Border.all(
        style: BorderStyle.none,
      ),
      padding: EdgeInsetsDirectional.only(start: 10, end: 10),
      actionsForegroundColor: Colors.white,
      //leading: Icon(IconData(0xF394, fontFamily: CupertinoIcons.iconFont, fontPackage: CupertinoIcons.iconFontPackage)),
      leading:  GestureDetector(
        onTap: () => _scaffoldKey.currentState.openDrawer(),
        child: Icon(IconData(0xF394, fontFamily: CupertinoIcons.iconFont, fontPackage: CupertinoIcons.iconFontPackage)),
      ),
      trailing: GestureDetector(
        child: Icon(Icons.share, color:Colors.white),
        onTap: (){},
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    final eventoInfo = Provider.of<EventosProvider>(context);
    
    final EventosModel eventoActual = eventoInfo.eventoActual;

    return Scaffold(
      key: _scaffoldKey,
      appBar: _barraSuperior(),
      drawer: AppDrawer(eventoActual.titulo),
      body: ListView(
        children: <Widget>[
          BackgroundSuperiorPequenoWidget( titulo: eventoActual.titulo, ),
          Container(
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height*0.1,
            child: ListTile(
              leading: Container(
                width: 57,
                decoration: BoxDecoration(
                  color: Color(0xffC4C4C4),
                  border: Border.all(color: Color(0xffC4C4C4)),
                  shape: BoxShape.circle
                ),
                child: Image.asset("assets/drawerImages/clock.png", color: Colors.white,)
              ),
              trailing: Icon(null),
              title: Text("Programm / Agenda", style: TextStyle(fontSize: 20),),
              subtitle: Text("September 4 - 6 2019", style: TextStyle(fontSize: 15, color: Color(0xffEF4135),),),
              onTap: (){
                
              },
            ),
          ),
          Container(
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height*0.1,
            child: ListTile(
              leading: Container(
                width: 57,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xffC4C4C4),
                  border: Border.all(color: Color(0xffC4C4C4)),
                  shape: BoxShape.circle
                ),
                child: Image.asset("assets/drawerImages/speaker.png", color: Colors.white,)
              ),
              trailing: Icon(null),
              title: Text("Speakers", style: TextStyle(fontSize: 20),),
              subtitle: Text("See all contributors", style: TextStyle(fontSize: 15, color: Color(0xffEF4135)),),
              onTap: (){
                
              },
            ),
          ),
          Container(
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height*0.1,
            child: ListTile(
              leading: Container(
                width: 57,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xffC4C4C4),
                  border: Border.all(color: Color(0xffC4C4C4)),
                  shape: BoxShape.circle
                ),
                child: Image.asset("assets/drawerImages/sponsor.png", color: Colors.white,)
              ),
              trailing: Icon(null),
              title: Text("Sponsors", style: TextStyle(fontSize: 20),),
              subtitle: Text("Their contribution is what helps make our conference possible.", style: TextStyle(fontSize: 15, color: Color(0xffEF4135)),),
              onTap: (){
                
              },
            ),
          ),
          Container(
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height*0.1,
            child: ListTile(
              leading: Container(
                width: 57,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xffC4C4C4),
                  border: Border.all(color: Color(0xffC4C4C4)),
                  shape: BoxShape.circle
                ),
                child: Image.asset("assets/drawerImages/group.png", color: Colors.white)
              ),
              trailing: Icon(null),
              title: Text("Attendees", style: TextStyle(fontSize: 20),),
              subtitle: Text("List of Conference Participants", style: TextStyle(fontSize: 15, color: Color(0xffEF4135)),),
              onTap: (){
                
              },
            ),
          ),
          Container(
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height*0.1,
            child: ListTile(
              leading: Container(
                width: 57,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xffC4C4C4),
                  border: Border.all(color: Color(0xffC4C4C4)),
                  shape: BoxShape.circle
                ),
                child: Image.asset("assets/drawerImages/deal.png", color: Colors.white,height: 200)
              ),
              trailing:
                networking == true
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
              title: Text("Networking", style: TextStyle(fontSize: 20),),
              subtitle: Text("Engage with attendees and boost interactions ", style: TextStyle(fontSize: 15, color: Color(0xffEF4135)),),
              onTap: (){
                
              },
            ),
          ),
          Container(
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height*0.1,
            child: ListTile(
              leading: Container(
                width: 57,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xffC4C4C4),
                  border: Border.all(color: Color(0xffC4C4C4)),
                  shape: BoxShape.circle
                ),
                child: Image.asset("assets/drawerImages/exhibitor.png", color: Colors.white,)
              ),
              trailing: Icon(null),
              title: Text("Exhibitors", style: TextStyle(fontSize: 20),),
              subtitle: Text("List of vendors and booths", style: TextStyle(fontSize: 15, color: Color(0xffEF4135)),),
              onTap: (){
                
              },
            ),
          ),
          Container(
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height*0.1,
            child: ListTile(
              leading: Container(
                width: 57,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xffC4C4C4),
                  border: Border.all(color: Color(0xffC4C4C4)),
                  shape: BoxShape.circle
                ),
                child: Image.asset("assets/drawerImages/venue.png", color: Colors.white,)
              ),
              trailing: Icon(null),
              title: Text("Venue", style: TextStyle(fontSize: 20),),
              subtitle: Text("Explore Conference Location", style: TextStyle(fontSize: 15, color: Color(0xffEF4135)),),
              onTap: (){
                
              },
            ),
          ),
          Container(
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height*0.1,
            child: ListTile(
              leading: Container(
                width: 57,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xffC4C4C4),
                  border: Border.all(color: Color(0xffC4C4C4)),
                  shape: BoxShape.circle
                ),
                child: Image.asset("assets/home_loged/map.png", color: Colors.white,)
              ),
              trailing: Icon(null),
              title: Text("Map", style: TextStyle(fontSize: 20),),
              subtitle: Text("Venue Map", style: TextStyle(fontSize: 15, color: Color(0xffEF4135)),),
              onTap: (){
                
              },
            ),
          ),
          Container(
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height*0.1,
            child: ListTile(
              leading: Container(
                width: 57,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xffC4C4C4),
                  border: Border.all(color: Color(0xffC4C4C4)),
                  shape: BoxShape.circle
                ),
                child: Image.asset("assets/home_loged/organizers.png", color: Colors.white,)
              ),
              trailing: Icon(null),
              title: Text("Organizers", style: TextStyle(fontSize: 20),),
              subtitle: Text("FELABAN - ABG", style: TextStyle(fontSize: 15, color: Color(0xffEF4135)),),
              onTap: (){
                
              },
            ),
          ),
        ],
      )
    );
  }
}