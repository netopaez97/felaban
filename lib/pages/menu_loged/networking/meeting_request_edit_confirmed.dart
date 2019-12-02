import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RequestEditConfirmedDeclinedPage extends StatefulWidget {

  @override
  _RequestEditConfirmedDeclinedPageState createState() => _RequestEditConfirmedDeclinedPageState();
}

class _RequestEditConfirmedDeclinedPageState extends State<RequestEditConfirmedDeclinedPage> {
  
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
        _nombreYcalendario(),
        _barraDeDivision(),
        _meetingDetails(),
        _messageText(),
        _botonesModificarOlvidar(),
        _botonReSchedule(),
      ],
    );
  }

  Widget _nombreYcalendario(){
    return Container(
      color: Color(0xffF6F6F6),
      child: ListTile(
        title: Text("Alfredo Cubillos", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
        subtitle: Text("CEO Microsoft", style: TextStyle(fontSize: 16),),
        trailing: Image.asset("assets/detalleAgenda/calendario.png", color: Colors.black)
      ),
    );
  }

  Widget _barraDeDivision(){
    return Divider(
      color: Color(0xffC4C4C4),
    );
  }

  Widget _meetingDetails(){
    return Container(
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
    );
  }

  Widget _messageText(){
    return Container(
      padding: EdgeInsets.all(_margenPaginaHorizontal),
      child: TextFormField(
        
        decoration: InputDecoration(
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
              padding: EdgeInsets.all(0),
              borderRadius: BorderRadius.zero,
              child: Text("Confirmed", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
              color: Color(0xff29983A),
              onPressed: (){

              },
            ),
          ),
          SizedBox(width: 10,),
          Expanded(
            child: CupertinoButton(
              padding: EdgeInsets.all(0),
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
          padding: EdgeInsets.symmetric(horizontal: 20),
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
      backgroundColor: Colors.white,
      appBar: _barraSuperior(),
      body: _cuerpoDeLaPagina(),
    );
  }
}