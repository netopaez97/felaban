import 'package:felaban/components/barraSuperiorBACK.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LivePollAgendaDetallesView extends StatefulWidget {

  static const routeName = "/livePollAgendaDetalles";

  @override
  _LivePollAgendaDetallesViewState createState() => _LivePollAgendaDetallesViewState();
}

class _LivePollAgendaDetallesViewState extends State<LivePollAgendaDetallesView> {
  
  final String _nombreAgenda = "Opening ceremony";
  double _margenHorizontal = 20;

  String _radioValue1;
  String _radioValue2;

  Widget _cuerpoDeLaPagina(){
    return ListView(
      children: <Widget>[
        _informacionCeremonia(),
        _tituloBarra(),
        SizedBox(height: 5,),
        _pregunta1(),
        _listaRespuestas1(),
        _pregunta2(),
        _listaRespuestas2(),
        _botonSubmit(),
        _warningMessage(),
        SizedBox(height: 50,)
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

  Widget _tituloBarra(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: _margenHorizontal),
      color: Color(0xff489ED2),
      height: 53,
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text("Live Poll", style: TextStyle( fontSize: 20, color: Colors.white),),
          Image.asset("assets/detalleAgenda/live_polls.png",)
        ],
      ),
    );
  }

  Widget _pregunta1(){
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.height*0.1,
      padding: EdgeInsets.symmetric(horizontal: _margenHorizontal),
      color: Color(0xffE9E6E6),
      child: Text("Which elements of the event did you like most?", style: TextStyle(fontSize: 20),),
    );
  }

  Widget _listaRespuestas1(){

    void radioButtonChanges(String value) {
      setState(() {
        _radioValue1 = value;
      });
    }

    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Radio(
              value: "Expositors",
              groupValue: _radioValue1,
              onChanged: radioButtonChanges,
            ),
            Text("Expositors", style: TextStyle(fontSize: 20),),
          ],
        ),
        Row(
          children: <Widget>[
            Radio(
              value: "Venue",
              groupValue: _radioValue1,
              onChanged: radioButtonChanges,
            ),
            Text("Venue", style: TextStyle(fontSize: 20),),
          ],
        ),
        Row(
          children: <Widget>[
            Radio(
              value: "Speakers",
              groupValue: _radioValue1,
              onChanged: radioButtonChanges
            ),
            Text("Speakers", style: TextStyle(fontSize: 20),),
          ],
        ),
        Row(
          children: <Widget>[
            Radio(
              value: "Sessions",
              groupValue: _radioValue1,
              onChanged: radioButtonChanges
            ),
            Text("Sessions", style: TextStyle(fontSize: 20),),
          ],
        ),
      ],
    );
  }

  Widget _pregunta2(){
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.height*0.1,
      padding: EdgeInsets.symmetric(horizontal: _margenHorizontal),
      color: Color(0xffE9E6E6),
      child: Text("Are you likely to participate in one of our events in the future?", style: TextStyle(fontSize: 20),),
    );
  }

  Widget _listaRespuestas2(){

    void radioButtonChanges(String value) {
      setState(() {
        _radioValue2 = value;
      });
    }

    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Radio(
              value: "Yes, Definitely",
              groupValue: _radioValue2,
              onChanged: radioButtonChanges,
            ),
            Text("Yes, Definitely", style: TextStyle(fontSize: 20),),
          ],
        ),
        Row(
          children: <Widget>[
            Radio(
              value: "Not Sure",
              groupValue: _radioValue2,
              onChanged: radioButtonChanges,
            ),
            Text("Not Sure", style: TextStyle(fontSize: 20),),
          ],
        ),
        Row(
          children: <Widget>[
            Radio(
              value: "No",
              groupValue: _radioValue2,
              onChanged: radioButtonChanges
            ),
            Text("No", style: TextStyle(fontSize: 20),),
          ],
        ),
      ],
    );
  }

  Widget _botonSubmit(){
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.symmetric(horizontal: _margenHorizontal, vertical: 25),
          child: CupertinoButton(
            child: Text("SUBMIT", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
            onPressed: (){

            },
            color: Color(0xff489ED2),
            borderRadius: BorderRadius.all(Radius.zero),
          ),
        ),
      ]
    );
  }

  Widget _warningMessage(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: _margenHorizontal),
      alignment: Alignment.center,
      child: Text("You cannot change your answer once it’s submitted", style: TextStyle(fontStyle: FontStyle.italic,fontSize: 16), textAlign: TextAlign.center),
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