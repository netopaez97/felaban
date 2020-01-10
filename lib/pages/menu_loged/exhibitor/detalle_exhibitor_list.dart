import 'package:felaban/components/barraSuperiorBACK.dart';
import 'package:felaban/models/exhibitorModel.dart';
import 'package:felaban/providers/exhibitor_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExhibitorDetailPage extends StatefulWidget {

  final ExhibitorsModel _exhibitor;
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
        _imagenDeCabecera(widget._exhibitor.imageLocation),
        _barraFavorito(),
        _informacionPreliminar(),
        Divider(color: Color(0xffC4C4C4),),
        _descripcion(),
        SizedBox(height: 30,),
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

    final ExhibitorProvider _exhibitorInfo = Provider.of<ExhibitorProvider>(context);
    final ExhibitorsModel _exhibitorActual = _exhibitorInfo.exhibitorActual;

    print(_exhibitorActual);

    
    return Container(
      alignment: Alignment.centerRight,
      height: 58,
      color: Color(0xff489ED2),
      child: IconButton(
        icon: _exhibitorActual.favorite==false
          ? Icon(IconData(0xF442, fontFamily: CupertinoIcons.iconFont, fontPackage: CupertinoIcons.iconFontPackage), color: Colors.white, size: 34,)
          : Icon(IconData(0xF443, fontFamily: CupertinoIcons.iconFont, fontPackage: CupertinoIcons.iconFontPackage), color: Colors.white, size: 34,),
          onPressed: (){
            if(_exhibitorActual.favorite==false)
              setState(() {
                _exhibitorInfo.agregarExhibitorAFavoritos = _exhibitorActual;
                _exhibitorActual.favorite=!_exhibitorActual.favorite;
              });
            else
              setState(() {
                _exhibitorInfo.eliminarExhibitorAFavoritos = _exhibitorActual;
                _exhibitorActual.favorite=!_exhibitorActual.favorite;
              });
          }
      ),
    );
  }

  Widget _informacionPreliminar(){
    return Container(
      padding: EdgeInsets.symmetric(vertical: _margenHorizontal),
      child: ListTile(
        title: Text(widget._exhibitor.name, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        subtitle: Column(
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            Row(
              children: <Widget>[
                Icon(Icons.location_on, color: Color(0xff8C8C8C),),
                Text("Booth Number: ${widget._exhibitor.booth}", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Color(0xffEF4135)),),
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
      child: Text(widget._exhibitor.description, style: TextStyle(fontSize: 18),),
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
              child: Text("WEBSITE"),
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