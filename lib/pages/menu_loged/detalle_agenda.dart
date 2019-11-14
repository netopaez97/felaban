import 'package:felaban/components/barraSuperiorBACK.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetalleAgendaView extends StatefulWidget {

  @override
  _DetalleAgendaViewState createState() => _DetalleAgendaViewState();
}

class _DetalleAgendaViewState extends State<DetalleAgendaView> {

  Widget _cuerpoDeLaPagina(){
    return ListView(
      children: <Widget>[
        _informacionCeremonia(),
        _pasarelaOpciones(),
      ],
    );
  }

  Widget _informacionCeremonia(){
    return Container(
      height: 110,
      child: Stack(
        children: <Widget>[
          Container(
            color: Colors.black,
            width: double.infinity,
            child: Image.asset("assets/background.png", fit: BoxFit.cover,),
          ),
          Container(
            margin: EdgeInsets.only(left: 10, top: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Opening Ceremony", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
                Text("Wednesday 09:30 - 10:00 am", style: TextStyle(color: Colors.white, fontSize: 16),),
                Text("Sep 01, 2019", style: TextStyle(color: Colors.white, fontSize: 16),),
              ],
            ),
          ),
          Container(
            height: double.infinity,
            margin: EdgeInsets.only(bottom: 10, right: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Icon(Icons.place, color:Colors.white),
                Text("Main Central Area", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold))
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _pasarelaOpciones(){

    final double _anchoDeCadaRecuadro = MediaQuery.of(context).size.width*0.25;

    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      color: Color(0xff489ED2),
      height: 73,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 2),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset("assets/detalleAgenda/calendario.png", height: 37, fit: BoxFit.contain,),
                FittedBox(
                  child: Text("Add to Calendar", style: TextStyle(fontSize: 12),),
                )
              ],
            ),
          ),
          Container(
            child: GestureDetector(
              child: Column(
                children: <Widget>[
                  Icon(IconData(0xf35a, fontFamily: CupertinoIcons.iconFont, fontPackage: CupertinoIcons.iconFontPackage), color: Colors.white, size: 34,),
                  SizedBox(height: 3,),
                  Text("Reminder", style: TextStyle(color: Colors.white, fontSize: 12),),
                ],
              ),
              onTap: (){},
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: GestureDetector(
              child: Column(
                children: <Widget>[
                  Image.asset("assets/detalleAgenda/camera.png"),
                  SizedBox(height: 3,),
                  Text("Photo", style: TextStyle(color: Colors.white, fontSize: 12),),
                ],
              ),
              onTap: (){},
            ),
          ),
          Container(
            child: GestureDetector(
              child: Column(
                children: <Widget>[
                  Icon(IconData(0xf387, fontFamily: CupertinoIcons.iconFont, fontPackage: CupertinoIcons.iconFontPackage), color: Colors.white, size: 34,),
                  SizedBox(height: 3,),
                  Text("Favorite", style: TextStyle(color: Colors.white, fontSize: 12),),
                ],
              ),
              onTap: (){},
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: barraSuperior(context),
      body: _cuerpoDeLaPagina(),
    );
  }

}