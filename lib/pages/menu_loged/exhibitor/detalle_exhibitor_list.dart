import 'package:felaban/components/barraSuperiorBACK.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExhibitorDetailPage extends StatefulWidget {

  final Map _exhibitor;
  ExhibitorDetailPage(this._exhibitor,{Key key}) : super(key:key);

  @override
  _ExhibitorDetailPageState createState() => _ExhibitorDetailPageState();
}

class _ExhibitorDetailPageState extends State<ExhibitorDetailPage> {
  
  final double _margenHorizontal = 10;
  bool _isFav = false;
  
  Widget _cuerpoDeLaPagina(){
    return ListView(
      children: <Widget>[
        _imagenDeCabecera(widget._exhibitor["imageLocation"]),
        _barraFavorito(),
        _informacionPreliminar(),
        Divider(color: Color(0xffC4C4C4),),
        _descripcion(),
        _botones(),
      ],
    );
  }

  Widget _imagenDeCabecera( String imagenUbicacion){
    return Container(
      child: Image.asset("assets/exhibitors/lda_technologies.png"),
    );
  }

  Widget _barraFavorito(){
    return Container(
      alignment: Alignment.centerRight,
      height: 58,
      color: Color(0xff489ED2),
      child: CupertinoButton(
        child: _isFav == false ? Icon(CupertinoIcons.heart, color: Colors.white,) : Icon(CupertinoIcons.heart_solid, color: Colors.white,),
        onPressed: (){
          setState(() {
            _isFav = !_isFav;
          });
        },
      ),
    );
  }

  Widget _informacionPreliminar(){
    return Container(
      padding: EdgeInsets.symmetric(vertical: _margenHorizontal),
      child: ListTile(
        title: Text(widget._exhibitor["name"], style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        subtitle: Column(
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            Row(
              children: <Widget>[
                Icon(Icons.location_on, color: Color(0xff8C8C8C),),
                Text("Booth Number: ${widget._exhibitor["booth"]}", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Color(0xffEF4135)),),
              ],
            ),
          ],
        )
      ),
    );
  }

  Widget _descripcion(){
    return Container(
      padding: EdgeInsets.all(_margenHorizontal),
      child: Text(widget._exhibitor["description"], style: TextStyle(fontSize: 18),),
    );
  }

  Widget _botones(){
    return Container(
      padding: EdgeInsets.all(_margenHorizontal),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: CupertinoButton(
              borderRadius: BorderRadius.zero,
              padding: EdgeInsets.all(0),
              onPressed: (){

              },
              child: Text("EMAIL"),
              color: Color(0xffC4C4C4),
            ),
          ),
          SizedBox(width: 20,),
          Expanded(
            child: CupertinoButton(
              borderRadius: BorderRadius.zero,
              padding: EdgeInsets.all(0),
              onPressed: (){

              },
              child: Text("EMAIL"),
              color: Color(0xffC4C4C4),
            ),
          ),
        ],
      ),
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