import 'package:felaban/components/backgroundSuperior.dart';
import 'package:felaban/components/barraSuperiorBACK.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileUserView extends StatefulWidget {

  static const String routeName = "/perfilUsuario";

  @override
  _ProfileUserViewState createState() => _ProfileUserViewState();
}

class _ProfileUserViewState extends State<ProfileUserView> {

  bool profileState = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: barraSuperior(context),
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    color: Colors.black,
                    height: MediaQuery.of(context).size.height*0.1,
                    width: double.infinity,
                    child: Image.asset("assets/background.png", fit: BoxFit.cover,)
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height*0.2,
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      decoration: BoxDecoration(
                        color: Color(0xff489ED2)
                      ),
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: (){
                  print("Has oprimido la imagen del señor");
                },
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Container(
                    width: MediaQuery.of(context).size.height*0.2,
                    height: MediaQuery.of(context).size.height*0.2,
                    decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                        fit: BoxFit.fill,
                        image: new AssetImage(
                          "assets/images/profile_face.png",
                        )
                      ),
                      border: Border.all(color: Colors.white)
                    ),
                    child: Icon(Icons.add, color: Colors.white,),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                height: MediaQuery.of(context).size.height*0.3,
                child: Container(
                  alignment: Alignment.bottomCenter,
                  height: MediaQuery.of(context).size.height*0.1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(bottom: 5),
                        child: Text("Giorgio Trettenero Castro", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Colors.white)),
                      ),
                      Container(
                        padding: EdgeInsets.only(bottom: 5),
                        child: Text("Secretario General FELABAN", style: TextStyle(fontSize: 16, color: Colors.white),),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20,),
          Container(
            alignment: Alignment.center,
            child: Column(
              children: <Widget>[
                Text("Privacy Settings", style: TextStyle(color: Color(0xff8C8C8C), fontSize: 20),),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: MediaQuery.of(context).size.width*0.05),
                  child: Text("Private profiles require a contact share approval before they can be seen. Public profiles are visible to anyone on the attendee list.", style: TextStyle(), textAlign: TextAlign.center,),
                )
              ],
            ),
          ),
          SizedBox(height: 16,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Private     ", style: TextStyle(fontSize: 16),),
              CupertinoSwitch(
                value: profileState,
                onChanged: (val){
                  setState(() {
                    profileState = !profileState; 
                  });
                },
                activeColor: Colors.green,
              ),
              Text("     Public", style: TextStyle(fontSize: 16),)
            ],
          ),
          SizedBox(height: 33,),
          Container(
            height: 60,
            color: Color(0xFFE5E5E5),
            alignment: Alignment.center,
            child: Text("Personal Information", style: TextStyle(color: Color(0xff8C8C8C), fontSize: 20),),
          ),
          Divider(height: 3, color: Color(0xffC4C4C4),),
          SizedBox(height: 41,),
          Container(
            padding: EdgeInsets.all(18),
            height: MediaQuery.of(context).size.height*0.6,
            child: ListView(
              children: <Widget>[
                Row(children: <Widget>[Text("First Name", style: TextStyle(fontSize: 16),), Text("*", style: TextStyle(color: Colors.red),)],)
              ],
            ),
          )
        ],
      ),
    );
  }
}