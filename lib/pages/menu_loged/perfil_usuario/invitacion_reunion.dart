import 'package:felaban/components/barraSuperiorBACK.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InvitacionReunionPerfilUsuarioView extends StatefulWidget {

  static const String routeName = "/invitacionReunionPerfilUsuario";

  @override
  _InvitacionReunionPerfilUsuarioViewState createState() => _InvitacionReunionPerfilUsuarioViewState();
}

class _InvitacionReunionPerfilUsuarioViewState extends State<InvitacionReunionPerfilUsuarioView> {

  final double _margenPaginaHorizontal = 15;
  DateTime dateTime;

  Widget _cuerpoDeLaPagina(){
    return ListView(
      children: <Widget>[
        _barraNombreDestinatario(),
        _barraDeDivision(),
        _barraAsunto(),
        _barraDeDivision(),
        _dateProposal(),
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
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xffA1A1A1)),
          borderRadius: BorderRadius.circular(10),
          color: Color(0xffF6F6F6)
        ),
        margin: EdgeInsets.all(_margenPaginaHorizontal),
        padding: EdgeInsets.all(_margenPaginaHorizontal),
        child: Row(
          children: <Widget>[
            Icon(Icons.date_range, color: Color(0xffA1A1A1),),
            dateTime == null
            ? Text("  Date proposal", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),)
            : Text("  ${dateTime.toString()}"),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: barraSuperior(context),
      body: _cuerpoDeLaPagina(),
    );
  }
}