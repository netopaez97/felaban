import 'package:felaban/components/barraSuperiorBACK.dart';
import 'package:felaban/routes/Routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PerfilUsuarioPublicoView extends StatefulWidget {

  static const routeName = "/perfilDeUsuario";
  @override
  _PerfilUsuarioPublicoViewState createState() => _PerfilUsuarioPublicoViewState();
}

class _PerfilUsuarioPublicoViewState extends State<PerfilUsuarioPublicoView> {
  
  bool _likeCorazon = false;

  Widget _cuerpoDeLaPagina(){
    return ListView(
      children: <Widget>[
        _profileInformation(),
        _servicios(),
        Divider(height: 0, color: Color(0xffC4C4C4),),
        _redesSociales(),
        _descripcionPerfil(),
        _messageAndMeeting(),
        SizedBox(height: 20,)
      ],
    );
  }

  Widget _profileInformation(){

    //Tamaño de la foto de perfil usada tanto en ancho como en alto
    final double _sizeImage = MediaQuery.of(context).size.height*0.22;

    return Stack(
      children: <Widget>[
        Column(
          children: <Widget>[
            //Background superior
            Container(
              color: Colors.black,
              height: MediaQuery.of(context).size.height*0.2,
              width: double.infinity,
              child: Image.asset("assets/background.png", fit: BoxFit.cover,)
            ),

            //Fondo azul
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

        //Container para colocar la imagen de perfil
        Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height*0.35,
            alignment: Alignment.center,

            //Container de la imagen de perfil
            child: Container(
              alignment: Alignment.center,
              width: _sizeImage,
              height: _sizeImage,
              decoration: new BoxDecoration(
                shape: BoxShape.circle,
                image: new DecorationImage(
                  fit: BoxFit.fill,
                  image: new AssetImage(
                    "assets/speakers/matt_higgins.png",
                  )
                ),
                border: Border.all(color: Colors.white, width: 2.0)
              ),
            ),
          ),
        //Container para el nombre del perfil
        Container(
          padding: EdgeInsets.all(10),
          height: MediaQuery.of(context).size.height*0.4,
          child: Container(
            alignment: Alignment.bottomCenter,
            height: MediaQuery.of(context).size.height*0.1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(bottom: 5),
                  child: Text("Higgins", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Colors.white)),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 5),
                  child: Text("CEO Microsoft", style: TextStyle(fontSize: 16, color: Colors.white),),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _servicios(){

    double _margenes  = 15;

    return Container(
      padding: EdgeInsets.only(top: _margenes, left: _margenes, right: _margenes),
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            child: Text("Services:"),
          ),
          Container(
            padding: EdgeInsets.symmetric( vertical: _margenes),
            height: 69,
            child: ListView(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              children: <Widget>[
                _serviciosEtiqueta("Software Development"),
                _serviciosEtiqueta("Marketing"),
                _serviciosEtiqueta("Big Data"),
                _serviciosEtiqueta("Software Development"),
                _serviciosEtiqueta("Marketing"),
                _serviciosEtiqueta("Big Data"),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _serviciosEtiqueta(String _nombreServicio){
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(0xffF6F6F6),
        border: Border.all(color: Color(0xffC4C4C4))
      ),
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(horizontal: 5),
      child: Text(_nombreServicio, style: TextStyle(fontSize: 15)),
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
          IconButton(
            icon: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xffEF4135),
              ),
              height: 41,
              width: 41,
              child: Container(
                padding: EdgeInsets.all(6),
                child: Image.asset("assets/drawerImages/web.png",),
              ),
            ),
            onPressed: (){

            },
          ),
        ],
      ),
    );
  }

  Widget _descripcionPerfil(){

    double _margenes  = 15;

    return Container(
      padding: EdgeInsets.only(left: _margenes, right: _margenes, bottom: _margenes),
      child: Text("Secretario General de la Federación Latinoamericana de Bancos, FELABAN. Agrupa a más de 600 Bancos en 19 países, a través de los presidentes de los Bancos de las 19 asociaciones bancarias de América Latina. con sede en la ciudad de Bogotá, Republica de Colombia.",style: TextStyle(fontSize: 16)),
    );
  }

  Widget _messageAndMeeting(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        GestureDetector(
          child: Container(
            width: 103,
            height: 80,
            decoration: BoxDecoration(
              color: Color(0xff004A80),
              borderRadius: BorderRadius.all(Radius.circular(10))
            ),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset("assets/perfil_usuario/comments.png",),
                  Text("Message", style: TextStyle(color: Colors.white),),
                ],
              ),
            ),
          ),
          onTap: (){
            Navigator.pushNamed(context, Routes.mensajePerfilUsario);
          },
        ),
        SizedBox(width: 27,),
        GestureDetector(
          child: Container(
            width: 103,
            height: 80,
            decoration: BoxDecoration(
              color: Color(0xff004A80),
              borderRadius: BorderRadius.all(Radius.circular(10))
            ),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset("assets/perfil_usuario/calendar.png",),
                  Text("Meeting", style: TextStyle(color: Colors.white),),
                ],
              ),
            ),
          ),
          onTap: (){
            Navigator.pushNamed(context, Routes.invitacionReunionPerfilUsario);
          },
        ),
      ],
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