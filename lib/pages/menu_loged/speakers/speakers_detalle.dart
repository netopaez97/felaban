import 'package:felaban/components/barraSuperiorBACK.dart';
import 'package:felaban/models/eventoEspecificoModel.dart';
import 'package:felaban/models/speakersModel.dart';
import 'package:felaban/pages/menu_loged/agenda/detalle_agenda/detalle_agenda.dart';
import 'package:felaban/providers/eventos_provider.dart';
import 'package:felaban/providers/speakersProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetalleSpeakersView extends StatefulWidget {

  @override
  _DetalleSpeakersViewState createState() => _DetalleSpeakersViewState();
}

class _DetalleSpeakersViewState extends State<DetalleSpeakersView> {

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

    final speakersInfo = Provider.of<SpeakersProvider>(context);
    final SpeakersModel speakerActual = speakersInfo.speakerActual;

    return Container(
      color: Color(0xff489ED2),
      child: Stack(
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
                height: MediaQuery.of(context).size.height*0.1,
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
                        icon: speakerActual.favorite==false
                        ? Icon(IconData(0xF442, fontFamily: CupertinoIcons.iconFont, fontPackage: CupertinoIcons.iconFontPackage), color: Colors.white, size: 34,)
                        : Icon(IconData(0xF443, fontFamily: CupertinoIcons.iconFont, fontPackage: CupertinoIcons.iconFontPackage), color: Colors.white, size: 34,),
                        onPressed: (){
                          if(speakerActual.favorite==false)
                            setState(() {
                              speakersInfo.agregarSpeakerAFavoritos = speakerActual;
                              speakerActual.favorite=!speakerActual.favorite;
                            });
                          else
                            setState(() {
                              speakersInfo.eliminarSpeakerAFavoritos = speakerActual;
                              speakerActual.favorite=!speakerActual.favorite;
                            });
                        },
                      ),
                    ),
                  ],
                )
              ),
              Container(
                color: Color(0xff489ED2),
                padding: EdgeInsets.all(10),
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(bottom: 5),
                        child: Text(speakerActual.name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Colors.white)),
                      ),
                      Container(
                        child: Text(speakerActual.cargo, style: TextStyle(fontSize: 16, color: Colors.white),),
                      )
                    ],
                  ),
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
                      speakerActual.imageLocation,
                    )
                  ),
                  border: Border.all(color: Colors.white)
                ),
              ),
            ),
          ),
        ],
      ),
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

    final eventosInfo = Provider.of<EventosProvider>(context);
    final List<EventoEspecificoModel> _eventosSpeaker = [
      EventoEspecificoModel(
        name:"Arrival & Registration",
        place:"Registration Area",
        sponsor:"",
        favorite:false,
        time:TimeOfDay(hour: 8, minute: 0),
        image:"assets/images/arrival_registration.png",
      ),
      EventoEspecificoModel(
        name:"Breakfast",
        place:"Breakfast Area",
        sponsor:"Sponsor by SPONSOR NAME",
        favorite:false,
        time:TimeOfDay(hour: 9, minute: 9),
        image:"assets/images/breakfast.png",
      ),
    ];

    List<Widget> _eventoAMostrar = [];
    for(int i = 0; i<_eventosSpeaker.length; i++){
      _eventoAMostrar.add(
        Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 15),
              child: ListTile(
                title: Text(_eventosSpeaker[i].name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                subtitle: Container(
                  margin: EdgeInsets.symmetric(vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Tuesday, March 12, 2020. 2:00 - 3:15 PM", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black),),
                      Text("Location: ${_eventosSpeaker[i].place}", style: TextStyle(fontSize: 14, color: Colors.black))
                    ],
                  ),
                ),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: (){

                  eventosInfo.eventoEspecificoActual =  _eventosSpeaker[i];

                  Navigator.push(context, MaterialPageRoute(
                    builder: (BuildContext context) => DetalleAgendaView()
                  ));
                },
              ),
            ),
            Divider(color: Color(0xffC4C4C4),),
          ],
        )
      );
    }

    return Column(
      children: _eventoAMostrar
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