import 'package:felaban/components/barraSuperiorBACK.dart';
import 'package:felaban/routes/Routes.dart';
import 'package:flutter/material.dart';

class ListaAttendeesView extends StatefulWidget {

  static const routeName = 'attendees';

  @override
  _ListaAttendeesViewState createState() => _ListaAttendeesViewState();
}

class _ListaAttendeesViewState extends State<ListaAttendeesView> {


  ///IMPORTANTE: la funcionalidad de esta pagina no es correcta.
  ///Es necesario definir la estructura de datos teniendo en cuenta cómo se van a recibir
  ///los nombres de las empresas de los asistentes para poder definir barras como
  ///las que actualmente están (Kubilabs, oracle y felaban).
  ///
  ///Yo creo que la única forma de hacer es hacer un condicional para cada letra del abedecario
  ///al abrir la vista en un initState, creando un lista con los nombres de las empresas ordenadas
  ///y después dibujar los datos en el canva filtrando cada persona por el nombre de la empresa.




  double _offsetContainer;
  var _text;
  var _oldtext;
  var _heightscroller;
  var _itemsizeheight = 197.0; //NOTE: size items
  var _sizeheightcontainer;
  var posSelected = 0;
  var diff = 0.0;
  var height = 0.0;
  var txtSliderPos = 0.0;
  ScrollController _controller;
  String message = "";
  double _margenHorizontalGeneral = 25;

  List _listAttendees = [
    {
      "name":"Liz Wiseman",
      "position":"CTO Cocacola",
      "imageLocation":"assets/speakers/liz_wiseman.png",
      "company":"Oracle"
    },
    {
      "name":"Zal Wiseman",
      "position":"CTA Cocacola",
      "imageLocation":"assets/speakers/liz_wiseman.png",
      "company":"Amazon"
    },
    {
      "name":"Hiz Wiseman",
      "position":"CTB Cocacola",
      "imageLocation":"assets/speakers/liz_wiseman.png",
      "company":"Kubilabs"
    },
    {
      "name":"Bal Wiseman",
      "position":"CTC Cocacola",
      "imageLocation":"assets/speakers/liz_wiseman.png",
      "company":"Felaban"
    },
    {
      "name":"Liz Wiseman",
      "position":"CTD Cocacola",
      "imageLocation":"assets/speakers/liz_wiseman.png",
      "company":"Acciona"
    },
    {
      "name":"Liz Wiseman",
      "position":"CTF Cocacola",
      "imageLocation":"assets/speakers/liz_wiseman.png",
      "company":"Bucaramanga"
    },
    {
      "name":"Liz Wiseman",
      "position":"CTG Cocacola",
      "imageLocation":"assets/speakers/liz_wiseman.png",
      "company":"Zylos"
    },
    {
      "name":"Liz Wiseman",
      "position":"CTH Cocacola",
      "imageLocation":"assets/speakers/liz_wiseman.png",
      "company":"Cerrejon"
    },
    {
      "name":"Liz Wiseman",
      "position":"CTH Cocacola",
      "imageLocation":"assets/speakers/liz_wiseman.png",
      "company":"Cerrejon"
    },
    {
      "name":"Liz Wiseman",
      "position":"CTH Cocacola",
      "imageLocation":"assets/speakers/liz_wiseman.png",
      "company":"Cerrejon"
    },
    {
      "name":"Liz Wiseman",
      "position":"CTI Cocacola",
      "imageLocation":"assets/speakers/liz_wiseman.png",
      "company":"Mystico"
    },
    {
      "name":"Liz Wiseman",
      "position":"CTJ Cocacola",
      "imageLocation":"assets/speakers/liz_wiseman.png",
      "company":"Lupe"
    },
  ];

  List _alphabet = [
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
    'M',
    'N',
    'O',
    'P',
    'Q',
    'R',
    'S',
    'T',
    'U',
    'V',
    'W',
    'X',
    'Y',
    'Z'
  ];

  void _onVerticalDragUpdate(DragUpdateDetails details) {
    setState(() {
      if ((_offsetContainer + details.delta.dy) >= 0 &&
          (_offsetContainer + details.delta.dy) <=
              (_sizeheightcontainer - _heightscroller)) {
        _offsetContainer += details.delta.dy;
        posSelected =
            ((_offsetContainer / _heightscroller) % _alphabet.length).round();
        _text = _alphabet[posSelected];
        if (_text != _oldtext) {
          for (var i = 0; i < _listAttendees.length; i++) {
            if (_text
                    .toString()
                    .compareTo(_listAttendees[i]["company"].toString().toUpperCase()[0]) ==
                0) {
                  print("i: $i");
                  print("itemSize: $_itemsizeheight");
                  print(i*_itemsizeheight);
              _controller.jumpTo(i * _itemsizeheight);
              break;
            }
          }
          _oldtext = _text;
        }
      }
    });
  }

