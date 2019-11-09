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
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      color: Color(0xff489ED2),
      height: 76,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          GestureDetector(
            child: Column(
              children: <Widget>[
                Image.asset("assets/detalleAgenda/calendario.png"),
                SizedBox(height: 3,),
                Text("Add to calendar", style: TextStyle(color: Colors.white, fontSize: 12),),
              ],
            ),
            onTap: (){},
          ),
          GestureDetector(
            child: Column(
              children: <Widget>[
                Image.asset("assets/detalleAgenda/calendario.png"),
                SizedBox(height: 3,),
                Text("Reminder", style: TextStyle(color: Colors.white, fontSize: 12),),
              ],
            ),
            onTap: (){},
          ),
          GestureDetector(
            child: Column(
              children: <Widget>[
                Image.asset("assets/detalleAgenda/calendario.png"),
                SizedBox(height: 3,),
                Text("Photo", style: TextStyle(color: Colors.white, fontSize: 12),),
              ],
            ),
            onTap: (){},
          ),
          GestureDetector(
            child: Column(
              children: <Widget>[
                Image.asset("assets/detalleAgenda/calendario.png"),
                SizedBox(height: 3,),
                Text("Favorite", style: TextStyle(color: Colors.white, fontSize: 12),),
              ],
            ),
            onTap: (){},
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