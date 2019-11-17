import 'package:felaban/components/backgroundSuperiorPequeno.dart';
import 'package:felaban/components/barraSuperiorBACK.dart';
import 'package:felaban/pages/menu_loged/detalle_sponsors.dart';
import 'package:flutter/material.dart';

class SponsorsView extends StatefulWidget {

  static const routeName = "/sponsors";

  @override
  _SponsorsViewState createState() => _SponsorsViewState();
}

class _SponsorsViewState extends State<SponsorsView> {

  double _alturaCajas = 64;
  double _paddingHorizontalCajas = 15;

  Widget _cuerpoDeLaPagina(Size _sizeScreen){
    return ListView(
      children: <Widget>[
        BackgroundSuperiorPequenoWidget(),
        _agradecimientos(),
        _barraAPPSponsors(),
        _tileAppSponsor(_sizeScreen),
        _barraPlatinumSponsors(),
        _tilesPlatinumSponsors(_sizeScreen),
        _barraSilverSponsors(),
        _tileSilverSponsor(_sizeScreen),
        SizedBox(height: 20,)
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
      child: Text("APP Sponsor", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
    );
  }

  Widget _tileAppSponsor(Size _sizeScreen){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: ListTile(
        leading: Image.asset("assets/images/sponsor2.png", width: _sizeScreen.width*0.35,),
        title: Text("BAC Credomatic Guatemala", style: TextStyle(fontSize: 18)),
        subtitle: Text("Room 220", style: TextStyle(fontSize: 18)),
        onTap: (){
          Navigator.push(context, 
            MaterialPageRoute(
              builder: (BuildContext context) => DetalleSponsorView("assets/images/sponsor2.png")
            )
          );
        },
      ),
    );
  }

  Widget _barraPlatinumSponsors(){
    return Container(
      color: Color(0xffC4C4C4),
      height: _alturaCajas,
      width: double.infinity,
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.symmetric(horizontal: _paddingHorizontalCajas),
      child: Text("Platinum Sponsors", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
    );
  }
  
  Widget _tilesPlatinumSponsors(Size _sizeScreen){

    double _anchoImagenes = _sizeScreen.width*0.35;

    return Column(
      children: <Widget>[
        SizedBox(height: 10,),
        ListTile(
          leading: Image.asset("assets/sponsors/banrural.png", width: _anchoImagenes,),
          title: Text("BANRURAL", style: TextStyle(fontSize: 18)),
          subtitle: Text("Booth 23", style: TextStyle(fontSize: 18)),
          onTap: (){
            
          },
        ),
        Divider(color: Color(0xffC4C4C4),),
        ListTile(
          leading: Image.asset("assets/sponsors/bcie.png", width: _anchoImagenes,),
          title: Text("Banco Centroamericano de Integracion Economica", style: TextStyle(fontSize: 18)),
          subtitle: Text("Booth 20", style: TextStyle(fontSize: 18)),
          onTap: (){
            
          },
        ),
        Divider(color: Color(0xffC4C4C4),),
        ListTile(
          leading: Image.asset("assets/sponsors/febraban.png", width: _anchoImagenes,),
          title: Text("FEBRABAN Brasil", style: TextStyle(fontSize: 18)),
          subtitle: Text("Booth 39", style: TextStyle(fontSize: 18)),
          onTap: (){
            
          },
        ),
        Divider(color: Color(0xffC4C4C4),),
        ListTile(
          leading: Image.asset("assets/sponsors/bantrab.png", width: _anchoImagenes,),
          title: Text("BANTRAB", style: TextStyle(fontSize: 18)),
          subtitle: Text("Booth 40", style: TextStyle(fontSize: 18)),
          onTap: (){
            
          },
        ),
        SizedBox(height: 10,)
      ],
    );
  }

  Widget _barraSilverSponsors(){
    return Container(
      color: Color(0xffC4C4C4),
      height: _alturaCajas,
      width: double.infinity,
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.symmetric(horizontal: _paddingHorizontalCajas),
      child: Text("Silver Sponsors", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
    );
  }

  Widget _tileSilverSponsor(Size _sizeScreen){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: ListTile(
        leading: Image.asset("assets/images/sponsor2.png", width: _sizeScreen.width*0.35,),
        title: Text("Banco Industrial Panamá", style: TextStyle(fontSize: 18)),
        subtitle: Text("Booth 02", style: TextStyle(fontSize: 18)),
        onTap: (){

        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    Size _sizeScreen = MediaQuery.of(context).size;
    
    return Scaffold(
      appBar: barraSuperior(context),
      body: _cuerpoDeLaPagina(_sizeScreen),
    );
  }
}