  Widget _cuerpoDeLaPagina(){
    return ListView(
      children: <Widget>[
        _barraAttendees(),
        _searchNavigation(),
        _infoFelaban(),
      ],
    );
  }

  Widget _barraAttendees(){
    return Container(
      color: Color(0xff489ED2),
      padding: EdgeInsets.symmetric(horizontal: _margenHorizontalGeneral-10),
      height: 53,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text("Attendees", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),),
          Image.asset("assets/attendees/group.png"),
        ],
      ),
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
        margin: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
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

  Widget _infoFelaban(){

    return Container(
      height: MediaQuery.of(context).size.height*0.7,
      child: ListView.builder(
        itemCount: _listAttendees.length,
        controller: _controller,
        itemBuilder: (context, item){
          return Column(
              children: <Widget>[
                _barraEmpresa(_listAttendees[item]["company"].toUpperCase()),
                Column(
                    children: _listAttendees.map(
                      (attendees) {
                        if(_listAttendees[item]["company"] == attendees["company"]){
                          return ListTile(
                            leading: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle
                              ),
                              child: Image.asset("assets/speakers/liz_wiseman.png"),
                            ),
                            title: Text(attendees["name"], style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                            subtitle: Text(attendees["position"], style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Color(0xff8C8C8C))),
                            onTap: (){
                              Navigator.pushNamed(context, Routes.perfilUsuarioPublico);
                            },
                          );
                        }
                        else {
                          return Container();
                        }
                      }
                    ).toList(),
                  ),
              ],
          );
        },
      ),
    );
  }

  Widget _barraEmpresa(String empresa){
    return Container(
      alignment: Alignment.centerLeft,
      color: Color(0xffF0F0F0),
      padding: EdgeInsets.symmetric(horizontal: _margenHorizontalGeneral),
      height: 53,
      child: Text(empresa, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xff489ED2)),),
    );
  }

  Widget _barraVerticalDerecha(){
    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onVerticalDragUpdate: _onVerticalDragUpdate,
        onVerticalDragStart: _onVerticalDragStart,
        child: Container(
          width: 40,
          //height: 20.0 * 26,
          color: Color(0xff8C8C8C).withOpacity(.3),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: []..addAll(
                new List.generate(_alphabet.length,
                    (index) => _getAlphabetItem(index)),
              ),
          ),
        ),
      ),
    );
  }

  void _onVerticalDragStart(DragStartDetails details) {
//    var heightAfterToolbar = height - diff;
//    print("height1 $heightAfterToolbar");
//    var remavingHeight = heightAfterToolbar - (20.0 * 26);
//    print("height2 $remavingHeight");
//
//    var reducedheight = remavingHeight / 2;
//    print("height3 $reducedheight");
    _offsetContainer = details.globalPosition.dy - diff;
  }

  _getAlphabetItem(int index) {
    return new Expanded(
      child: new Container(
        width: 40,
        height: 20,
        alignment: Alignment.center,
        child: new Text(
          _alphabet[index],
          style: (index == posSelected)
              ? new TextStyle(fontSize: 16, fontWeight: FontWeight.w700)
              : new TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }

  //scroll detector for reached top or bottom
  _scrollListener() {
    if ((_controller.offset) >= (_controller.position.maxScrollExtent)) {
      print("reached bottom");
    }
    if (_controller.offset <= _controller.position.minScrollExtent &&
        !_controller.position.outOfRange) {
      print("reached top");
    }
  }

  @override
  void initState() {

    _offsetContainer = 0.0;
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
    //sort the item list
    _listAttendees.sort((a, b) {
      return a["company"].toString().compareTo(b["company"].toString());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: barraSuperior(context),
      body: _cuerpoDeLaPagina(),
    );
  }
}



class SearchNavigation extends SearchDelegate{

  List suggestions = [
    
  ];

  List attendees = [
      "Zal Wiseman",
      "Liz Wiseman",
      "Hiz Wiseman",
      "Bal Wiseman",
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
    final suggestionList = query.isEmpty
    ? suggestions
    : attendees.where((p) => p.toLowerCase().contains(query)).toList();

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, item){
        return ListTile(
          onTap: (){
            Navigator.pushNamed(context, Routes.perfilUsuarioPublico);
          },
          leading: Icon(Icons.people_outline),
          title: Text("${suggestionList[item][0].toUpperCase()}${suggestionList[item].substring(1)}"),
        );
      },
    );
  }
  
}