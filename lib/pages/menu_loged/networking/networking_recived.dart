import 'package:felaban/components/barraSuperiorBACK.dart';
import 'package:felaban/components/barra_networking.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NetworkingRecived extends StatefulWidget {

  static const routeName = "/networkingRecived";
  final List requestRecived;
  NetworkingRecived(this.requestRecived,{Key key}) : super(key:key);

  @override
  _NetworkingRecivedState createState() => _NetworkingRecivedState();
}

class _NetworkingRecivedState extends State<NetworkingRecived> {

  double _margenHorizontal = 15;

  Widget _cuerpoDeLaPagina(){
    return ListView(
      children: <Widget>[
        barraNetworking(_margenHorizontal),
        _searchNavigation(),
        _actividadesRecived(),
      ],
    );
  }

  Widget _searchNavigation(){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 6, vertical: 18),
      padding: EdgeInsets.symmetric(horizontal: 10),
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

  Widget _actividadesRecived(){
    return Column(
      children: widget.requestRecived.map(
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: barraSuperior(context),
      body: _cuerpoDeLaPagina(),
    );
  }
}