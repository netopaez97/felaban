import 'package:felaban/components/app_drawer_loged.dart';
import 'package:felaban/components/barraSuperiorBACK.dart';
import 'package:felaban/providers/eventos_provider.dart';
import 'package:felaban/routes/Routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AgendaView extends StatefulWidget {

  static const routeName = "/agenda";

  @override
  _AgendaViewState createState() => _AgendaViewState();
}

class _AgendaViewState extends State<AgendaView> {

  int fecha = 0;
  
  @override
  Widget build(BuildContext context) {

    final Size _sizeScreen = MediaQuery.of(context).size;

    final eventosInfo = Provider.of<EventosProvider>(context);
    final eventoActual = eventosInfo.eventoActual;

    final double fontSizeTitle = 20;
    final double fontSizeSubtitle = 15;

    return Scaffold(
      appBar: barraSuperior(context),
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
                      Text(eventoActual.fecha[fecha], textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 20),),
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
            title: Text("Arrival & Registration", style: TextStyle(fontSize: fontSizeTitle)),
            subtitle: Text("Registration Area", style: TextStyle(fontSize: fontSizeSubtitle, color: Colors.red)),
            trailing: IconButton(
              icon: Icon(Icons.favorite_border),
              onPressed: (){},
            ),
            onTap: (){
              Navigator.pushNamed(context, Routes.detalleAgenda);
            },
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
            title: Text("Breakfast", style: TextStyle(fontSize: fontSizeTitle)),
            subtitle: Text("Breakfast Area\nSponsor by SPONSOR NAME", style: TextStyle(fontSize: fontSizeSubtitle, color: Colors.red)),
            trailing: IconButton(
              icon: Icon(Icons.favorite_border),
              onPressed: (){},
            ),
            onTap: (){
              Navigator.pushNamed(context, Routes.detalleAgenda);
            },
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
            title: Text("Opening Remarks", style: TextStyle(fontSize: fontSizeTitle)),
            subtitle: Text("Main Salon\nFELABAN", style: TextStyle(fontSize: fontSizeSubtitle, color: Colors.red)),
            trailing: IconButton(
              icon: Icon(Icons.favorite, color: Color(0xffD80027),),
              onPressed: (){},
            ),
            onTap: (){
              Navigator.pushNamed(context, Routes.detalleAgenda);
            },
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            color: Color(0xffF6F6F6),
            height: 46,
            alignment: Alignment.centerLeft,
            child: Text("10:00 AM", style: TextStyle( fontSize: 17, fontWeight: FontWeight.bold),),
          ),
          ListTile(
            leading: Container(
              width: 46,
              child: Image.asset("assets/images/adam_burke.png"),
            ),
            title: Text("Session #1", style: TextStyle(fontSize: fontSizeTitle)),
            subtitle: Text("AARON LASHER\Chief Marketing Officer - Bread Wallet", style: TextStyle(fontSize: fontSizeSubtitle, color: Colors.red)),
            trailing: IconButton(
              icon: Icon(Icons.favorite_border, color: Color(0xffD80027),),
              onPressed: (){},
            ),
            onTap: (){
              Navigator.pushNamed(context, Routes.detalleAgenda);
            },
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            color: Color(0xffF6F6F6),
            height: 46,
            alignment: Alignment.centerLeft,
            child: Text("12:00 AM", style: TextStyle( fontSize: 17, fontWeight: FontWeight.bold),),
          ),
          ListTile(
            leading: Container(
              width: 46,
              child: Image.asset("assets/images/aaron_lasher.png"),
            ),
            title: Text("Session #2", style: TextStyle(fontSize: fontSizeTitle)),
            subtitle: Text("ADAM BURKE\nUS Azure Channel Sales Director - Microsoft", style: TextStyle(fontSize: fontSizeSubtitle, color: Colors.red)),
            trailing: IconButton(
              icon: Icon(Icons.favorite, color: Color(0xffD80027),),
              onPressed: (){},
            ),
            onTap: (){
              Navigator.pushNamed(context, Routes.detalleAgenda);
            },
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            color: Color(0xffF6F6F6),
            height: 46,
            alignment: Alignment.centerLeft,
            child: Text("01:00 PM", style: TextStyle( fontSize: 17, fontWeight: FontWeight.bold),),
          ),
          ListTile(
            leading: Container(
              width: 46,
              child: Image.asset("assets/images/breakfast.png", color: Color(0xffC4C4C4),),
            ),
            title: Text("Breakfast", style: TextStyle(fontSize: fontSizeTitle)),
            subtitle: Text("Breakfast Area\nSponsor by SPONSOR NAME", style: TextStyle(fontSize: fontSizeSubtitle, color: Colors.red)),
            trailing: IconButton(
              icon: Icon(Icons.favorite_border),
              onPressed: (){},
            ),
            onTap: (){
              Navigator.pushNamed(context, Routes.detalleAgenda);
            },
          ),
        ],
      ),
    );
  }
}