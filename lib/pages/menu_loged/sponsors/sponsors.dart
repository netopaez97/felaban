import 'package:felaban/components/backgroundSuperiorPequeno.dart';
import 'package:felaban/components/barraSuperiorBACK.dart';
import 'package:felaban/models/sponsorModel.dart';
import 'package:felaban/pages/menu_loged/sponsors/sponsors_detalle.dart';
import 'package:felaban/providers/sponsors_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

    final sponsorsInfo = Provider.of<SponsorsProvider>(context);
    final List<SponsorModel> sponsors = sponsorsInfo.sponsors;

    List _listOfAppSponsors = sponsors;

    _listOfAppSponsors = sponsors.where((s) => s.type=="APP Sponsor").toList();
    print(_listOfAppSponsors[0].type);

    return Column(
      children: <Widget>[
        SizedBox(height: 10,),
        Column(
          children: _listOfAppSponsors.map( (sponsor) => Container(
              child: Column(
                children: <Widget>[
                  
                    ListTile(
                      leading: Image.asset(sponsor.imageLocation, width: _sizeScreen.width*0.35,),
                      title: Text(sponsor.name, style: TextStyle(fontSize: 18)),
                      subtitle: Text(sponsor.location, style: TextStyle(fontSize: 18)),
                      onTap: (){
                        sponsorsInfo.sponsorActual = sponsor;
                        Navigator.push(context, 
                          MaterialPageRoute(
                            builder: (BuildContext context) => DetalleSponsorView()
                          )
                        );
                      },
                    ),
                    Divider(color: Color(0xffC4C4C4)),
                ],
              ),
            ),
          ).toList()
        ),
      ],
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
    
    

    final sponsorsInfo = Provider.of<SponsorsProvider>(context);
    final List<SponsorModel> sponsors = sponsorsInfo.sponsors;

    List _listOfAppSponsors = sponsors;

    _listOfAppSponsors = sponsors.where((s) => s.type=="Platinum Sponsor").toList();
    print(_listOfAppSponsors[0].type);

    return Column(
      children: <Widget>[
        SizedBox(height: 10,),
        Column(
          children: _listOfAppSponsors.map( (sponsor) => Container(
              child: Column(
                children: <Widget>[
                  
                    ListTile(
                      leading: Image.asset(sponsor.imageLocation, width: _sizeScreen.width*0.35,),
                      title: Text(sponsor.name, style: TextStyle(fontSize: 18)),
                      subtitle: Text(sponsor.location, style: TextStyle(fontSize: 18)),
                      onTap: (){
                        sponsorsInfo.sponsorActual = sponsor;
                        Navigator.push(context, 
                          MaterialPageRoute(
                            builder: (BuildContext context) => DetalleSponsorView()
                          )
                        );
                      },
                    ),
                    Divider(color: Color(0xffC4C4C4)),
                ],
              ),
            ),
          ).toList()
        ),
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
    
    
    

    final sponsorsInfo = Provider.of<SponsorsProvider>(context);
    final List<SponsorModel> sponsors = sponsorsInfo.sponsors;

    List _listOfAppSponsors = sponsors;

    _listOfAppSponsors = sponsors.where((s) => s.type=="Silver Sponsors").toList();
    print(_listOfAppSponsors[0].type);

    return Column(
      children: <Widget>[
        SizedBox(height: 10,),
        Column(
          children: _listOfAppSponsors.map( (sponsor) => Container(
              child: Column(
                children: <Widget>[
                  
                    ListTile(
                      leading: Image.asset(sponsor.imageLocation, width: _sizeScreen.width*0.35,),
                      title: Text(sponsor.name, style: TextStyle(fontSize: 18)),
                      subtitle: Text(sponsor.location, style: TextStyle(fontSize: 18)),
                      onTap: (){
                        sponsorsInfo.sponsorActual = sponsor;
                        Navigator.push(context, 
                          MaterialPageRoute(
                            builder: (BuildContext context) => DetalleSponsorView()
                          )
                        );
                      },
                    ),
                    Divider(color: Color(0xffC4C4C4)),
                ],
              ),
            ),
          ).toList()
        ),
      ],
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