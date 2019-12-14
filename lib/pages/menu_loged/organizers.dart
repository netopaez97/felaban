import 'package:felaban/components/backgroundSuperiorPequeno.dart';
import 'package:felaban/components/barraSuperiorBACK.dart';
import 'package:flutter/material.dart';

class OrganizersPage extends StatefulWidget {

  static const String routeName = "/organizers";

  @override
  _OrganizersPageState createState() => _OrganizersPageState();
}

class _OrganizersPageState extends State<OrganizersPage> {

  final double _margenHorizontal = 15;
  List _listaOrganizadores = [];
  
  Widget _cuerpoDeLaPagina(){
    return ListView(
      children: <Widget>[
        BackgroundSuperiorPequenoWidget(),
        _barraOrganizers(),
        _mostrarOrganizadores(),
      ],
    );
  }

  Widget _barraOrganizers(){
    return Container(
      height: 53,
      alignment: Alignment.center,
      color: Color(0xff489ED2),
      padding: EdgeInsets.all(_margenHorizontal),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text("About the Organizers", style: TextStyle(color: Colors.white, fontSize: 20),),
          Container(
            width: 35,
            child: Image.asset("assets/home_loged/organizers.png", color: Colors.white, fit: BoxFit.contain,)
          ),
        ],
      )
    );
  }

  Widget _mostrarOrganizadores(){

    List<Widget> _organizadoresAMostrar = [];
    for(int i = 0; i<_listaOrganizadores.length; i++){
      _organizadoresAMostrar.add(
        Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height*0.25,
              alignment: Alignment.center,
              child: Image.asset(_listaOrganizadores[i]["imageOrganizer"], width: double.infinity, alignment: Alignment.center,),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.all(_margenHorizontal),
              height: 53,
              width: double.infinity,
              color: Color(0xffF0F0F0),
              child: Text("About ${_listaOrganizadores[i]["name"]}", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: EdgeInsets.all(_margenHorizontal),
              child: Text(_listaOrganizadores[i]["description"], style: TextStyle(fontSize: 18)),
            )
          ],
        )
      );
    }

    return Column(
      children: _organizadoresAMostrar,
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _listaOrganizadores = [
      {
        "imageOrganizer":"assets/images/felaban_logo.png",
        "name":"FELABAN",
        "description":"La Federación Latinoamericana de Bancos, FELABAN, es una institución sin fines de lucro, constituida en 1965 en la ciudad de Mar del Plata, República Argentina. Agrupa, a través de sus respectivas asociaciones en 19 países del continente, a más de 623 bancos y entidades financieras de América Latina.",
      },
      {
        "imageOrganizer":"assets/organizers/fiba.png",
        "name":"FIBA",
        "description":"La Federación Latinoamericana de Bancos, FELABAN, es una institución sin fines de lucro, constituida en 1965 en la ciudad de Mar del Plata, República Argentina. Agrupa, a través de sus respectivas asociaciones en 19 países del continente, a más de 623 bancos y entidades financieras de América Latina.",
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: barraSuperior(context),
      body: _cuerpoDeLaPagina(),
    );
  }
}