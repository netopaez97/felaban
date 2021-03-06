import 'package:felaban/components/backgroundSuperiorPequeno.dart';
import 'package:felaban/components/barraSuperiorBACK.dart';
import 'package:felaban/models/exhibitorModel.dart';
import 'package:felaban/pages/menu_loged/exhibitor/detalle_exhibitor_list.dart';
import 'package:felaban/providers/exhibitor_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExhibitorListPage extends StatefulWidget {

  final List<ExhibitorsModel> _exhibitors;
  ExhibitorListPage(this._exhibitors, {Key key}) : super(key:key);

  static const String routeName = "/exhibitorList";

  @override
  _ExhibitorListPageState createState() => _ExhibitorListPageState();
}

class _ExhibitorListPageState extends State<ExhibitorListPage> {

  final double _margenHorizontal = 15;

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
    return GestureDetector(
      onTap: (){
        showSearch(
          context: context,
          delegate: SearchNavigation(),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5, vertical: _margenHorizontal),
        padding: EdgeInsets.symmetric(horizontal: 10),
        height: 60,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Color(0xffE9E6E6),
        ),
        child: Row(
          children: <Widget>[
            Text(" "),
            Icon(Icons.search, color: Color(0xff776C6C),),
            Text("  Search...", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xff776C6C)))
          ],
        )
      ),
    );
  }

  Widget _exhibitorsList(){

    ///Será necesario hacer una lista para cada letra a mi punto de vista. Este fue un análisis no profundo.

    List _tenderosConL = widget._exhibitors.where((tendero) => tendero.name.split("")[0] == "L").toList();
    List _tenderosConM = widget._exhibitors.where((tendero) => tendero.name.split("")[0] == "M").toList();
    List _tenderosConN = widget._exhibitors.where((tendero) => tendero.name.split("")[0] == "N").toList();

    final ExhibitorProvider _exhibitorInfo = Provider.of<ExhibitorProvider>(context);



    return Column(
      children: <Widget>[
        _letraTitulo("L"),
        ... _tenderosConL.map(
          (tenderoL) => Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(_margenHorizontal),
                child: ListTile(
                  title: Text(tenderoL.name, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Booth ${tenderoL.booth}", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Color(0xffEF4135)),),
                      Text(tenderoL.summary, style: TextStyle(fontSize: 16, color: Colors.black)),
                    ],
                  ),
                  onTap: (){
                    _exhibitorInfo.exhibitorActual = tenderoL;
                    Navigator.push(context, MaterialPageRoute(
                      builder: (BuildContext context) => ExhibitorDetailPage(tenderoL)
                    ));
                  },
                ),
              ),
              _separador(),
            ],
          )
        ),
        _letraTitulo("M"),
        ... _tenderosConM.map((tenderoM) => Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(_margenHorizontal),
                child: ListTile(
                  title: Text(tenderoM.name, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(tenderoM.booth, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Color(0xffEF4135)),),
                      Text(tenderoM.summary, style: TextStyle(fontSize: 16, color: Colors.black)),
                    ],
                  ),
                  onTap: (){
                    _exhibitorInfo.exhibitorActual = tenderoM;
                    Navigator.push(context, MaterialPageRoute(
                      builder: (BuildContext context) => ExhibitorDetailPage(tenderoM)
                    ));
                  },
                ),
              ),
              _separador(),
            ],
          )),
        _letraTitulo("N"),
        ... _tenderosConN.map((tenderoN) => Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(_margenHorizontal),
                child: ListTile(
                  title: Text(tenderoN.name, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(tenderoN.booth, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Color(0xffEF4135)),),
                      Text(tenderoN.summary, style: TextStyle(fontSize: 16, color: Colors.black)),
                    ],
                  ),
                  onTap: (){
                    _exhibitorInfo.exhibitorActual = tenderoN;
                    Navigator.push(context, MaterialPageRoute(
                      builder: (BuildContext context) => ExhibitorDetailPage(tenderoN)
                    ));
                  },
                ),
              ),
              _separador(),
            ],
          )),
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

  Widget _separador(){
    return Divider(height: 0, color: Color(0xffC4C4C4),);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: barraSuperior(context),
      body: _cuerpoDeLaPagina(),
    );
  }
}

