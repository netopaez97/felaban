import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RequestEditDetailsPage extends StatefulWidget {

  @override
  _RequestEditDetailsPageState createState() => _RequestEditDetailsPageState();
}

class _RequestEditDetailsPageState extends State<RequestEditDetailsPage> {
  
  final double _margenPaginaHorizontal = 10;
  DateTime dateTime;

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
        SizedBox(height: 10,),
        _barraNombreDestinatario(),
        _barraDeDivision(),
        _barraAsunto(),
        _barraDeDivision(),
        _meetingDetails(),
        _messageText(),
        _botonesModificarOlvidar(),
        _botonReSchedule(),
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

  Widget _barraAsunto(){

    double _anchoTOySUBJECT = MediaQuery.of(context).size.width*0.25;

    return Container(
      padding: EdgeInsets.all(_margenPaginaHorizontal),
      child: Row(
        children: <Widget>[
          Container(
            width: _anchoTOySUBJECT,
            child: Text("Subject:", style: TextStyle(fontSize: 16),),
          ),
          Text("Hello Alfredo", style: TextStyle(fontSize: 16))
        ],
      ),
    );
  }

  Widget _barraDeDivision(){
    return Divider(
      color: Color(0xffC4C4C4),
    );
  }

  Widget _meetingDetails(){
    return Material(
      elevation: 1,
      child: Container(
        padding: EdgeInsets.all(_margenPaginaHorizontal),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("MeetingDetails", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
            SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.all(5),
              child: Table(
                children: [
                  TableRow(
                    children: [
                      Text("Date:", style: TextStyle(fontSize: 18, color: Color(0xffA1A1A1)),),
                      Text("05 Nov 2020", style: TextStyle(fontWeight: FontWeight.bold ,fontSize: 18, color: Color(0xff5A8ACB)),),
                    ]
                  ),
                  TableRow(
                    children: [
                      SizedBox(height: 15,),
                      SizedBox(),
                    ]
                  ),
                  TableRow(
                    children: [
                      Text("Location:", style: TextStyle(fontSize: 18, color: Color(0xffA1A1A1)),),
                      Text("Main Lobby Area", style: TextStyle(fontWeight: FontWeight.bold ,fontSize: 18, color: Color(0xff5A8ACB)),),
                    ]
                  ),
                  TableRow(
                    children: [
                      SizedBox(height: 15,),
                      SizedBox(),
                    ]
                  ),
                  TableRow(
                    children: [
                      Text("Time:", style: TextStyle(fontSize: 18, color: Color(0xffA1A1A1)),),
                      Text("8:30 AM", style: TextStyle(fontWeight: FontWeight.bold ,fontSize: 18, color: Color(0xff5A8ACB)),),
                    ]
                  ),
                  TableRow(
                    children: [
                      SizedBox(height: 15,),
                      SizedBox(),
                    ]
                  ),
                  TableRow(
                    children: [
                      Text("Duration:", style: TextStyle(fontSize: 18, color: Color(0xffA1A1A1)),),
                      Text("30 Min", style: TextStyle(fontWeight: FontWeight.bold ,fontSize: 18, color: Color(0xff5A8ACB)),),
                    ]
                  ),
                ],
              ),
            )
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
          fillColor: Colors.white,
          border: InputBorder.none,
          filled: true,
          labelText: "Message:",
          labelStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black 
          )
        ),
        initialValue: "I would like to invite you to stop by our booth #157 on the third floor and say Hello. You can lean more about our iSecurity suite of solutions. Raz-Lee Security is one of the world’s leading independent providers of cybersecurity and compliance solutions for IBM i servers (AS/400).",
        keyboardType: TextInputType.text,
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
              child: Text("Accept", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
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
              child: Text("Decline", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
              color: Color(0xffEF4135),
              onPressed: (){

              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _botonReSchedule(){
    return Column(
      children: <Widget>[
        CupertinoButton(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          borderRadius: BorderRadius.zero,
          color: Color(0xffA1A1A1),
          child: Text("Re Schedule", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          onPressed: (){

          },
        )
      ],
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