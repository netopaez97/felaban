import 'package:felaban/components/backgroundSuperiorPequeno.dart';
import 'package:felaban/components/barraSuperiorBACK.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SpeakersView extends StatefulWidget {

  static const routeName = "/speakers";

  @override
  _SpeakersViewState createState() => _SpeakersViewState();
}

class _SpeakersViewState extends State<SpeakersView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: barraSuperior(context),
      body: ListView(
        children: <Widget>[
          BackgroundSuperiorPequenoWidget(),
          Container(
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
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 6, vertical: 18),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Color(0xffE9E6E6),
            ),
            child: TextFormField(
              decoration: InputDecoration(
                border: InputBorder.none,
                labelText: "search...",
                labelStyle: TextStyle(fontSize: 20),
                icon: Icon(Icons.search),
              ),
            ),
          ),
        ],
      ),
    );
  }
}