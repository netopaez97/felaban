import 'package:felaban/components/backgroundSuperior.dart';
import 'package:felaban/components/backgroundSuperiorPequeno.dart';
import 'package:felaban/components/barraSuperiorBACK.dart';
import 'package:flutter/material.dart';

class ExhibitorListPage extends StatefulWidget {

  static const String routeName = "/exhibitorList";

  @override
  _ExhibitorListPageState createState() => _ExhibitorListPageState();
}

class _ExhibitorListPageState extends State<ExhibitorListPage> {

  final double _margenHorizontal = 15;

  Widget _cuerpoDeLaPagina(){
    return ListView(
      children: <Widget>[
        BackgroundSuperiorPequenoWidget(),
        _barraExhibitorList(),
      ],
    );
  }

  Widget _barraExhibitorList(){
    return Container(
      height: 53,
      alignment: Alignment.center,
      color: Color(0xff489ED2),
      padding: EdgeInsets.all(_margenHorizontal),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text("Exhibitor List", style: TextStyle(color: Colors.white, fontSize: 20),),
          Container(
            width: 35,
            child: Image.asset("assets/drawerImages/exhibitor.png", color: Colors.white, fit: BoxFit.contain,),
          ),
        ],
      )
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