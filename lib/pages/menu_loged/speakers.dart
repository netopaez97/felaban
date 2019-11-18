import 'package:felaban/components/backgroundSuperiorPequeno.dart';
import 'package:felaban/components/barraSuperiorBACK.dart';
import 'package:felaban/pages/menu_loged/speakers_detalle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SpeakersView extends StatefulWidget {

  static const routeName = "/speakers";

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: barraSuperior(context),
      body: ListView(
        children: <Widget>[
          BackgroundSuperiorPequenoWidget(),
          _speakersTitulo(),
          _searchNavigation(),
          Divider(color: _colorDivider,),
          Column(
            children: <Widget>[
              ListTile(
                leading: Image.asset("assets/speakers/liz_wiseman.png"),
                title: Text("Liz Wiseman", style: TextStyle(fontSize: 20),),
                subtitle: Text("Executive Strategy and Leadership Consultant", style: TextStyle(fontSize: 15, color: Color(0xffEF4135))),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(
                    builder: (BuildContext context) => DetalleSpeakersView("assets/speakers/liz_wiseman.png")
                  ));
                },
              ),
              Divider(color: _colorDivider,),
              ListTile(
                leading: Image.asset("assets/speakers/matt_higgins.png"),
                title: Text("Matt Higgins", style: TextStyle(fontSize: 20),),
                subtitle: Text("Co-founder and CEO RSE Ventures, Shark Tank Panelist", style: TextStyle(fontSize: 15, color: Color(0xffEF4135))),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(
                    builder: (BuildContext context) => DetalleSpeakersView("assets/speakers/matt_higgins.png")
                  ));
                },
              ),
              Divider(color: _colorDivider,),
              ListTile(
                leading: Image.asset("assets/speakers/liz_wiseman.png"),
                title: Text("Liz Wiseman", style: TextStyle(fontSize: 20),),
                subtitle: Text("Executive Strategy and Leadership Consultant", style: TextStyle(fontSize: 15, color: Color(0xffEF4135))),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(
                    builder: (BuildContext context) => DetalleSpeakersView("assets/speakers/liz_wiseman.png")
                  ));
                },
              ),
              Divider(color: _colorDivider,),
              ListTile(
                leading: Image.asset("assets/speakers/matt_higgins.png"),
                title: Text("Matt Higgins", style: TextStyle(fontSize: 20),),
                subtitle: Text("Co-founder and CEO RSE Ventures, Shark Tank Panelist", style: TextStyle(fontSize: 15, color: Color(0xffEF4135))),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(
                    builder: (BuildContext context) => DetalleSpeakersView("assets/speakers/matt_higgins.png")
                  ));
                },
              ),
              Divider(color: _colorDivider,),
              ListTile(
                leading: Image.asset("assets/speakers/liz_wiseman.png"),
                title: Text("Liz Wiseman", style: TextStyle(fontSize: 20),),
                subtitle: Text("Executive Strategy and Leadership Consultant", style: TextStyle(fontSize: 15, color: Color(0xffEF4135))),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(
                    builder: (BuildContext context) => DetalleSpeakersView("assets/speakers/liz_wiseman.png")
                  ));
                },
              ),
              Divider(color: _colorDivider,),
              ListTile(
                leading: Image.asset("assets/speakers/matt_higgins.png"),
                title: Text("Matt Higgins", style: TextStyle(fontSize: 20),),
                subtitle: Text("Co-founder and CEO RSE Ventures, Shark Tank Panelist", style: TextStyle(fontSize: 15, color: Color(0xffEF4135))),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(
                    builder: (BuildContext context) => DetalleSpeakersView("assets/speakers/matt_higgins.png")
                  ));
                },
              ),
              Divider(color: _colorDivider,),
              ListTile(
                leading: Image.asset("assets/speakers/liz_wiseman.png"),
                title: Text("Liz Wiseman", style: TextStyle(fontSize: 20),),
                subtitle: Text("Executive Strategy and Leadership Consultant", style: TextStyle(fontSize: 15, color: Color(0xffEF4135))),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(
                    builder: (BuildContext context) => DetalleSpeakersView("assets/speakers/liz_wiseman.png")
                  ));
                },
              ),
              Divider(color: _colorDivider,),
              SizedBox(height: 100,)
            ],
          )
        ],
      ),
    );
  }
}