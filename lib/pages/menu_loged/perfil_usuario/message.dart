

import 'package:felaban/components/barraSuperiorBACK.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessageListaAttendeesView extends StatefulWidget {
  @override
  _MessageListaAttendeesViewState createState() => _MessageListaAttendeesViewState();
}

class _MessageListaAttendeesViewState extends State<MessageListaAttendeesView> {

  Widget _barraSuperior(){
    return CupertinoNavigationBar(
      backgroundColor: Color(0xff8C8C8C),
      actionsForegroundColor: Colors.white,
      leading: CupertinoNavigationBarBackButton(
        previousPageTitle: "Back",
        onPressed: (){
          Navigator.pop(context);
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
      ],
    );
  }

  Widget _barraMessageTitulo(){
    return Container(
      height: 53,
      child: Stack(
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            child: FlatButton(
              child: Text("Cancel"),
              onPressed: (){
                
              },
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: FlatButton(
              child: Text("Message"),
              onPressed: (){
                
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _presentacionDelDestinatarioTile(){
    return ListTile(
      leading: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle
        ),
        child: Image.asset("assets/speakers/matt_higgins.png"),
      ),
      title: Text("Matt Higgins"),
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