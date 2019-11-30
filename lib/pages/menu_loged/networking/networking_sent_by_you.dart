import 'package:felaban/components/barraSuperiorBACK.dart';
import 'package:felaban/components/barra_networking.dart';
import 'package:felaban/pages/menu_loged/networking/filtros.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
        _searchAndFilters(),
        _barraMeetingRequest(),
        _presentacionInvitaciones(),
        _invitaciones(),
      ],
    );
  }

  Widget _searchAndFilters(){
    return Container(
      padding: EdgeInsets.all(_margenHorizontal),
      child: Row(
        children: <Widget>[
          Expanded(
            child: _searchNavigation(),
          ),
          SizedBox(width: 10,),
          Text("Filters", style: TextStyle(fontSize: 18),),
          IconButton(
            icon: Icon(IconData(0xF39D, fontFamily: CupertinoIcons.iconFont, fontPackage: CupertinoIcons.iconFontPackage), size: 34, color: Color(0xffA1A1A1),),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(
                builder: (BuildContext context) => NetWorkingFiltros()
              ));
            },
          )
        ],
      ),
    );
  }

  Widget _searchNavigation(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      height: 60,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Color(0xffE9E6E6),
      ),
      child: TextField(
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: "search...",
          labelStyle: TextStyle(fontSize: 20),
          icon: Icon(Icons.search),
        ),
      ),
    );
  }

  Widget _barraMeetingRequest(){
    return Container(
      height: 70,
      color: Color(0xffF0F0F0),
      padding: EdgeInsets.all(_margenHorizontal),
      child: Row(
        children: <Widget>[
          Text("Meeting Requests ", style: TextStyle(fontSize: 18, color: Colors.black)),
          Text("Sent by You", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),)
        ],
      ),
    );
  }



  Widget _presentacionInvitaciones(){
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.all(_margenHorizontal),
      child: Text("You have sent the following invitations:", style: TextStyle(color: Color(0xff8C8C8C), fontSize: 16)),
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
                      ? Container(
                        margin: EdgeInsets.only(top: 10, left: 10, bottom: 10),
                        child: CupertinoButton(
                          child: Text("Modify / Cancel", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),),
                          color: Color(0xff7B98A0),
                          padding: EdgeInsets.all(0),
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          onPressed: (){
                            showDialog(
                              context: context,
                              builder: (BuildContext context){
                                return AlertDialog(
                                  title: Text("Meeting request EDIT"),
                                );
                              }
                            );
                          },
                        ),
                      )
                      : invitacionEnviada["estado"] == "confirmado"
                        ?Container(
                          margin: EdgeInsets.only(top: 10, left: 10, bottom: 10),
                          child: CupertinoButton(
                            child: Text("Confirmed", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),),
                            color: Color(0xff60B842),
                            padding: EdgeInsets.all(0),
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            onPressed: (){
                              showDialog(
                                context: context,
                                builder: (BuildContext context){
                                  return AlertDialog(
                                    title: Text("Meeting request EDIT"),
                                  );
                                }
                              );
                            },
                          ),
                        )
                        : Container(
                          margin: EdgeInsets.only(top: 10, left: 10, bottom: 10),
                          child: CupertinoButton(
                            child: Text("Declined", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),),
                            color: Color(0xffD80027),
                            padding: EdgeInsets.all(0),
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            onPressed: (){
                              showDialog(
                                context: context,
                                builder: (BuildContext context){
                                  return AlertDialog(
                                    title: Text("Meeting request EDIT"),
                                  );
                                }
                              );
                            },
                          ),
                        )
                    ]
                  ),
                  TableRow(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        child: Text(invitacionEnviada["fecha"], style: TextStyle(fontSize: 16, color: Color(0xff8C8C8C)))
                      ),
                      Text(invitacionEnviada["hora"], style: TextStyle(fontSize: 16, color: Color(0xff8C8C8C)), textAlign: TextAlign.center,),
                    ]
                  ),
                  TableRow(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        child: Text(invitacionEnviada["lugar"], style: TextStyle(fontSize: 16, color: Color(0xff8C8C8C))),
                      ),
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