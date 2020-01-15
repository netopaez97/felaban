

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessageListaAttendeesView extends StatefulWidget {

  static const routeName = "/mensajePerfilUsuario";

  @override
  _MessageListaAttendeesViewState createState() => _MessageListaAttendeesViewState();
}

class _MessageListaAttendeesViewState extends State<MessageListaAttendeesView> {

  final double _margenPaginaHorizontal = 15;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _asunto="";
  String _mensaje="";

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
    return Form(
      key: _formKey,
      child: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              _barraMessageTitulo(),
              _presentacionDelDestinatarioTile(),
              _barraDeDivision(),
              _barraNombreDestinatario(),
              _barraDeDivision(),
              _barraAsunto(),
              _barraDeDivision(),
            ],
          ),
          Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: _inputBar(),
          ),
        ],
      ),
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
              initialValue: _asunto,
              onChanged: (value){
                setState(() {
                  _asunto = value;
                });
              },
              validator: (value){
                if(value.isEmpty){
                  if(_mensaje!="")
                    return "Type subject";
                  }
                return null;
              },
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

  Widget _inputBar(){
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: roundedContainer(),
          ),
          SizedBox(
            width: 5.0,
          ),
          GestureDetector(
            onTap: () async{
              if(!_formKey.currentState.validate())
                  return "You have to validate";

              if(_asunto=="" && _mensaje=="")
                return showDialog(
                  context: context,
                  builder: (BuildContext context){
                    return AlertDialog(
                      title: Text("You have to type something before send"),
                      actions: <Widget>[
                        FlatButton(
                          child: Text("OK"),
                          onPressed: (){
                            Navigator.pop(context);
                          },
                        )
                      ],
                    );
                  }
                );
              await _dialogoMensajeEnviado();
              return Navigator.pop(context);
            },
            child: CircleAvatar(
              child: Icon(Icons.send),
            ),
          ),
        ],
      ),
    );
  }

  Widget roundedContainer(){
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: Container(
        color: Colors.white,
        child: Row(
          children: <Widget>[
            SizedBox(width: 8.0),
            Expanded(
              child: TextFormField(
                validator: (value){
                  print("Asunto: $_asunto");
                  print("Mensaje: $_mensaje");
                  if(value.isEmpty)
                    if(_asunto != "")
                      return "Type a message";
                  return null;
                },
                onChanged: (value){
                  setState(() {
                    _mensaje=value;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Please, type a message',
                  border: InputBorder.none,
                ),
                keyboardType: TextInputType.text,
                maxLines: 2,
              ),
            ),
            SizedBox(width: 8.0),
          ],
        ),
      ),
    );
  }

  Widget _contenidoMensaje(){
    return Container(
      padding: EdgeInsets.all(_margenPaginaHorizontal),
      color: Color(0xffF6F6F6),
      child: TextFormField(
        initialValue: _mensaje,
        onSaved: (value){
          setState(() {
            _mensaje = value;
          });
        },
        validator: (value){
          if(_asunto=="")
            if(value.isEmpty){
              print("AAA");
              return "Type a message";
            }
          return null;
        },
        decoration: InputDecoration(
          border: InputBorder.none,
        ),
        textCapitalization: TextCapitalization.sentences,
        keyboardType: TextInputType.text,
        maxLines: 3,
      ),
    );
  }

  Widget _barraEnviarMensaje(){
    return Container(
      color: Colors.grey[200],
      padding: EdgeInsets.only(left: 10, top: 5, bottom: 5),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.white,
              ),
              child: TextField(
                minLines: 1,
                maxLines: 3,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))
                  )
                ),
                textInputAction: TextInputAction.done,
              ),
            ),
          ),
          Container(
            child: FlatButton(
              padding: EdgeInsets.all(0),
              child: Text("Send", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),),
              onPressed: () async {
                if(!_formKey.currentState.validate())
                  return "You have to validate";
                await _dialogoMensajeEnviado();
                return Navigator.pop(context);
              },
            ),
          )
        ],
      ),
    );
  }

  Future _dialogoMensajeEnviado(){
    return showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text("Message sent"),
        actions: <Widget>[
          FlatButton(
            child: Text("OK"),
            onPressed: (){
              Navigator.pop(context);
            },
          )
        ],
      )
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