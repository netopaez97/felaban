import 'package:felaban/components/backgroundSuperiorPequeno.dart';
import 'package:felaban/components/barraSuperiorBACK.dart';
import 'package:felaban/models/speakersModel.dart';
import 'package:felaban/pages/menu_loged/agenda/detalle_agenda/detalle_agenda.dart';
import 'package:felaban/pages/menu_loged/speakers/speakers_detalle.dart';
import 'package:felaban/providers/speakersProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SpeakersView extends StatefulWidget {

  final List<SpeakersModel> listaSpeakers;
  SpeakersView(this.listaSpeakers, {Key key}) : super(key:key);

  @override
  _SpeakersViewState createState() => _SpeakersViewState();
}

class _SpeakersViewState extends State<SpeakersView> {

  static final Color _colorDivider = Color(0xffC4C4C4);

  Widget _speakersTitulo(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      color: Color(0xff8C8C8C),
      height: 53,
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text("Speakers", style: TextStyle( fontSize: 17, color: Colors.white, fontWeight: FontWeight.bold),),
          Container(
            width: 46,
            child: Image.asset("assets/drawerImages/speaker.png", color: Colors.white,),
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

  @override
  Widget build(BuildContext context) {
    
    final speakersInfo = Provider.of<SpeakersProvider>(context);

    return Scaffold(
      appBar: barraSuperior(context),
      body: ListView(
        children: <Widget>[
          BackgroundSuperiorPequenoWidget(),
          _speakersTitulo(),
          _searchNavigation(),
          Divider(color: _colorDivider,),
          Column(
            children: widget.listaSpeakers.map( (s) => Column(
              children: <Widget>[
                ListTile(
                  leading: Image.asset(s.imageLocation),
                  title: Text(s.name, style: TextStyle(fontSize: 20),),
                  subtitle: Text(s.cargo, style: TextStyle(fontSize: 15, color: Color(0xffEF4135))),
                  onTap: (){
                    
                    speakersInfo.speakerActual = s;

                    Navigator.push(context, MaterialPageRoute(
                      builder: (BuildContext context) => DetalleSpeakersView()
                    ));
                  },
                ),
                Divider(color: _colorDivider,)
              ],
            ),).toList()
          )
        ],
      ),
    );
  }
}



class SearchNavigation extends SearchDelegate{

  List<SpeakersModel> suggestions = [
    
  ];

  List<SpeakersModel> speakers = [
    SpeakersModel(
      imageLocation:"assets/speakers/liz_wiseman.png",
      name: "Liz Wiseman",
      cargo:"Executive Strategy and Leadership Consultant"
    ),
    SpeakersModel(
      imageLocation:"assets/speakers/matt_higgins.png",
      name: "Matt Higgins",
      cargo:"Co-founder and CEO RSE Ventures, Shark Tank Panelist"
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

    final speakersInfo = Provider.of<SpeakersProvider>(context);

    final suggestionList = query.isEmpty
    ? suggestions
    : speakers.where((s) => s.name.toLowerCase().contains(query)).toList();

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, item){
        return ListTile(
          onTap: (){
            speakersInfo.speakerActual = suggestionList[item];
            Navigator.push(context, MaterialPageRoute(
              builder: (BuildContext context) => DetalleSpeakersView()
            ));
          },
          leading: Icon(Icons.people),
          title: Text(suggestionList[item].name),
        );
      },
    );
  }
}