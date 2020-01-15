import 'package:felaban/components/barraSuperiorBACK.dart';
import 'package:felaban/models/sponsorModel.dart';
import 'package:felaban/providers/sponsors_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class DetalleSponsorView extends StatefulWidget {

  @override
  _DetalleSponsorViewState createState() => _DetalleSponsorViewState();
}

class _DetalleSponsorViewState extends State<DetalleSponsorView> {

  double _paddingGeneral = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: barraSuperior(context),
      body: _cuerpoDeLaPagina(),
    );
  }

  Widget _cuerpoDeLaPagina(){
    return ListView(
      children: <Widget>[
        _logo(),
        _barraShareAndFav(),
        _informacion(),
        Divider(color: Color(0xffC4C4C4),),
        _descripcion(),
        SizedBox(height: 30),
        _botones(),
      ],
    );
  }

  Widget _logo(){

    final sponsorsInfo = Provider.of<SponsorsProvider>(context);

    return Container(
      padding: EdgeInsets.all(30),
      color: Colors.white,
      child: Center(
        child: Image.asset(sponsorsInfo.sponsorActual.imageLocation),
      ),
    );
  }

  Widget _barraShareAndFav(){


    final sponsorsInfo = Provider.of<SponsorsProvider>(context);
    final SponsorModel sponsorActual = sponsorsInfo.sponsorActual;

    return Container(
      height: 58,
      padding: EdgeInsets.symmetric(horizontal: _paddingGeneral),
      color: Color(0xff489ED2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          IconButton(
            icon: sponsorActual.favorite==false
            ? Icon(IconData(0xF442, fontFamily: CupertinoIcons.iconFont, fontPackage: CupertinoIcons.iconFontPackage), color: Colors.white, size: 34,)
            : Icon(IconData(0xF443, fontFamily: CupertinoIcons.iconFont, fontPackage: CupertinoIcons.iconFontPackage), color: Colors.white, size: 34,),
            onPressed: (){
              if(sponsorActual.favorite==false)
                setState(() {
                  sponsorsInfo.agregarSponsorAFavoritos = sponsorActual;
                  sponsorActual.favorite=!sponsorActual.favorite;
                });
              else
                setState(() {
                  sponsorsInfo.eliminarSponsorAFavoritos = sponsorActual;
                  sponsorActual.favorite=!sponsorActual.favorite;
                });
            },
          ),
        ],
      ),
    );
  }

  Widget _informacion(){

    final sponsorsInfo = Provider.of<SponsorsProvider>(context);
    final SponsorModel sponsorActual = sponsorsInfo.sponsorActual;

    return ListTile(
      title: Container(child: Text(sponsorActual.name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)), padding: EdgeInsets.symmetric(vertical: 10),),
      subtitle: Row(
        children: <Widget>[
          Icon(Icons.location_on, color: Color(0xffA1A1A1),),
          Text(sponsorActual.location, style: TextStyle(fontSize: 16, color: Color(0xffA1A1A1)))
        ],
      ),
    );
  }

  Widget _descripcion(){

    final sponsorsInfo = Provider.of<SponsorsProvider>(context);
    final SponsorModel sponsorActual = sponsorsInfo.sponsorActual;
    
    return Container(
      padding: EdgeInsets.all(_paddingGeneral),
      child: Text(sponsorActual.description, style: TextStyle(fontSize: 18),),
    );
  }

  Widget _botones(){
    return Container(
      padding: EdgeInsets.all(_paddingGeneral),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              height: 52,
              child: RaisedButton(
                color: Color(0xffC4C4C4),
                elevation: 0,
                onPressed: (){
                  _launchURL('soporte@felaban.net', '', '');
                },
                child: Text("EMAIL", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
              ),
            ),
          ),
          SizedBox(
            width: 10.0,
          ),
          Expanded(
            child: Container(
              height: 52,
              child: RaisedButton(
                color: Color(0xffC4C4C4),
                elevation: 0,
                onPressed: (){
                  const url = 'http://www.felaban.com/';
                  try{
                    if (canLaunch(url) != null) {
                      launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  }
                  catch (e){
                    
                  }
                },
                child: Text("WEBSITE", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _launchURL(String toMailId, String subject, String body) async {
    var url = 'mailto:$toMailId?subject=$subject&body=$body';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}