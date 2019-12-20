import 'package:felaban/components/barraSuperiorBACK.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DetalleSponsorView extends StatefulWidget {

  final String _imageLocation;
  DetalleSponsorView(this._imageLocation,{Key key}) : super(key:key);

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
    return Container(
      padding: EdgeInsets.all(30),
      color: Colors.white,
      child: Center(
        child: Image.asset(widget._imageLocation),
      ),
    );
  }

  Widget _barraShareAndFav(){
    return Container(
      height: 58,
      padding: EdgeInsets.symmetric(horizontal: _paddingGeneral),
      color: Color(0xff489ED2),
      child: Row(
        children: <Widget>[
          IconButton(
            iconSize: 28,
            icon: Icon(IconData(0xF3AC, fontFamily: CupertinoIcons.iconFont, fontPackage: CupertinoIcons.iconFontPackage), color: Colors.white,),
            onPressed: (){

            },
          ),
          IconButton(
            iconSize: 28,
            icon: Icon(CupertinoIcons.heart, color: Colors.white),
            onPressed: (){

            },
          ),
        ],
      ),
    );
  }

  Widget _informacion(){
    return ListTile(
      title: Container(child: Text("BAC Credomatic", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)), padding: EdgeInsets.symmetric(vertical: 10),),
      subtitle: Row(
        children: <Widget>[
          Icon(Icons.location_on, color: Color(0xffA1A1A1),),
          Text("Booth Number: 38 & 39", style: TextStyle(fontSize: 16, color: Color(0xffA1A1A1)))
        ],
      ),
    );
  }

  Widget _descripcion(){
    return Container(
      padding: EdgeInsets.all(_paddingGeneral),
      child: Text("Coca-Cola, conocida comúnmente como Coca en muchos países hispanohablantes (en inglés Coke) es una bebida gaseosa y refrescante, vendida a nivel mundial, en tiendas, restaurantes y máquinas expendedoras en más de doscientos países o territorios. Es un producto de The Coca-Cola Company. En un principio, cuando la inventó el farmacéutico John Pemberton, fue concebida como una bebida medicinal patentada.", style: TextStyle(fontSize: 18),),
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