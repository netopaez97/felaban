import 'package:felaban/components/barraSuperiorBACK.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ListaAttendeesView extends StatefulWidget {

  static const routeName = 'attendees';

  @override
  _ListaAttendeesViewState createState() => _ListaAttendeesViewState();
}

class _ListaAttendeesViewState extends State<ListaAttendeesView> {

  double _margenHorizontalGeneral = 15;
  
  Widget _cuerpoDeLaPagina(){
    return ListView(
      children: <Widget>[
        _barraAttendees(),
        _searchNavigation(),
      ],
    );
  }

  Widget _barraAttendees(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: _margenHorizontalGeneral),
      child: Row(
        children: <Widget>[
          Text("Attendees"),
          Icon(FontAwesomeIcons.solidObjectGroup)
        ],
      ),
    );
  }

  Widget _searchNavigation(){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 6, vertical: 18),
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Color(0xffE9E6E6),
      ),
      child: TextField(
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: "search...",
          labelStyle: TextStyle(fontSize: 20),
          icon: Icon(Icons.search),
        ),
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