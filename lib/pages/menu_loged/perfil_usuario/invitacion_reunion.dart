import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InvitacionReunionPerfilUsuarioView extends StatefulWidget {

  static const String routeName = "/invitacionReunionPerfilUsuario";

  @override
  _InvitacionReunionPerfilUsuarioViewState createState() => _InvitacionReunionPerfilUsuarioViewState();
}

class _InvitacionReunionPerfilUsuarioViewState extends State<InvitacionReunionPerfilUsuarioView> {

  final double _margenPaginaHorizontal = 10;
  DateTime dateTime;

  Widget _barraSuperior(){
    return CupertinoNavigationBar(
      backgroundColor: Color(0xff8C8C8C),
      actionsForegroundColor: Colors.white,
      leading: CupertinoNavigationBarBackButton(
        previousPageTitle: "Back",
        onPressed: _dialogoParaRegresar
      ),
      padding: EdgeInsetsDirectional.zero,
    );
  }

  Widget _cuerpoDeLaPagina(){
    return ListView(
      children: <Widget>[
        _barraNombreDestinatario(),
        _barraDeDivision(),
        _barraAsunto(),
        _barraDeDivision(),
        _dateProposal(),
        _location(),
        _startedTime(),
        _listaHorizontalHoras(),
        _messageText(),
        _botonSubmit(),
      ],
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

  Widget _barraDeDivision(){
    return Divider(
      color: Color(0xffC4C4C4),
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
                hintText: "Please, type subject",
                hintStyle: TextStyle(fontSize: 16),
              ),
              textCapitalization: TextCapitalization.sentences,
            ),
          )
        ],
      ),
    );
  }

  Widget _dateProposal(){

    return GestureDetector(
      onTap: (){
        _dialogDateTimePicker();
      },
      child: Container(
        height: 58,
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xffA1A1A1)),
          borderRadius: BorderRadius.circular(10),
          color: Color(0xffF6F6F6)
        ),
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: _margenPaginaHorizontal),
        padding: EdgeInsets.symmetric(horizontal: _margenPaginaHorizontal),
        child: Row(
          children: <Widget>[
            Icon(Icons.date_range, color: Color(0xffA1A1A1),),
            dateTime == null
            ? Text("  Date proposal", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),)
            : Text("  ${dateTime.toString()}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
          ],
        ),
      ),
    );
  }

  Future _dialogDateTimePicker(){
    return showDialog(
      context: context,
      builder: (BuildContext context){
        return CupertinoAlertDialog(
          content: Container(
            width: double.infinity,
            height: 200,
            child: CupertinoDatePicker(
              minimumDate: DateTime.now(),
              mode: CupertinoDatePickerMode.date,
              initialDateTime: dateTime,
              onDateTimeChanged: (newDate){
                setState(() {
                  dateTime = newDate;
                });
              },
            ),
          ),
          actions: <Widget>[
            CupertinoButton(
              child: Text("OK"),
              color: Color(0xff29983A),
              borderRadius: BorderRadius.zero,
              onPressed: (){
                Navigator.pop(context);
              },
            )
          ],
        );
      }
    );
  }

  Widget _location(){
    return GestureDetector(
      onTap: (){
        
      },
      child: Container(
        height: 58,
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xffA1A1A1)),
          borderRadius: BorderRadius.circular(10),
          color: Color(0xffF6F6F6)
        ),
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: _margenPaginaHorizontal),
        padding: EdgeInsets.symmetric(horizontal: _margenPaginaHorizontal),
        child: Row(
          children: <Widget>[
            Icon(Icons.location_on, color: Color(0xffA1A1A1),),
            Text("  Location", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),)
          ],
        ),
      ),
    );
  }

  Widget _startedTime(){
    return GestureDetector(
      onTap: (){
        
      },
      child: Container(
        height: 58,
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xffA1A1A1)),
          borderRadius: BorderRadius.circular(10),
          color: Color(0xffF6F6F6)
        ),
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: _margenPaginaHorizontal),
        padding: EdgeInsets.symmetric(horizontal: _margenPaginaHorizontal),
        child: Row(
          children: <Widget>[
            Icon(Icons.access_time, color: Color(0xffA1A1A1),),
            Text("  Started Time", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),)
          ],
        ),
      ),
    );
  }

  Widget _listaHorizontalHoras(){
    return Container(
        padding: EdgeInsets.symmetric(horizontal: _margenPaginaHorizontal),
        height: 58,
        child: ListView(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          children: <Widget>[
            _timeMinutes("15"),
            _timeMinutes("30"),
            _timeMinutes("60"),
          ],
        ),
    );
  }

  Widget _timeMinutes( String _hora){
    return GestureDetector(
      onTap: (){
        
      },
      child: Container(
        height: 58,
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xffA1A1A1)),
          borderRadius: BorderRadius.circular(10),
          color: Color(0xffF6F6F6)
        ),
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Row(
          children: <Widget>[
            Icon(Icons.access_time, color: Color(0xffA1A1A1),),
            Text("  $_hora Min  ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),)
          ],
        ),
      ),
    );
  }
  Widget _messageText(){
    return Container(
      padding: EdgeInsets.all(_margenPaginaHorizontal),
      child: TextFormField(
        
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xffA1A1A1)
            ),
            borderRadius: BorderRadius.all(Radius.circular(10),)
          ),
          fillColor: Color(0xffF6F6F6),
          border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10),)),
          filled: true,
          labelText: "Message",
          labelStyle: TextStyle(
            fontWeight: FontWeight.bold
          )
        ),
        textCapitalization: TextCapitalization.sentences,
        maxLines: null,
        autovalidate: true,
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
            onPressed: _dialogoParaEnviar,
            color: Color(0xff489ED2),
            borderRadius: BorderRadius.all(Radius.zero),
          ),
        ),
      ]
    );
  }

  Future _dialogoParaRegresar(){
    return showDialog(
      context: context,
      builder: (BuildContext context){
        return CupertinoAlertDialog(
          title: Text("Discard your Invitation?"),
          actions: <Widget>[
            CupertinoButton(
              child: Text("Yes", style: TextStyle(color: Colors.black)),
              onPressed: (){
                Navigator.pop(context);
                Navigator.pop(context);
              },
            ),
            CupertinoButton(
              child: Text("No", style: TextStyle(color: Colors.black)),
              onPressed: (){
                Navigator.pop(context);
              },
            ),
          ],
        );
      }
    );
  }

  Future _dialogoParaEnviar(){
    return showDialog(
      context: context,
      builder: (BuildContext context){
        return CupertinoAlertDialog(
          title: Text("Your meeting request has been sent.", style: TextStyle(fontWeight: FontWeight.normal)),
          content: Text("You will be notified once the recipient accept or decline your proposal."),
          actions: <Widget>[
            CupertinoButton(
              child: Text("OK", style: TextStyle(color: Colors.black)),
              onPressed: (){
                Navigator.pop(context);
                Navigator.pop(context);
              },
            )
          ],
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _barraSuperior(),
      body: _cuerpoDeLaPagina(),
    );
  }
}