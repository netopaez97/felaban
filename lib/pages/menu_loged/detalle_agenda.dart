import 'package:felaban/components/barraSuperiorBACK.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetalleAgendaView extends StatefulWidget {

  @override
  _DetalleAgendaViewState createState() => _DetalleAgendaViewState();
}

class _DetalleAgendaViewState extends State<DetalleAgendaView> {

  final String _nombreAgenda = "Opening ceremony";

  final List _listaDeSpeakers = [
    {
      "nombre":"Laura Bommer",
      "cargo":"Moderator",
      "imagenUbicacion":"assets/detalleAgenda/laura_bommer.png",
    },
    {
      "nombre":"Giorgio Trettenero Castro",
      "cargo":"Secretary General FELABAN",
      "imagenUbicacion":"assets/images/profile_face.png",
    },
  ];

  bool _questionAndAnswerActive = true;
  bool _livePollsActive = true;

  Widget _cuerpoDeLaPagina(){
    return ListView(
      children: <Widget>[
        _informacionCeremonia(),
        _pasarelaOpciones(),
        _descripcion(),
        _speakersTituloBarra(),
        _speakersContenido(),
        _sessionQyATituloBarra(),
        _sessionQyADescription(),
        _livePollsTituloBarra(),
        _livePollsDescripcion(),
        _photosTituloBarra(),
        _photosDescripcion(),
      ],
    );
  }

