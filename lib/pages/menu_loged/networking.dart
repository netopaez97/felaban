import 'package:felaban/components/barraSuperiorBACK.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NetworkingArea extends StatefulWidget {

  static const routeName = "/networking";

  @override
  _NetworkingAreaState createState() => _NetworkingAreaState();
}

class _NetworkingAreaState extends State<NetworkingArea> {

  List _etiquetasOprimidas = [
    true,//0
    false,//1
    false,//2
    false,//3
    false,//4
    false,//5
    false,//6
    false,//6
  ];

  List _requestSentByYou;
  List _requestRecived;

  double _margenHorizontal = 15;

  Widget _cuerpoDeLaPagina(){
    return ListView(
      children: <Widget>[
        _barraAttendees(),
        _whatYouAreOffering(),
        _lookingFor(),
        _sentByYou(),
        _requestsRecived(),
      ],
    );
  }

  Widget _barraAttendees(){
    return Container(
      color: Color(0xff489ED2),
      padding: EdgeInsets.symmetric(horizontal: _margenHorizontal),
      height: 53,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text("Networking Area", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),),
          Image.asset("assets/drawerImages/deal.png", color: Colors.white,),
        ],
      ),
    );
  }

  Widget _whatYouAreOffering(){
    return Container(
      color: Color(0xffF0F0F0),
      child: ExpansionTile(
        title: Row(
          children: <Widget>[
            Text("Tell others what you’re ", style: TextStyle(fontSize: 18, color: Colors.black)),
            Text("offering", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),)
          ],
        ),
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(_margenHorizontal),
            color: Colors.grey[50],
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Our algorith uses your interests to match you with the right people", style: TextStyle(color: Color(0xff8C8C8C), fontSize: 18),),
                _softwareDevelopment(),
                _marketingYBigData(),
                _productDesign(),
                _bankingAndSecurity(),
                _artificialIntelligenceAndOther(),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _softwareDevelopment(){
    return GestureDetector(
      onTap: (){
        setState(() {
          _etiquetasOprimidas[0] = !_etiquetasOprimidas[0];
        });
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xffC4C4C4)),
          borderRadius: BorderRadius.circular(10),
          color: _etiquetasOprimidas[0] == false
          ? Color(0xffF6F6F6)
          : Color(0xffA1A1A1)
        ),
        padding: EdgeInsets.symmetric(vertical: _margenHorizontal, horizontal: _margenHorizontal+5),
        margin: EdgeInsets.only(top: _margenHorizontal, bottom: 5),
        child: Text("Software Develoment", style: TextStyle(fontSize: 16),)
      ),
    );
  }

  Widget _marketingYBigData(){
    return Row(
      children: <Widget>[
        GestureDetector(
          onTap: (){
            setState(() {
              _etiquetasOprimidas[1] = !_etiquetasOprimidas[1];
            });
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xffC4C4C4)),
              borderRadius: BorderRadius.circular(10),
              color: _etiquetasOprimidas[1] == false
              ? Color(0xffF6F6F6)
              : Color(0xffA1A1A1)
            ),
            padding: EdgeInsets.symmetric(vertical: _margenHorizontal, horizontal: _margenHorizontal+5),
            margin: EdgeInsets.symmetric(vertical: 5),
            child: Text("Marketing", style: TextStyle(fontSize: 16),)
          ),
        ),
        SizedBox(width: 10,),
        GestureDetector(
          onTap: (){
            setState(() {
              _etiquetasOprimidas[2] = !_etiquetasOprimidas[2];
            });
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xffC4C4C4)),
              borderRadius: BorderRadius.circular(10),
              color: _etiquetasOprimidas[2] == false
              ? Color(0xffF6F6F6)
              : Color(0xffA1A1A1)
            ),
            padding: EdgeInsets.symmetric(vertical: _margenHorizontal, horizontal: _margenHorizontal+5),
            margin: EdgeInsets.symmetric(vertical: 5),
            child: Text("Big Data", style: TextStyle(fontSize: 16),)
          ),
        ),
      ],
    );
  }

  Widget _productDesign(){
    return GestureDetector(
      onTap: (){
        setState(() {
          _etiquetasOprimidas[3] = !_etiquetasOprimidas[3];
        });
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xffC4C4C4)),
          borderRadius: BorderRadius.circular(10),
          color: _etiquetasOprimidas[3] == false
          ? Color(0xffF6F6F6)
          : Color(0xffA1A1A1)
        ),
        padding: EdgeInsets.symmetric(vertical: _margenHorizontal, horizontal: _margenHorizontal+5),
        margin: EdgeInsets.symmetric(vertical: 5),
        child: Text("Product Design", style: TextStyle(fontSize: 16),)
      ),
    );
  }

  Widget _bankingAndSecurity(){
    return Row(
      children: <Widget>[
        GestureDetector(
          onTap: (){
            setState(() {
              _etiquetasOprimidas[4] = !_etiquetasOprimidas[4];
            });
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xffC4C4C4)),
              borderRadius: BorderRadius.circular(10),
              color: _etiquetasOprimidas[4] == false
              ? Color(0xffF6F6F6)
              : Color(0xffA1A1A1)
            ),
            padding: EdgeInsets.symmetric(vertical: _margenHorizontal, horizontal: _margenHorizontal+5),
            margin: EdgeInsets.symmetric(vertical: 5),
            child: Text("Online Banking", style: TextStyle(fontSize: 16),)
          ),
        ),
        SizedBox(width: 10,),
        GestureDetector(
          onTap: (){
            setState(() {
              _etiquetasOprimidas[5] = !_etiquetasOprimidas[5];
            });
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xffC4C4C4)),
              borderRadius: BorderRadius.circular(10),
              color: _etiquetasOprimidas[5] == false
              ? Color(0xffF6F6F6)
              : Color(0xffA1A1A1)
            ),
            padding: EdgeInsets.symmetric(vertical: _margenHorizontal, horizontal: _margenHorizontal+5),
            margin: EdgeInsets.symmetric(vertical: 5),
            child: Text("Security", style: TextStyle(fontSize: 16),)
          ),
        ),
      ],
    );
  }

  Widget _artificialIntelligenceAndOther(){
    return Row(
      children: <Widget>[
        GestureDetector(
          onTap: (){
            setState(() {
              _etiquetasOprimidas[6] = !_etiquetasOprimidas[6];
            });
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xffC4C4C4)),
              borderRadius: BorderRadius.circular(10),
              color: _etiquetasOprimidas[6] == false
              ? Color(0xffF6F6F6)
              : Color(0xffA1A1A1)
            ),
            padding: EdgeInsets.symmetric(vertical: _margenHorizontal, horizontal: _margenHorizontal+5),
            margin: EdgeInsets.only(top: 5, bottom: _margenHorizontal),
            child: Text("Artificial Inteligence", style: TextStyle(fontSize: 16),)
          ),
        ),
        SizedBox(width: 10,),
        GestureDetector(
          onTap: (){
            setState(() {
              _etiquetasOprimidas[7] = !_etiquetasOprimidas[7];
            });
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xffC4C4C4)),
              borderRadius: BorderRadius.circular(10),
              color: _etiquetasOprimidas[7] == false
              ? Color(0xffF6F6F6)
              : Color(0xffA1A1A1)
            ),
            padding: EdgeInsets.symmetric(vertical: _margenHorizontal, horizontal: _margenHorizontal+5),
            margin: EdgeInsets.only(top: 5, bottom: _margenHorizontal),
            child: Text("Other", style: TextStyle(fontSize: 16),)
          ),
        ),
      ],
    );
  }


  Widget _lookingFor(){
    return Container(
      color: Color(0xffF0F0F0),
      child: ExpansionTile(
        title: Row(
          children: <Widget>[
            Text("Tell us what you’re ", style: TextStyle(fontSize: 18, color: Colors.black)),
            Text("Looking for?", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),)
          ],
        ),
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(_margenHorizontal),
            color: Colors.grey[50],
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _softwareDevelopment(),
                _marketingYBigData(),
                _productDesign(),
                _bankingAndSecurity(),
                _artificialIntelligenceAndOther(),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _sentByYou(){
    return Container(
      color: Color(0xffF0F0F0),
      child: ExpansionTile(
        title: Row(
          children: <Widget>[
            Text("Meeting Requests ", style: TextStyle(fontSize: 18, color: Colors.black)),
            Text("Sent by You", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),)
          ],
        ),
        children: <Widget>[
          Container(
            color: Colors.grey[50],
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _presentacionInvitaciones("You have sent the following invitations:"),
                _actividadSentByYou(),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _presentacionInvitaciones(String mensaje){
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.all(_margenHorizontal),
      child: Text(mensaje, style: TextStyle(fontSize: 16, color: Color(0xff8C8C8C)),)
    );
  }

  Widget _actividadSentByYou(){

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

  Widget _requestsRecived(){
    return Container(
      color: Color(0xffF0F0F0),
      child: ExpansionTile(
        title: Row(
          children: <Widget>[
            Text("Meeting Requests ", style: TextStyle(fontSize: 18, color: Colors.black)),
            Text("Received", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),),
          ],
        ),
        trailing: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.red,
          ),
          width: 33,
          alignment: Alignment.center,
          child: Text(_requestRecived.length.toString(), style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),),
        ),
        children: <Widget>[
          Container(
            color: Colors.grey[50],
            width: double.infinity,
            child: Column(
              children: <Widget>[
                _presentacionInvitaciones("You have received the following invitations:"),
                _actividadesRecived(),
              ],
            )
          )
        ]
      )
    );
  }

  Widget _actividadesRecived(){
    return Column(
      children: _requestRecived.map(
        (solicitud) => Column(
          children: <Widget>[
            Divider(height: 5, color: Color(0xffC4C4C4),),
            Container(
              alignment: Alignment.centerLeft,
              width: double.infinity,
              color: Color(0xffF6F6F6),
              padding: EdgeInsets.all(_margenHorizontal),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text(solicitud["de"], style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                      Text(solicitud["empresa"], style: TextStyle(fontSize: 16),),
                    ],
                  ),
                  solicitud["estado"] == "confirmado"
                  ? GestureDetector(
                    child: Column(
                      children: <Widget>[
                        Image.asset("assets/networking/add_to_calendar.png"),
                        Text("Add to Calendar", style: TextStyle(fontSize: 12, color: Color(0xff423434)))
                      ],
                    ),
                  )
                  : Container(),
                ],
              )
            ),
            Container(
              padding: EdgeInsets.all(_margenHorizontal),
              child: Table(
                children: [
                  TableRow(
                    children: [
                      Text(solicitud["fecha"], style: TextStyle(fontSize: 16 ,color: Color(0xff888888)),),
                      Text(solicitud["hora"], textAlign: TextAlign.center, style: TextStyle(fontSize: 16 ,color: Color(0xff888888)),),
                    ]
                  ),
                  TableRow(
                    children: [
                      Text(solicitud["lugar"], style: TextStyle(fontSize: 16 ,color: Color(0xff888888)),),
                      Text(solicitud["duracion"], textAlign: TextAlign.center, style: TextStyle(fontSize: 16 ,color: Color(0xff888888)),),
                    ]
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(_margenHorizontal),
              child: Text(solicitud["mensaje"], style: TextStyle(fontSize: 16),),
            ),
            Container(
              padding: EdgeInsets.all(_margenHorizontal),
              child: Row(
                children: <Widget>[
                  solicitud["estado"] == "confirmado"
                  ? CupertinoButton(
                    color: Color(0xff29983A),
                    child: Text("CONFIRMED", style: TextStyle(fontWeight: FontWeight.bold),),
                    onPressed: (){

                    },
                  )
                  : CupertinoButton(
                    color: Color(0xffF6F6F6),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    child: Text("ACCEPT", style: TextStyle(color: Colors.black),),
                    onPressed: (){

                    },
                  ),
                ],
              ),
            )
          ],
        )
      ).toList()
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

    _requestRecived = [
      {
        "de":"Matt Higgins",
        "empresa":"CEO Microsoft",
        "fecha":"Monday 15, February",
        "lugar":"Lobby Area",
        "hora":"8:30 AM",
        "duracion":"30 Min",
        "estado":"espera",
        "mensaje":"I would like to invite you to stop by our booth #157 on the third floor and say Hello. You can lean more about our iSecurity suite of solutions. Raz-Lee Security is one of the world’s leading independent providers of cybersecurity and compliance solutions for IBM i servers (AS/400)."
      },
      {
        "de":"Matt Higgins",
        "empresa":"CEO Microsoft",
        "fecha":"Monday 15, February",
        "lugar":"Lobby Area",
        "hora":"8:30 AM",
        "duracion":"30 Min",
        "estado":"confirmado",
        "mensaje":"I would like to invite you to stop by our booth #157 on the third floor and say Hello. You can lean more about our iSecurity suite of solutions. Raz-Lee Security is one of the world’s leading independent providers of cybersecurity and compliance solutions for IBM i servers (AS/400)."
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


class NewItem {
  bool isExpanded;
  final String header;
  final Widget body;
  final Icon iconpic;
  NewItem(this.isExpanded, this.header, this.body, this.iconpic);
}