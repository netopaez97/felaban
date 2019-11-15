import 'package:felaban/components/barraSuperiorBACK.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuestionAndAnswerView extends StatefulWidget {

  static const routeName = "/qya";

  @override
  _QuestionAndAnswerViewState createState() => _QuestionAndAnswerViewState();
}

class _QuestionAndAnswerViewState extends State<QuestionAndAnswerView> {
  
  final String _nombreAgenda = "Opening ceremony";
  final double _margenHorizontal = 10;

  Widget _cuerpoDeLaPagina(){
    return ListView(
      children: <Widget>[
        _informacionCeremonia(),
        _sessionQyATituloBarra(),
        _formularioParaPregunta(),
        _botonSubmit(),
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
  
  Widget _sessionQyATituloBarra(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: _margenHorizontal),
      color: Color(0xff489ED2),
      height: 53,
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text("Session Q&A", style: TextStyle( fontSize: 20, color: Colors.white),),
          Image.asset("assets/detalleAgenda/qya.png", color: Colors.white,)
        ],
      ),
    );
  }

  Widget _formularioParaPregunta(){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: _margenHorizontal),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Text("Please type your question.."),
          ),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              hintText: "¿What´s the best place in your city? "
            ),
            textCapitalization: TextCapitalization.sentences,
            maxLines: 4,
            keyboardType: TextInputType.text,
          )
        ],
      )
    );
  }

  Widget _botonSubmit(){
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.symmetric(horizontal: _margenHorizontal, vertical: 25),
          child: CupertinoButton(
            child: Text("SUBMIT", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
            onPressed: _dialogoDeEnvio,
            color: Color(0xff489ED2),
            borderRadius: BorderRadius.all(Radius.zero),
          ),
        ),
      ]
    );
  }

  Future _dialogoDeEnvio(){
    return showDialog(
      context: context,
      builder: (BuildContext context){
        return CupertinoAlertDialog(
          content: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                child: Text("Thank You!\nYour Question has been sent!", style: TextStyle(fontSize: 25, color: Color(0xff8C8C8C)),),
              ),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: _margenHorizontal, vertical: 25),
                  child: CupertinoButton(
                    child: Text("OK", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    color: Color(0xff29983A),
                    borderRadius: BorderRadius.all(Radius.zero),
                  ),
                ),
            ],
          ),
        );
      }
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