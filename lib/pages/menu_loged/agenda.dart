import 'package:felaban/components/app_drawer_loged.dart';
import 'package:felaban/providers/eventos_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AgendaView extends StatefulWidget {

  static const routeName = "/agenda";

  @override
  _AgendaViewState createState() => _AgendaViewState();
}

class _AgendaViewState extends State<AgendaView> {

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  int fecha = 0;



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

    final Size _sizeScreen = MediaQuery.of(context).size;

    final eventosInfo = Provider.of<EventosProvider>(context);
    final eventoActual = eventosInfo.eventoActual;

    return Scaffold(
      key: _scaffoldKey,
      appBar: _barraSuperior(),
      drawer: AppDrawer(),
      body: ListView(
        children: <Widget>[
          Container(
            height:_sizeScreen.height*0.15,
            child: Stack(
              children: <Widget>[
                Container(
                  color: Colors.black,
                  height: _sizeScreen.height*0.15,
                  width: double.infinity,
                  child: Image.asset(
                    'assets/images/background_short.png',
                    fit: BoxFit.fitHeight,
                  ),
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.arrow_back_ios, color: Colors.white,),
                        onPressed: (){
                          print(fecha);
                          if(fecha>0){
                            setState(() {
                              fecha--; 
                              print(fecha);
                            });
                          }
                        },
                      ),
                      Text(eventoActual.fecha[fecha], style: TextStyle(color: Colors.white, fontSize: 20),),
                      IconButton(
                        icon: Icon(Icons.arrow_forward_ios, color: Colors.white,),
                        onPressed: (){
                          if(fecha<2){
                            setState(() {
                              fecha = fecha + 1;
                              print(fecha);
                            });
                          }
                        },
                      ),
                    ],
                  )
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            color: Color(0xffE5E5E5),
            height: 60,
            alignment: Alignment.centerLeft,
            child: Text("All Categories", style: TextStyle( fontSize: 17),),
          ),Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                color: Color(0xffF6F6F6),
                height: 46,
                alignment: Alignment.centerLeft,
                child: Text("08:00 AM", style: TextStyle( fontSize: 17, fontWeight: FontWeight.bold),),
              ),
          ListTile(
            leading: Container(
              width: 46,
              child: Image.asset("assets/images/arrival_registration.png", color: Color(0xffC4C4C4),),
            ),
            title: Text("Arrival & Registration", style: TextStyle(fontSize: 20)),
            subtitle: Text("Registration Area", style: TextStyle(fontSize: 15, color: Colors.red)),
            trailing: IconButton(
              icon: Icon(Icons.favorite_border),
              onPressed: (){},
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            color: Color(0xffF6F6F6),
            height: 46,
            alignment: Alignment.centerLeft,
            child: Text("09:00 AM", style: TextStyle( fontSize: 17, fontWeight: FontWeight.bold),),
          ),
          ListTile(
            leading: Container(
              width: 46,
              child: Image.asset("assets/images/breakfast.png", color: Color(0xffC4C4C4),),
            ),
            title: Text("Breakfast", style: TextStyle(fontSize: 20)),
            subtitle: Text("Breakfast Area\nSponsor by SPONSOR NAME", style: TextStyle(fontSize: 15, color: Colors.red)),
            trailing: IconButton(
              icon: Icon(Icons.favorite_border),
              onPressed: (){},
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            color: Color(0xffF6F6F6),
            height: 46,
            alignment: Alignment.centerLeft,
            child: Text("09:30 AM", style: TextStyle( fontSize: 17, fontWeight: FontWeight.bold),),
          ),
          ListTile(
            leading: Container(
              width: 46,
              child: Image.asset("assets/drawerImages/speaker.png", color: Color(0xffC4C4C4),),
            ),
            title: Text("Opening Remarks", style: TextStyle(fontSize: 20)),
            subtitle: Text("Main Salon\nFELABAN", style: TextStyle(fontSize: 15, color: Colors.red)),
            trailing: IconButton(
              icon: Icon(Icons.favorite, color: Color(0xffD80027),),
              onPressed: (){},
            ),
          ),
        ],
      ),
    );
  }
}