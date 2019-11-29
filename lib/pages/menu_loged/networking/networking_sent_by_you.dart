import 'package:felaban/components/barraSuperiorBACK.dart';
import 'package:felaban/components/barra_networking.dart';
import 'package:flutter/material.dart';

class NetwrokingSentByYou extends StatefulWidget {

  static const routeName = "/networkingSentByYou";

  @override
  _NetwrokingSentByYouState createState() => _NetwrokingSentByYouState();
}

class _NetwrokingSentByYouState extends State<NetwrokingSentByYou> {

  double _margenHorizontal = 15;

  List _requestSentByYou;

  Widget _cuerpoDeLaPagina(){
    return ListView(
      children: <Widget>[
        barraNetworking(_margenHorizontal),
        _invitaciones(),
      ],
    );
  }

  Widget _invitaciones(){
    return Column(
      children: _requestSentByYou.map(
        (invitacionEnviada) => Column(
          children: <Widget>[
            Divider(height: 1, color: Color(0xffC4C4C4),),
            Container(
              padding: EdgeInsets.all(_margenHorizontal),
              child: Table(
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                children: [
                  TableRow(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(invitacionEnviada["para"], style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                          Text(invitacionEnviada["empresa"], style: TextStyle(fontSize: 16),),
                        ],
                      ),
                      invitacionEnviada["estado"] == "espera"
                      ? GestureDetector(
                        onTap: (){
                          showDialog(
                            context: context,
                            builder: (BuildContext context){
                              return AlertDialog(
                                title: Text("Meeting request EDIT"),
                              );
                            }
                          );
                        },
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border: Border.all(color: Color(0xffC4C4C4)),
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xffF6F6F6)
                          ),
                          padding: EdgeInsets.symmetric(vertical: _margenHorizontal, horizontal: _margenHorizontal+5),
                          margin: EdgeInsets.only(top: 5, bottom: _margenHorizontal),
                          child: Text("Modify / Cancel", style: TextStyle(fontSize: 16),)
                        )
                      )
                      : invitacionEnviada["estado"] == "confirmado"
                        ? GestureDetector(
                          onTap: (){
                            
                          },
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              border: Border.all(color: Color(0xff29983A)),
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xffF6F6F6)
                            ),
                            padding: EdgeInsets.symmetric(vertical: _margenHorizontal, horizontal: _margenHorizontal+5),
                            margin: EdgeInsets.only(top: 5, bottom: _margenHorizontal),
                            child: Text("CONFIRMED", style: TextStyle(fontSize: 16),)
                          )
                        )
                        : GestureDetector(
                          onTap: (){
                            
                          },
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              border: Border.all(color: Color(0xffEF4135)),
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xffF6F6F6)
                            ),
                            padding: EdgeInsets.symmetric(vertical: _margenHorizontal, horizontal: _margenHorizontal+5),
                            margin: EdgeInsets.only(top: 5, bottom: _margenHorizontal),
                            child: Text("DECLINED", style: TextStyle(fontSize: 16),)
                          ),
                        ),
                    ]
                  ),
                  TableRow(
                    children: [
                      Text(invitacionEnviada["fecha"], style: TextStyle(fontSize: 16, color: Color(0xff8C8C8C))),
                      Text(invitacionEnviada["hora"], style: TextStyle(fontSize: 16, color: Color(0xff8C8C8C)), textAlign: TextAlign.center,),
                    ]
                  ),
                  TableRow(
                    children: [
                      Text(invitacionEnviada["lugar"], style: TextStyle(fontSize: 16, color: Color(0xff8C8C8C))),
                      Text(invitacionEnviada["duracion"], style: TextStyle(fontSize: 16, color: Color(0xff8C8C8C)), textAlign: TextAlign.center,),
                    ]
                  ),
                ],
              ),
            ),
          ],
        ),
      ).toList(),
    );
  }

  @override
  void initState() {
    super.initState();


    _requestSentByYou = [
      {
        "para":"Matt Higgins1",
        "empresa":"CEO Microsoft",
        "fecha":"Monday 15, February",
        "lugar":"Lobby Area",
        "hora":"8:30 AM",
        "duracion":"30 Min",
        "estado":"espera"
      },
      {
        "para":"Matt Higgins2",
        "empresa":"CEO Microsoft",
        "fecha":"Monday 15, February",
        "lugar":"Lobby Area",
        "hora":"8:30 AM",
        "duracion":"30 Min",
        "estado":"confirmado"
      },
      {
        "para":"Matt Higgins3",
        "empresa":"CEO Microsoft",
        "fecha":"Monday 15, February",
        "lugar":"Lobby Area",
        "hora":"8:30 AM",
        "duracion":"30 Min",
        "estado":"espera"
      },
      {
        "para":"Matt Higgins4",
        "empresa":"CEO Microsoft",
        "fecha":"Monday 15, February",
        "lugar":"Lobby Area",
        "hora":"8:30 AM",
        "duracion":"30 Min",
        "estado":"rechazado"
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: barraSuperior(context),
      body: _cuerpoDeLaPagina(),
    );
  }
}