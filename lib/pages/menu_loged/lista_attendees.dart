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
  var _itemsizeheight = 65.0; //NOTE: size items
  var _sizeheightcontainer;
  var posSelected = 0;
  var diff = 0.0;
  var height = 0.0;
  var txtSliderPos = 0.0;
  ScrollController _controller;
  String message = "";
  double _margenHorizontalGeneral = 25;

  List exampleList = [
    'Felaban',
    'Kubilabs',
    'Oracle',
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

  @override
  void initState() {

    _offsetContainer = 0.0;
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
    //sort the item list
    exampleList.sort((a, b) {
      return a.toString().compareTo(b.toString());
    });
    super.initState();
  }

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
          for (var i = 0; i < exampleList.length; i++) {
            if (_text
                    .toString()
                    .compareTo(exampleList[i].toString().toUpperCase()[0]) ==
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

  Widget _barraFelaban(){
    return Container(
      alignment: Alignment.centerLeft,
      color: Color(0xffF0F0F0),
      padding: EdgeInsets.symmetric(horizontal: _margenHorizontalGeneral),
      height: 53,
      child: Text("FELABAN", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xff489ED2)),),
    );
  }

  Widget _infoFelaban(){

    return Container(
      height: MediaQuery.of(context).size.height*0.7,
      child: new LayoutBuilder(
        builder: (context, contrainsts) {
          diff = height - contrainsts.biggest.height;
          _heightscroller = (contrainsts.biggest.height) / _alphabet.length;
          _sizeheightcontainer = (contrainsts.biggest.height); //NO
          return new Stack(
            children: <Widget>[
              ListView(
                shrinkWrap: true,
                controller: _controller,
                itemExtent: _itemsizeheight,
                children: <Widget>[
                  _barraFelaban(),
                  ListTile(
                    leading: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle
                      ),
                      child: Image.asset("assets/speakers/liz_wiseman.png"),
                    ),
                    title: Text("Bal Wiseman", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                    subtitle: Text("CTO Cocacola", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Color(0xff8C8C8C))),
                    onTap: (){
                      Navigator.pushNamed(context, Routes.perfilUsuarioPublico);
                    },
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    color: Color(0xffF0F0F0),
                    padding: EdgeInsets.symmetric(horizontal: _margenHorizontalGeneral),
                    height: 53,
                    child: Text("KUBILABS", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xff489ED2)),),
                  ),
                  ListTile(
                    leading: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle
                      ),
                      child: Image.asset("assets/speakers/liz_wiseman.png"),
                    ),
                    title: Text("Hiz Wiseman", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                    subtitle: Text("CTO Cocacola", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Color(0xff8C8C8C))),
                    onTap: (){
                      Navigator.pushNamed(context, Routes.perfilUsuarioPublico);
                    },
                  ),
                  ListTile(
                    leading: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle
                      ),
                      child: Image.asset("assets/speakers/liz_wiseman.png"),
                    ),
                    title: Text("Zal Wiseman", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                    subtitle: Text("CTO Cocacola", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Color(0xff8C8C8C))),
                    onTap: (){
                      Navigator.pushNamed(context, Routes.perfilUsuarioPublico);
                    },
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    color: Color(0xffF0F0F0),
                    padding: EdgeInsets.symmetric(horizontal: _margenHorizontalGeneral),
                    height: 53,
                    child: Text("ORACLE", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xff489ED2)),),
                  ),
                  ListTile(
                    leading: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle
                      ),
                      child: Image.asset("assets/speakers/liz_wiseman.png"),
                    ),
                    title: Text("Liz Wiseman", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                    subtitle: Text("CTO Cocacola", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Color(0xff8C8C8C))),
                    onTap: (){
                      Navigator.pushNamed(context, Routes.perfilUsuarioPublico);
                    },
                  ),
                  ListTile(
                    leading: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle
                      ),
                      child: Image.asset("assets/speakers/liz_wiseman.png"),
                    ),
                    title: Text("Liz Wiseman", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                    subtitle: Text("CTO Cocacola", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Color(0xff8C8C8C))),
                    onTap: (){
                      Navigator.pushNamed(context, Routes.perfilUsuarioPublico);
                    },
                  ),
                  ListTile(
                    leading: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle
                      ),
                      child: Image.asset("assets/speakers/liz_wiseman.png"),
                    ),
                    title: Text("Liz Wiseman", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                    subtitle: Text("CTO Cocacola", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Color(0xff8C8C8C))),
                    onTap: (){
                      Navigator.pushNamed(context, Routes.perfilUsuarioPublico);
                    },
                  ),
                  ListTile(
                    leading: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle
                      ),
                      child: Image.asset("assets/speakers/liz_wiseman.png"),
                    ),
                    title: Text("Liz Wiseman", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                    subtitle: Text("CTO Cocacola", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Color(0xff8C8C8C))),
                    onTap: (){
                      Navigator.pushNamed(context, Routes.perfilUsuarioPublico);
                    },
                  ),
                  ListTile(
                    leading: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle
                      ),
                      child: Image.asset("assets/speakers/liz_wiseman.png"),
                    ),
                    title: Text("Liz Wiseman", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                    subtitle: Text("CTO Cocacola", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Color(0xff8C8C8C))),
                    onTap: (){
                      Navigator.pushNamed(context, Routes.perfilUsuarioPublico);
                    },
                  ),
                ],
              ),
              _barraVerticalDerecha(),
              
            ],
          );
        }
      ),
    );
  }

  Widget _barraVerticalDerecha(){
    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onVerticalDragUpdate: _onVerticalDragUpdate,
        onVerticalDragStart: _onVerticalDragStart,
        child: Container(
          width: 22,
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

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: barraSuperior(context),
      body: _cuerpoDeLaPagina(),
    );
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
}



class SearchNavigation extends SearchDelegate{

  List suggestions = [
    "Liz Wiseman"
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
    return null;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
    ? suggestions
    : attendees.where((p) => p.startsWith(query)).toList();

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, item){
        return ListTile(
          onTap: (){
            Navigator.pushNamed(context, Routes.perfilUsuarioPublico);
          },
          leading: Icon(Icons.people_outline),
          title: Text(suggestionList[item]),
        );
      },
    );
  }
  
}