  Widget _informacionCeremonia(){
    return Container(
      height: 110,
      child: Stack(
        children: <Widget>[
          Container(
            color: Colors.black,
            width: double.infinity,
            child: Image.asset("assets/background.png", fit: BoxFit.cover,),
          ),
          Container(
            margin: EdgeInsets.only(left: 10, top: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(_nombreAgenda, style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
                Text("Wednesday 09:30 - 10:00 am", style: TextStyle(color: Colors.white, fontSize: 16),),
                Text("Sep 01, 2019", style: TextStyle(color: Colors.white, fontSize: 16),),
              ],
            ),
          ),
          Container(
            height: double.infinity,
            margin: EdgeInsets.only(bottom: 10, right: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Icon(Icons.place, color:Colors.white),
                Text("Main Central Area", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold))
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _pasarelaOpciones(){

    final double _anchoDeCadaRecuadro = MediaQuery.of(context).size.width*0.25;

    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      color: Color(0xff489ED2),
      height: 73,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 2),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset("assets/detalleAgenda/calendario.png", height: 37, fit: BoxFit.contain,),
                FittedBox(
                  child: Text("Add to Calendar", style: TextStyle(fontSize: 12),),
                )
              ],
            ),
          ),
          Container(
            child: GestureDetector(
              child: Column(
                children: <Widget>[
                  Icon(IconData(0xf35a, fontFamily: CupertinoIcons.iconFont, fontPackage: CupertinoIcons.iconFontPackage), color: Colors.white, size: 34,),
                  SizedBox(height: 3,),
                  Text("Reminder", style: TextStyle(color: Colors.white, fontSize: 12),),
                ],
              ),
              onTap: (){},
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: GestureDetector(
              child: Column(
                children: <Widget>[
                  Image.asset("assets/detalleAgenda/camera.png"),
                  SizedBox(height: 3,),
                  Text("Photo", style: TextStyle(color: Colors.white, fontSize: 12),),
                ],
              ),
              onTap: (){},
            ),
          ),
          Container(
            child: GestureDetector(
              child: Column(
                children: <Widget>[
                  Icon(IconData(0xf387, fontFamily: CupertinoIcons.iconFont, fontPackage: CupertinoIcons.iconFontPackage), color: Colors.white, size: 34,),
                  SizedBox(height: 3,),
                  Text("Favorite", style: TextStyle(color: Colors.white, fontSize: 12),),
                ],
              ),
              onTap: (){},
            ),
          ),
        ],
      ),
    );
  }

  Widget _descripcion(){
    return Container(
      margin: EdgeInsets.all(MediaQuery.of(context).size.width*0.05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(_nombreAgenda.toUpperCase(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
          SizedBox(height: 5,),
          Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ", style: TextStyle(fontSize: 16), )
        ],
      )
    );
  }

  Widget _speakersTituloBarra(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      color: Color(0xffC4C4C4),
      height: 53,
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text("SPEAKERS", style: TextStyle( fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),),
          Image.asset("assets/drawerImages/speaker.png", color: Colors.white,)
        ],
      ),
    );
  }

  Widget _speakersContenido(){

    List<Widget> _speakersAMostrar = [];
    _listaDeSpeakers.map((speaker) => _speakersAMostrar.add(
      Container(
        color: Color(0xffEEEEEE),
        child: Column(
          children: <Widget>[
            ListTile(
              leading: Container(
                width: 71,
                height: 71,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(speaker["imagenUbicacion"]),
                  )
                )
              ),
              title: Text(speaker["nombre"], style: TextStyle(fontSize: 20),),
              subtitle: Text(speaker["cargo"], style: TextStyle(fontSize: 17),),
              trailing: Icon(Icons.arrow_forward_ios, color: Colors.white),
            ),
            Divider(color: Colors.white, height: 1,)
          ],
        )
      ),
    )).toList();

    return Column(
      children: _speakersAMostrar,
    );
  }

  Widget _sessionQyATituloBarra(){
    return GestureDetector(
      onTap: (){
        setState(() {
          _questionAndAnswerActive = !_questionAndAnswerActive;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        color: Color(0xffC4C4C4),
        height: 53,
        alignment: Alignment.centerLeft,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text("SESSION Q&A", style: TextStyle( fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),),
            Image.asset("assets/detalleAgenda/qya.png", color: Colors.white,)
          ],
        ),
      ),
    );
  }

  Widget _sessionQyADescription(){
    if(_questionAndAnswerActive == false)
      return Container(
        margin: EdgeInsets.all(MediaQuery.of(context).size.width*0.05),
        child: Text("Questions can be submitted one hour before and Up to thirty minutes after this sesion.", style: TextStyle(fontSize: 16), )
      );
    else
      return Container(
        margin: EdgeInsets.all(MediaQuery.of(context).size.width*0.05),
        child: GestureDetector(
          child: Text("Click here to ask a Question.", style: TextStyle(fontSize: 16),),
          onTap: (){
            print("Neto");
          },
          onDoubleTap: (){
            print("object");
          },
        ),
      );
  }

  Widget _livePollsTituloBarra(){
    return GestureDetector(
      onTap: (){
        setState(() {
          _livePollsActive = !_livePollsActive;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        color: Color(0xffC4C4C4),
        height: 53,
        alignment: Alignment.centerLeft,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text("LIVE POLLS", style: TextStyle( fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),),
            Image.asset("assets/detalleAgenda/live_polls.png",)
          ],
        ),
      ),
    );
  }

  Widget _livePollsDescripcion(){
    if(_livePollsActive == false)
      return Container(
        margin: EdgeInsets.all(MediaQuery.of(context).size.width*0.05),
        child: Text("No active Polls at this moment, please come back when session is Live.", style: TextStyle(fontSize: 16), )
      );
    else
      return Container(
        margin: EdgeInsets.all(MediaQuery.of(context).size.width*0.05),
        child: GestureDetector(
          child: Text("Click here to Participate.", style: TextStyle(fontSize: 16),),
          onTap: (){
            print("Neto");
          },
          onDoubleTap: (){
            print("object");
          },
        ),
      );
  }

  Widget _photosTituloBarra(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      color: Color(0xffC4C4C4),
      height: 53,
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text("PHOTOS", style: TextStyle( fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),),
          Image.asset("assets/detalleAgenda/camera.png", color: Colors.white,)
        ],
      ),
    );
  }

  Widget _photosDescripcion(){
    return Container(
      margin: EdgeInsets.all(MediaQuery.of(context).size.width*0.05),
      child: GridView.count(
        shrinkWrap: true,
        crossAxisCount: 3,
        children: <Widget>[
          Image.asset("assets/detalleAgenda/photo1.png"),
          Image.asset("assets/detalleAgenda/photo2.png"),
          Image.asset("assets/detalleAgenda/photo3.png"),
          Image.asset("assets/detalleAgenda/photo4.png"),
          Image.asset("assets/detalleAgenda/photo5.png"),
        ],
      )
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