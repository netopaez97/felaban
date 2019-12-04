import 'package:felaban/components/barraSuperiorBACK.dart';
import 'package:felaban/components/barra_networking.dart';
import 'package:felaban/pages/menu_loged/networking/networking_recived.dart';
import 'package:felaban/pages/menu_loged/networking/networking_sent_by_you.dart';
import 'package:felaban/routes/Routes.dart';
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
    false,//7
    false,//8
    false,//9
    false,//10
    false,//11
    false,//12
    false,//13
    false,//14
    false,//15
    false,//16
  ];
  List _requestRecived;
  List _requestSentByYou;

  double _margenHorizontal = 15;

  Widget _cuerpoDeLaPagina(){
    return ListView(
      children: <Widget>[
        barraNetworking(_margenHorizontal),
        _bienvenida(),
        _sentByYou(),
        _requestsRecived(),
        _setUpMatchMaking(),
        _whatYouAreOffering(),
        _lookingFor(),
      ],
    );
  }

  Widget _bienvenida(){
    return Container(
      padding: EdgeInsets.all(_margenHorizontal),
      child: Text("Welcome to the Networking Area.\nUse the FELABAN matchmaking and meeting platform before and during the Conference.", style: TextStyle(fontSize: 18),),
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
        trailing: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.red,
          ),
          width: 33,
          alignment: Alignment.center,
          child: Text(_requestSentByYou.length.toString(), style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),),
        ),
        children: <Widget>[
          Container(
            color: Colors.grey[50],
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _presentacionInvitaciones(),
                _actividadSentByYou(),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _presentacionInvitaciones(){
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.fromLTRB(_margenHorizontal, _margenHorizontal, _margenHorizontal,0),
      child: Text("You have sent ${_requestSentByYou.length} Invitations", style: TextStyle(color: Color(0xff8C8C8C), fontWeight: FontWeight.bold, fontSize: 16)),
    );
  }

  Widget _actividadSentByYou(){

    int _cantidadEspera = _requestSentByYou.where((solicitud) => solicitud["estado"]=="espera").length;
    int _cantidadConfirmados = _requestSentByYou.where((solicitud) => solicitud["estado"]=="confirmado").length;
    int _cantidadRechazados = _requestSentByYou.where((solicitud) => solicitud["estado"]=="rechazado").length;

    return Container(
      padding: EdgeInsets.fromLTRB(_margenHorizontal, 5, 0, _margenHorizontal),
      child: FlatButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(
            builder: (BuildContext context) => NetwrokingSentByYou(_requestSentByYou)
          ));
        },
        child: Table(
          children: [
            TableRow(
              children: [
                SizedBox(height: 10,),
                SizedBox(),
              ]
            ),
            TableRow(
              children: [
                Text("Approved:", style: TextStyle(color: Color(0xff8C8C8C), fontSize: 16)),
                Text(_cantidadEspera.toString(), style: TextStyle(color: Color(0xff8C8C8C), fontWeight: FontWeight.bold, fontSize: 16), textAlign: TextAlign.end,),
              ]
            ),
            TableRow(
              children: [
                SizedBox(height: 10,),
                SizedBox(),
              ]
            ),
            TableRow(
              children: [
                Text("Declined:", style: TextStyle(color: Color(0xff8C8C8C), fontSize: 16)),
                Text(_cantidadConfirmados.toString(), style: TextStyle(color: Color(0xff8C8C8C), fontWeight: FontWeight.bold, fontSize: 16), textAlign: TextAlign.end,),
              ]
            ),
            TableRow(
              children: [
                SizedBox(height: 10,),
                SizedBox(),
              ]
            ),
            TableRow(
              children: [
                Text("Waiting for approval:", style: TextStyle(color: Color(0xff8C8C8C), fontSize: 16)),
                Text(_cantidadRechazados.toString(), style: TextStyle(color: Color(0xff8C8C8C), fontWeight: FontWeight.bold, fontSize: 16), textAlign: TextAlign.end,),
              ]
            ),
          ],
        ),
      ),
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _textoInvitacionesRecividas(),
              ],
            )
          ),
        ]
      )
    );
  }

  Widget _textoInvitacionesRecividas(){
    return Container(
      color: Colors.grey[50],
      alignment: Alignment.centerLeft,
      width: double.infinity,
      child: FlatButton(
        child: Text("You have received ${_requestRecived.length} invitations", style: TextStyle(color: Color(0xff8C8C8C), fontSize: 16),),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(
            builder: (BuildContext context) => NetworkingRecived(_requestRecived)
          ));
        },
      ),
    );
  }

  Widget _setUpMatchMaking(){
    return Container(
      color: Color(0xffEAFEEA),
      padding: EdgeInsets.symmetric(vertical: _margenHorizontal),
      child: ListTile(
        title: Text("Set up your matchmaking.", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Color(0xff404040)),),
        subtitle: Text("Define your profile and Networking interests.", style: TextStyle(fontSize: 18, color: Color(0xff404040)),),
        trailing: IconButton(
          icon: Icon(Icons.settings),
          onPressed: (){
            print("object");
          },
        ),
        onTap: (){
          
        },
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
                Text("Our algorithm uses your interests to match you with the right people", style: TextStyle(color: Color(0xff8C8C8C), fontSize: 18),),
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
                _softwareDevelopment1(),
                _marketingYBigData1(),
                _productDesign1(),
                _bankingAndSecurity1(),
                _artificialIntelligenceAndOther1(),
              ],
            ),
          )
        ],
      ),
    );
  }



  Widget _softwareDevelopment1(){
    return GestureDetector(
      onTap: (){
        setState(() {
          _etiquetasOprimidas[8] = !_etiquetasOprimidas[8];
        });
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xffC4C4C4)),
          borderRadius: BorderRadius.circular(10),
          color: _etiquetasOprimidas[8] == false
          ? Color(0xffF6F6F6)
          : Color(0xffA1A1A1)
        ),
        padding: EdgeInsets.symmetric(vertical: _margenHorizontal, horizontal: _margenHorizontal+5),
        margin: EdgeInsets.only(top: _margenHorizontal, bottom: 5),
        child: Text("Software Develoment", style: TextStyle(fontSize: 16),)
      ),
    );
  }

  Widget _marketingYBigData1(){
    return Row(
      children: <Widget>[
        GestureDetector(
          onTap: (){
            setState(() {
              _etiquetasOprimidas[9] = !_etiquetasOprimidas[9];
            });
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xffC4C4C4)),
              borderRadius: BorderRadius.circular(10),
              color: _etiquetasOprimidas[9] == false
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
              _etiquetasOprimidas[10] = !_etiquetasOprimidas[10];
            });
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xffC4C4C4)),
              borderRadius: BorderRadius.circular(10),
              color: _etiquetasOprimidas[10] == false
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

  Widget _productDesign1(){
    return GestureDetector(
      onTap: (){
        setState(() {
          _etiquetasOprimidas[11] = !_etiquetasOprimidas[11];
        });
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xffC4C4C4)),
          borderRadius: BorderRadius.circular(10),
          color: _etiquetasOprimidas[11] == false
          ? Color(0xffF6F6F6)
          : Color(0xffA1A1A1)
        ),
        padding: EdgeInsets.symmetric(vertical: _margenHorizontal, horizontal: _margenHorizontal+5),
        margin: EdgeInsets.symmetric(vertical: 5),
        child: Text("Product Design", style: TextStyle(fontSize: 16),)
      ),
    );
  }

  Widget _bankingAndSecurity1(){
    return Row(
      children: <Widget>[
        GestureDetector(
          onTap: (){
            setState(() {
              _etiquetasOprimidas[12] = !_etiquetasOprimidas[12];
            });
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xffC4C4C4)),
              borderRadius: BorderRadius.circular(10),
              color: _etiquetasOprimidas[12] == false
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
              _etiquetasOprimidas[13] = !_etiquetasOprimidas[13];
            });
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xffC4C4C4)),
              borderRadius: BorderRadius.circular(10),
              color: _etiquetasOprimidas[13] == false
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

  Widget _artificialIntelligenceAndOther1(){
    return Row(
      children: <Widget>[
        GestureDetector(
          onTap: (){
            setState(() {
              _etiquetasOprimidas[14] = !_etiquetasOprimidas[14];
            });
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xffC4C4C4)),
              borderRadius: BorderRadius.circular(10),
              color: _etiquetasOprimidas[14] == false
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
              _etiquetasOprimidas[15] = !_etiquetasOprimidas[15];
            });
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xffC4C4C4)),
              borderRadius: BorderRadius.circular(10),
              color: _etiquetasOprimidas[15] == false
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


  @override
  void initState() {
    super.initState();

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