import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RequestEditPageEspera extends StatefulWidget {

  @override
  _RequestEditPageEsperaState createState() => _RequestEditPageEsperaState();
}

class _RequestEditPageEsperaState extends State<RequestEditPageEspera> {
  
  final double _margenPaginaHorizontal = 10;
  DateTime dateTime;
  TimeOfDay hour;
  String location;
  String _duracionReunion;

  Widget _barraSuperior(){
    return CupertinoNavigationBar(
      middle: Text("Meeting Request", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
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
        _barraNombreDestinatario(),
        _barraDeDivision(),
        _barraAsunto(),
        _barraDeDivision(),
        _dateProposal(),
        _location(),
        _timeProposal(),
        _avaibleHours(),
        _listaHorizontalHoras(),
        _messageText(),
        _botonesModificarOlvidar()
      ],
    );
  }

  Widget _barraNombreDestinatario(){

    double _anchoTOySUBJECT = MediaQuery.of(context).size.width*0.25;

    return Container(
      alignment: Alignment.center,
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
            content: Column(
              children: <Widget>[
                RadioListTile(
                  value: "The Diplomat Beach Resort",
                  onChanged: (value){
                    setState(() {
                      location = value;
                      Navigator.pop(context);
                    });
                  },
                  groupValue: location,
                  title: Text("The Diplomat Beach Resort"),
                ),
                RadioListTile(
                  value: "Hard Rock Hotel Miami",
                  onChanged: (value){
                    setState(() {
                      location = value;
                      Navigator.pop(context);
                    });
                  },
                  groupValue: location,
                  title: Text("Hard Rock Hotel Miami"),
                ),
                RadioListTile(
                  value: "Tower Phillip",
                  onChanged: (value){
                    setState(() {
                      location = value;
                      Navigator.pop(context);
                    });
                  },
                  groupValue: location,
                  title: Text("Tower Phillip"),
                ),
              ],
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

  Widget _timeProposal(){
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
            ? Text("  Time proposal", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black),)
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
            _horaAElegir(8,0),
            _horaAElegir(11,30),
            _horaAElegir(15,0),
          ]
        ),
        TableRow(
          children: [
            _horaAElegir(8,30),
            _horaAElegir(12,0),
            _horaAElegir(16,0),
          ]
        ),
        TableRow(
          children: [
            _horaAElegir(9,0),
            _horaAElegir(12,30),
            _horaAElegir(16,30),
          ]
        ),
        TableRow(
          children: [
            _horaAElegir(9,30),
            _horaAElegir(13,00),
            _horaAElegir(17,0),
          ]
        ),
        TableRow(
          children: [
            _horaAElegir(10,0),
            _horaAElegir(13,30),
            _horaAElegir(17,30),
          ]
        ),
        TableRow(
          children: [
            _horaAElegir(10,30),
            _horaAElegir(14,0),
            _horaAElegir(18,00),
          ]
        ),
        TableRow(
          children: [
            _horaAElegir(11,0),
            _horaAElegir(14,30),
            Text("")
          ]
        ),
      ],
    );
  }

  Widget _horaAElegir(int _horaReal, int _minutosReal){
    return Row(
      children: <Widget>[
        Flexible(
          child: Radio(
          value: TimeOfDay(
            hour: _horaReal,
            minute: _minutosReal,
          ),
          onChanged: (value){
            setState(() {
              hour = value;
              print(value);
            });
          },
          groupValue: hour,
        ),
        ),
        Text("${TimeOfDay(hour: _horaReal, minute: _minutosReal).format(context).toString()}"),
      ],
    );
    
  }

  Future _dialogoParaTomarHora() async {
    hour = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now()
    );
    setState(() {
      
    });
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
            fontWeight: FontWeight.bold,
            color: Colors.black 
          )
        ),
        textCapitalization: TextCapitalization.sentences,
        maxLines: null,
        autovalidate: true,
      ),
    );
  }

  Widget _botonesModificarOlvidar(){
    return Container(
      padding: EdgeInsets.all(_margenPaginaHorizontal),
      child: Row(
        children: <Widget>[
          Expanded(
            child: CupertinoButton(
              padding: EdgeInsets.symmetric(horizontal: 0, vertical: 15),
              borderRadius: BorderRadius.zero,
              child: Text("Modify and Send", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
              color: Color(0xff29983A),
              onPressed: (){

              },
            ),
          ),
          SizedBox(width: 10,),
          Expanded(
            child: CupertinoButton(
              padding: EdgeInsets.symmetric(horizontal: 0, vertical: 15),
              borderRadius: BorderRadius.zero,
              child: Text("Dismiss", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
              color: Color(0xffEF4135),
              onPressed: (){

              },
            ),
          ),
        ],
      ),
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