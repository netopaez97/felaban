

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessageListaAttendeesView extends StatefulWidget {

  static const routeName = "/mensajePerfilUsuario";

  @override
  _MessageListaAttendeesViewState createState() => _MessageListaAttendeesViewState();
}

class _MessageListaAttendeesViewState extends State<MessageListaAttendeesView> {

  final double _margenPaginaHorizontal = 15;

  Widget _barraSuperior(){
    return CupertinoNavigationBar(
      backgroundColor: Color(0xff8C8C8C),
      actionsForegroundColor: Colors.white,
      leading: CupertinoNavigationBarBackButton(
        previousPageTitle: "Back",
        onPressed: () async {
          await _dialogoDeEnvio();
        },
      ),
      padding: EdgeInsetsDirectional.zero,
    );
  }

  Widget _cuerpoDeLaPagina(){
    return ListView(
      children: <Widget>[
        _barraMessageTitulo(),
        _presentacionDelDestinatarioTile(),
        _barraDeDivision(),
        _barraNombreDestinatario(),
        _barraDeDivision(),
        _barraAsunto(),
        _barraDeDivision(),
        _contenidoMensaje(),
        _botonSubmit(),
      ],
    );
  }

  Widget _barraMessageTitulo(){
    return Container(
      color: Color(0xffE5E5E5),
      height: 53,
      alignment: Alignment.center,
      child: Text("Message", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
    );
  }

  Widget _presentacionDelDestinatarioTile(){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        leading: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle
          ),
          child: Image.asset("assets/speakers/matt_higgins.png"),
        ),
        title: Text("Matt Higgins", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        subtitle: Text("Matt Higgins", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Color(0xffEF4135))),
      ),
    );
  }

  Widget _barraDeDivision(){
    return Divider(
      color: Color(0xffC4C4C4),
    );
  }

  Widget _barraNombreDestinatario(){

    double _anchoTOySUBJECT = MediaQuery.of(context).size.width*0.25;

    return Container(
      padding: EdgeInsets.all(_margenPaginaHorizontal),
      child: Row(
        children: <Widget>[
          Container(
            width: _anchoTOySUBJECT,
            child: Text("To:", style: TextStyle(fontSize: 16),),
          ),
          Text("Matt Higgins", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _barraAsunto(){

    double _anchoTOySUBJECT = MediaQuery.of(context).size.width*0.25;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: _margenPaginaHorizontal),
      child: Row(
        children: <Widget>[
          Container(
            width: _anchoTOySUBJECT,
            child: Text("Subject:", style: TextStyle(fontSize: 16),),
          ),
          Container(
            width: 200,
            child: TextFormField(
              decoration: InputDecoration(
                border: InputBorder.none,
                labelText: "Come meet us at our booth #157"
              ),
              textCapitalization: TextCapitalization.sentences,
            ),
          )
        ],
      ),
    );
  }

  Widget _contenidoMensaje(){
    return Container(
      padding: EdgeInsets.all(_margenPaginaHorizontal),
      color: Color(0xffF6F6F6),
      child: TextFormField(
        decoration: InputDecoration(
          border: InputBorder.none,
        ),
        textCapitalization: TextCapitalization.sentences,
        keyboardType: TextInputType.text,
        maxLines: 6,
      ),
    );
  }

  Widget _botonSubmit(){
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.symmetric(horizontal: _margenPaginaHorizontal, vertical: 25),
          child: CupertinoButton(
            child: Text("SUBMIT", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
            onPressed: (){
              Navigator.pop(context);
            },
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
          title: Text("Discard your message?"),
          actions: <Widget>[
            CupertinoButton(
              child: Text("NO", style: TextStyle(color: Colors.black),),
              onPressed: (){
                Navigator.pop(context);
              },
            ),
            CupertinoButton(
              child: Text("YES", style: TextStyle(color: Colors.black)),
              onPressed: (){
                Navigator.pop(context);
                Navigator.pop(context);
              },
            ),
          ],
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _barraSuperior(),
      body: _cuerpoDeLaPagina(),
    );
  }
}