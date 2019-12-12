import 'package:felaban/components/backgroundSuperiorPequeno.dart';
import 'package:felaban/components/barraSuperiorBACK.dart';
import 'package:flutter/material.dart';

class MapPage extends StatefulWidget {

  static const String routeName = "/map";

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  
  final double _margenHorizontal = 15;

  Widget _cuerpoDeLaPagina(){
    return ListView(
      children: <Widget>[
        BackgroundSuperiorPequenoWidget(),
        _barraVenueMap(),
        _mapa(),
        _yourPosition()
      ],
    );
  }

  

  Widget _barraVenueMap(){
    return Container(
      height: 53,
      alignment: Alignment.center,
      color: Color(0xff489ED2),
      padding: EdgeInsets.all(_margenHorizontal),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text("Venue Map", style: TextStyle(color: Colors.white, fontSize: 20),),
          Container(
            width: 35,
            child: Image.asset("assets/home_loged/map.png", color: Colors.white, fit: BoxFit.contain,)
          ),
        ],
      )
    );
  }

  Widget _mapa(){

    Size tamanoPantalla = MediaQuery.of(context).size;

    return Stack(
      children: <Widget>[
        Container(
          child: Image.asset("assets/map/map.png"),
        ),
        Positioned(
          top: tamanoPantalla.height*0.2,
          left: tamanoPantalla.width*0.6,
          child: Image.asset("assets/drawerImages/venue.png", color: Colors.black, fit: BoxFit.contain,),
        )
      ],
    );
  }

  Widget _yourPosition(){
    return Padding(
      padding: EdgeInsets.all(_margenHorizontal),
      child: Row(
        children: <Widget>[
          Image.asset("assets/drawerImages/venue.png", color: Colors.black, fit: BoxFit.contain,),
          SizedBox(width: 10),
          Text("Your Position", style: TextStyle(fontSize: 25))
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