import 'package:felaban/components/backgroundSuperior.dart';
import 'package:felaban/components/backgroundSuperiorPequeno.dart';
import 'package:felaban/components/barraSuperiorBACK.dart';
import 'package:flutter/material.dart';

class ExhibitorListPage extends StatefulWidget {

  static const String routeName = "/exhibitorList";

  @override
  _ExhibitorListPageState createState() => _ExhibitorListPageState();
}

class _ExhibitorListPageState extends State<ExhibitorListPage> {

  final double _margenHorizontal = 15;

  List _exhibitors;

  Widget _cuerpoDeLaPagina(){
    return ListView(
      children: <Widget>[
        BackgroundSuperiorPequenoWidget(),
        _barraExhibitorList(),
        _searchNavigation(),
        _exhibitorsList(),
      ],
    );
  }

  Widget _barraExhibitorList(){
    return Container(
      height: 53,
      alignment: Alignment.center,
      color: Color(0xff489ED2),
      padding: EdgeInsets.all(_margenHorizontal),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text("Exhibitor List", style: TextStyle(color: Colors.white, fontSize: 20),),
          Container(
            width: 35,
            child: Image.asset("assets/drawerImages/exhibitor.png", color: Colors.white, fit: BoxFit.contain,),
          ),
        ],
      )
    );
  }

  Widget _searchNavigation(){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: _margenHorizontal),
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

  Widget _exhibitorsList(){

    List _tenderosConL = _exhibitors.where((tendero) => tendero["name"].split("")[0] == "L").toList();
    List _tenderosConM = _exhibitors.where((tendero) => tendero["name"].split("")[0] == "M").toList();
    List _tenderosConN = _exhibitors.where((tendero) => tendero["name"].split("")[0] == "N").toList();



    return Column(
      children: <Widget>[
        _letraTitulo("L"),
        ... _tenderosConL.map((tenderoL) => ListTile(title: Text(tenderoL["name"]),)),
        _letraTitulo("M"),
        ... _tenderosConM.map((tenderoM) => ListTile(title: Text(tenderoM["name"]),)),
        _letraTitulo("N"),
        ... _tenderosConN.map((tenderoN) => ListTile(title: Text(tenderoN["name"]),)),
      ],
    );
  }

  Widget _letraTitulo(String _letra){
    return Container(
      color: Color(0xffF0F0F0),
      child: Text(_letra, style: TextStyle(color: Color(0xffC18B8B), fontSize: 30, fontWeight: FontWeight.bold),),
      width: double.infinity,
      height: 53,
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.symmetric(horizontal: _margenHorizontal),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _exhibitors = [
      {
        "name":"LUXWORX - MACVAD GROUP",
        "booth": "108",
        "summary": "Smart-repair™ products that make your life easier.",
        "description": "Coca-Cola, conocida comúnmente como Coca en muchos países hispanohablantes (en inglés Coke) es una bebida gaseosa y refrescante, vendida a nivel mundial, en tiendas, restaurantes y máquinas expendedoras en más de doscientos países o territorios. Es un producto de The Coca-Cola Company. En un principio, cuando la inventó el farmacéutico John Pemberton, fue concebida como una bebida medicinal patentada.",
        "imageLocation": "assets/exhibitors/lda_technologies.png"
      },
      {
        "name":"LDA International",
        "booth": "209",
        "summary": "Batteries, Home Hardware, Face Masks, Closeouts",
        "description": "Coca-Cola, conocida comúnmente como Coca en muchos países hispanohablantes (en inglés Coke) es una bebida gaseosa y refrescante, vendida a nivel mundial, en tiendas, restaurantes y máquinas expendedoras en más de doscientos países o territorios. Es un producto de The Coca-Cola Company. En un principio, cuando la inventó el farmacéutico John Pemberton, fue concebida como una bebida medicinal patentada.",
        "imageLocation": "assets/exhibitors/lda_technologies.png"
      },
      {
        "name":"MDA International",
        "booth": "209",
        "summary": "Batteries, Home Hardware, Face Masks, Closeouts",
        "description": "Coca-Cola, conocida comúnmente como Coca en muchos países hispanohablantes (en inglés Coke) es una bebida gaseosa y refrescante, vendida a nivel mundial, en tiendas, restaurantes y máquinas expendedoras en más de doscientos países o territorios. Es un producto de The Coca-Cola Company. En un principio, cuando la inventó el farmacéutico John Pemberton, fue concebida como una bebida medicinal patentada.",
        "imageLocation": "assets/exhibitors/lda_technologies.png"
      },
      {
        "name":"NDA International",
        "booth": "209",
        "summary": "Batteries, Home Hardware, Face Masks, Closeouts",
        "description": "Coca-Cola, conocida comúnmente como Coca en muchos países hispanohablantes (en inglés Coke) es una bebida gaseosa y refrescante, vendida a nivel mundial, en tiendas, restaurantes y máquinas expendedoras en más de doscientos países o territorios. Es un producto de The Coca-Cola Company. En un principio, cuando la inventó el farmacéutico John Pemberton, fue concebida como una bebida medicinal patentada.",
        "imageLocation": "assets/exhibitors/lda_technologies.png"
      },
      {
        "name":"LDA International",
        "booth": "209",
        "summary": "Batteries, Home Hardware, Face Masks, Closeouts",
        "description": "Coca-Cola, conocida comúnmente como Coca en muchos países hispanohablantes (en inglés Coke) es una bebida gaseosa y refrescante, vendida a nivel mundial, en tiendas, restaurantes y máquinas expendedoras en más de doscientos países o territorios. Es un producto de The Coca-Cola Company. En un principio, cuando la inventó el farmacéutico John Pemberton, fue concebida como una bebida medicinal patentada.",
        "imageLocation": "assets/exhibitors/lda_technologies.png"
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