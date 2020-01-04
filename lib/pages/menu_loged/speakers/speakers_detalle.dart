import 'package:felaban/components/barraSuperiorBACK.dart';
import 'package:felaban/pages/menu_loged/agenda/detalle_agenda/detalle_agenda.dart';
import 'package:felaban/routes/Routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetalleSpeakersView extends StatefulWidget {

  final String _imagenRuta;
  DetalleSpeakersView(this._imagenRuta,{Key key}): super(key:key);

  @override
  _DetalleSpeakersViewState createState() => _DetalleSpeakersViewState();
}

class _DetalleSpeakersViewState extends State<DetalleSpeakersView> {
  bool _likeCorazon = false;

  Widget _cuerpoDeLaPagina(BuildContext context){
    return ListView(
      children: <Widget>[
        _profileInformation(context),
        _redesSociales(),
        _descripcionPerfilUsuario(),
        _presentingAt(),
        _listaDePresentaciones(context),
      ],
    );
  }

  Widget _profileInformation(BuildContext context){

    final double _sizeImage = MediaQuery.of(context).size.height*0.17;

    return Stack(
      children: <Widget>[
        Column(
          children: <Widget>[
            Container(
              color: Colors.black,
              height: MediaQuery.of(context).size.height*0.1,
              width: double.infinity,
              child: Image.asset("assets/background.png", fit: BoxFit.cover,)
            ),
            Container(
              height: MediaQuery.of(context).size.height*0.2,
              child: Stack(
                children: <Widget>[
                  Container(
                    alignment: Alignment.bottomCenter,
                    decoration: BoxDecoration(
                      color: Color(0xff489ED2)
                    ),
                  ),
                  Container(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      icon: _likeCorazon == false
                      ? Icon(CupertinoIcons.heart, color: Colors.white, size: 27,)
                      : Icon(CupertinoIcons.heart_solid, color: Colors.white, size: 27,),
                      onPressed: (){
                        setState(() {
                          _likeCorazon = !_likeCorazon;
                          print(_likeCorazon);
                        });
                      },
                    ),
                  ),
                ],
              )
            ),
          ],
        ),
        GestureDetector(
          onTap: (){
            print("Has oprimido la imagen del señor");
          },
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height*0.2,
            alignment: Alignment.center,
            child: Container(
              alignment: Alignment.center,
              width: _sizeImage,
              height: _sizeImage,
              decoration: new BoxDecoration(
                shape: BoxShape.circle,
                image: new DecorationImage(
                  fit: BoxFit.fill,
                  image: new AssetImage(
                    widget._imagenRuta,
                  )
                ),
                border: Border.all(color: Colors.white)
              ),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(10),
          height: MediaQuery.of(context).size.height*0.3,
          child: Container(
            alignment: Alignment.bottomCenter,
            height: MediaQuery.of(context).size.height*0.1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(bottom: 5),
                  child: Text("Giorgio Trettenero Castro", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Colors.white)),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 5),
                  child: Text("Secretario General FELABAN", style: TextStyle(fontSize: 16, color: Colors.white),),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _redesSociales(){
    return Container(
      height: MediaQuery.of(context).size.height*0.1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          IconButton(
            icon: Image.asset("assets/drawerImages/linkedInIcon.png", color: Colors.red,),
            onPressed: (){

            },
          ),
          IconButton(
            icon: Image.asset("assets/drawerImages/instagramIcon.png", color: Colors.red,),
            onPressed: (){

            },
          ),
          IconButton(
            icon: Image.asset("assets/drawerImages/twitterIcon.png", color: Colors.red,),
            onPressed: (){

            },
          ),
        ],
      ),
    );
  }

  Widget _descripcionPerfilUsuario(){
    return Container(
      margin: EdgeInsets.only(left: 15, right: 15, bottom: 15),
      child: Text(
        "Secretario General de la Federación Latinoamericana de Bancos, FELABAN. Agrupa a más de 600 Bancos en 19 países, a través de los presidentes de los Bancos de las 19 asociaciones bancarias de América Latina. con sede en la ciudad de Bogotá, Republica de Colombia. Es el representante Legal, reporta al Consejo de Gobernadores y del Comité Directivo.",
        style: TextStyle(
          fontSize: 18
        ),
      ),
    );
  }

  Widget _presentingAt(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      color: Color(0xffC4C4C4),
      height: 53,
      alignment: Alignment.centerLeft,
      child: Text("Presenting at:", style: TextStyle( fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),),
    );
  }

  Widget _listaDePresentaciones(BuildContext context){
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 15),
          child: ListTile(
            title: Text("Opening Ceremony", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            subtitle: Container(
              margin: EdgeInsets.symmetric(vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Tuesday, March 12, 2020. 2:00 - 3:15 PM", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black),),
                  Text("Location: Brickell Ballroom", style: TextStyle(fontSize: 14, color: Colors.black))
                ],
              ),
            ),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(
                builder: (BuildContext context) => DetalleAgendaView()
              ));
            },
          ),
        ),
        Divider(color: Color(0xffC4C4C4),),
        Container(
          margin: EdgeInsets.only(top: 15),
          child: ListTile(
            title: Text("Session #1", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            subtitle: Container(
              margin: EdgeInsets.symmetric(vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Wednesday, March 13, 2020. 4:30 - 5:00 PM", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black),),
                  Text("Location: Main Ballroom", style: TextStyle(fontSize: 14, color: Colors.black))
                ],
              ),
            ),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: (){
              Navigator.pushNamed(context, Routes.detalleAgenda);
            },
          ),
        ),
        Divider(color: Color(0xffC4C4C4),)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: barraSuperior(context),
      body: _cuerpoDeLaPagina(context),
    );
  }
}