import 'package:felaban/components/barraSuperiorBACK.dart';
import 'package:felaban/models/eventosModel.dart';
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
    final EventosModel eventoActual = eventosInfo.eventoActual;

    final double fontSizeTitle = 20;
    final double fontSizeSubtitle = 15;


    List<Widget> eventos = [];
    eventoActual.agenda.forEach( (_evento){
      eventos.add(
        Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              color: Color(0xffF6F6F6),
              height: 46,
              alignment: Alignment.centerLeft,
              child: Text("${_evento["time"].format(context).toString()}", style: TextStyle( fontSize: 17, fontWeight: FontWeight.bold),),
            ),
            ListTile(
              leading: Container(
                width: 46,
                child: Image.asset(_evento["image"], ),
              ),
              title: Text(_evento["name"], style: TextStyle(fontSize: fontSizeTitle)),
              subtitle: Text("Registration Area", style: TextStyle(fontSize: fontSizeSubtitle, color: Colors.red)),
              trailing: IconButton(
                icon: _evento["favorite"] == false ? Icon(Icons.favorite_border) : Icon(Icons.favorite, color: Color(0xffD80027)),
                onPressed: (){
                  setState(() {
                    _evento["favorite"]=!_evento["favorite"];
                  });
                },
              ),
              onTap: (){
                Navigator.pushNamed(context, Routes.detalleAgenda);
              },
            ),
          ],
        )
      );
    });

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
          ),
          Column(
            children: eventos,
          ),
        ],
      ),
    );
  }
}