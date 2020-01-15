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
  TimeOfDay hour;
  String location;

  String _duracionReunion;

  String subject;

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
        _avaibleHours(),
        Divider(),
        _textoDuracionMeeting(),
        Divider(),
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
              onChanged: (val){
                subject = val;
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _dateProposal(){

    return CupertinoButton(
      padding: EdgeInsets.all(0),
      onPressed: (){
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
            ? Text("  Date proposal", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black),)
            : Text("  ${dateTime.toString().split(" ")[0]}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
          ],
        ),
      ),
    );
  }

  Future _dialogDateTimePicker(){
    return showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
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
    return CupertinoButton(
      padding: EdgeInsets.all(0),
      onPressed: (){
        showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: Text("Choose location"),
            content: Container(
              height: 180,
              child: Stack(
                children: [
                  ListView(
                    children: <Widget>[
                      _opcionesLocalizacion("The Diplomat Beach Resort"),
                      _opcionesLocalizacion("Hard Rock Hotel Miami"),
                      _opcionesLocalizacion("Tower Phillip"),
                    ],
                  ),
                  Positioned(
                    left: 0,
                    bottom: 0,
                    right: 0,
                    top: 180,
                    child: Divider(height: 100,),
                  )
                ]
              ),
            ),
          )
        );
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
            location == null
            ? Text("  Location", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black),)
            : Text("  $location", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),)
          ],
        ),
      ),
    );
  }

  
  Widget _opcionesLocalizacion(String _titulo){

    return Row(
      children: <Widget>[
        Flexible(
          child: Radio(
            value: _titulo,
            onChanged: (value){
              setState(() {
                location = value;
                Navigator.pop(context);
              });
            },
            groupValue: location,
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width*0.5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(_titulo),
            ],
          ),
        )
      ],
    );
  }

  Widget _startedTime(){
    return CupertinoButton(
      padding: EdgeInsets.all(0),
      onPressed: (){

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
            hour == null
            ? Text("  Started time", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black),)
            : Text("  ${hour.format(context)}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
          ],
        ),
      ),
    );
  }

  Widget _avaibleHours(){
    return Table(
      children: [
        TableRow(
          children: [
            _horaAElegir(8,0,true),
            _horaAElegir(11,30,false),
            _horaAElegir(15,0,true),
          ]
        ),
        TableRow(
          children: [
            _horaAElegir(8,30,false),
            _horaAElegir(12,0,true),
            _horaAElegir(16,0,true),
          ]
        ),
        TableRow(
          children: [
            _horaAElegir(9,0,true),
            _horaAElegir(12,30,false),
            _horaAElegir(16,30,true),
          ]
        ),
        TableRow(
          children: [
            _horaAElegir(9,30, true),
            _horaAElegir(13,00,true),
            _horaAElegir(17,0,true),
          ]
        ),
        TableRow(
          children: [
            _horaAElegir(10,0,true),
            _horaAElegir(13,30,true),
            _horaAElegir(17,30,true),
          ]
        ),
        TableRow(
          children: [
            _horaAElegir(10,30,false),
            _horaAElegir(14,0,false),
            _horaAElegir(18,00,true),
          ]
        ),
        TableRow(
          children: [
            _horaAElegir(11,0,true),
            _horaAElegir(14,30,true),
            Text("")
          ]
        ),
      ],
    );
  }

  Widget _horaAElegir(int _horaReal, int _minutosReal, bool _enable){
    
    return Row(
        children: <Widget>[
          Flexible(
            child: Radio(
              value: TimeOfDay(
                hour: _horaReal,
                minute: _minutosReal,
              ),
              onChanged: (value){
                if(_enable){
                  setState(() {
                    hour = value;
                    print(value);
                  });
                }
              },
              groupValue: hour,
            ),
          ),
          Text("${TimeOfDay(hour: _horaReal, minute: _minutosReal).format(context).toString()}", style: TextStyle(color: _enable == true ? Colors.black : Colors.grey[400],),),
        ],
      );
  }

  /* Future _dialogoParaTomarHora() async {
    hour = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now()
    );
    setState(() {
      
    });
  } */

  Widget _textoDuracionMeeting(){
    return Container(
      padding: EdgeInsets.all(15),
      child: Text("How long?",style: TextStyle(fontSize: 16),),
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

    if(_duracionReunion.toString() == _hora){
      return CupertinoButton(
        padding: EdgeInsets.all(0),
        onPressed: (){
          setState(() {
            _duracionReunion = _hora;
          });
        },
        child: Container(
          height: 58,
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xffA1A1A1)),
            borderRadius: BorderRadius.circular(10),
            color: _duracionReunion.toString() != _hora
            ? Color(0xffF6F6F6)
            : Color(0xff8C8C8C)
          ),
          margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Row(
            children: <Widget>[
              Icon(Icons.access_time, color: Colors.white,),
              Text("  $_hora Min  ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),)
            ],
          ),
        ),
      );
    }
    else{
      return CupertinoButton(
        padding: EdgeInsets.all(0),
        onPressed: (){
          setState(() {
            _duracionReunion = _hora;
          });
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
              Text("  $_hora Min  ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black),)
            ],
          ),
        ),
      );
    }
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
    if(dateTime==null || location == null || hour == null || _duracionReunion == null || subject == null || subject == ""){
      return showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            content: Text("You have to select a subject, date proposal, location, started time and  meeting duration"),
          );
        }
      );
    }
    
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