class SearchNavigation extends SearchDelegate{

  List suggestions = [
    
  ];

  List exhibitors = [
    ExhibitorsModel(
      name:"LUXWORX - MACVAD GROUP",
      booth: "108",
      summary: "Smart-repair™ products that make your life easier.",
      description: "Coca-Cola, conocida comúnmente como Coca en muchos países hispanohablantes (en inglés Coke) es una bebida gaseosa y refrescante, vendida a nivel mundial, en tiendas, restaurantes y máquinas expendedoras en más de doscientos países o territorios. Es un producto de The Coca-Cola Company. En un principio, cuando la inventó el farmacéutico John Pemberton, fue concebida como una bebida medicinal patentada.",
      imageLocation: "assets/exhibitors/lda_technologies.png",
      favorite: false,
    ),
    ExhibitorsModel(
      name:"LDA International",
      booth: "209",
      summary: "Batteries, Home Hardware, Face Masks, Closeouts",
      description: "Coca-Cola, conocida comúnmente como Coca en muchos países hispanohablantes (en inglés Coke) es una bebida gaseosa y refrescante, vendida a nivel mundial, en tiendas, restaurantes y máquinas expendedoras en más de doscientos países o territorios. Es un producto de The Coca-Cola Company. En un principio, cuando la inventó el farmacéutico John Pemberton, fue concebida como una bebida medicinal patentada.",
      imageLocation: "assets/exhibitors/lda_technologies.png",
      favorite: false,
    ),
    ExhibitorsModel(
      name:"MDA International",
      booth: "209",
      summary: "Batteries, Home Hardware, Face Masks, Closeouts",
      description: "Coca-Cola, conocida comúnmente como Coca en muchos países hispanohablantes (en inglés Coke) es una bebida gaseosa y refrescante, vendida a nivel mundial, en tiendas, restaurantes y máquinas expendedoras en más de doscientos países o territorios. Es un producto de The Coca-Cola Company. En un principio, cuando la inventó el farmacéutico John Pemberton, fue concebida como una bebida medicinal patentada.",
      imageLocation: "assets/exhibitors/lda_technologies.png",
      favorite: false,
    ),
    ExhibitorsModel(
      name:"NDA International",
      booth: "209",
      summary: "Batteries, Home Hardware, Face Masks, Closeouts",
      description: "Coca-Cola, conocida comúnmente como Coca en muchos países hispanohablantes (en inglés Coke) es una bebida gaseosa y refrescante, vendida a nivel mundial, en tiendas, restaurantes y máquinas expendedoras en más de doscientos países o territorios. Es un producto de The Coca-Cola Company. En un principio, cuando la inventó el farmacéutico John Pemberton, fue concebida como una bebida medicinal patentada.",
      imageLocation: "assets/exhibitors/lda_technologies.png",
      favorite: false,
    ),
    ExhibitorsModel(
      name:"LDA International",
      booth: "209",
      summary: "Batteries, Home Hardware, Face Masks, Closeouts",
      description: "Coca-Cola, conocida comúnmente como Coca en muchos países hispanohablantes (en inglés Coke) es una bebida gaseosa y refrescante, vendida a nivel mundial, en tiendas, restaurantes y máquinas expendedoras en más de doscientos países o territorios. Es un producto de The Coca-Cola Company. En un principio, cuando la inventó el farmacéutico John Pemberton, fue concebida como una bebida medicinal patentada.",
      imageLocation: "assets/exhibitors/lda_technologies.png",
      favorite: false,
    ),
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [IconButton(icon: Icon(Icons.clear), onPressed: (){},)];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: (){
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List suggestionList = query.isEmpty
    ? suggestions
    : exhibitors.where((p) => p.name.toLowerCase().contains(query)).toList();

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, item){
        return ListTile(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(
              builder: (BuildContext context) => ExhibitorDetailPage(suggestionList[item])
            ));
          },
          leading: Icon(Icons.pages),
          title: Text(suggestionList[item].name),
        );
      },
    );
  }
  
}