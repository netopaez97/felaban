import 'package:felaban/components/backgroundSuperiorPequeno.dart';
import 'package:felaban/components/barraSuperiorBACK.dart';
import 'package:flutter/material.dart';

class SponsorsView extends StatefulWidget {

  static const routeName = "/sponsors";

  @override
  _SponsorsViewState createState() => _SponsorsViewState();
}

class _SponsorsViewState extends State<SponsorsView> {

  double _alturaCajas = 64;
  double _paddingHorizontalCajas = 15;

  Widget _cuerpoDeLaPagina(){
    return ListView(
      children: <Widget>[
        BackgroundSuperiorPequenoWidget(),
        _agradecimientos(),
        _barraAPPSponsors(),
      ],
    );
  }

  Widget _agradecimientos(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: _paddingHorizontalCajas),
      height: _alturaCajas,
      alignment: Alignment.centerLeft,
      child: Text("A very special thank to our Sponsors", style: TextStyle(fontSize: 18),),
    );
  }

  Widget _barraAPPSponsors(){
    return Container(
      color: Color(0xffC4C4C4),
      height: _alturaCajas,
      width: double.infinity,
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.symmetric(horizontal: _paddingHorizontalCajas),
      child: Text("APP Sponsor", style: TextStyle(color: Colors.white)),
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