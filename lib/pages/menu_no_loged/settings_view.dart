import 'package:felaban/components/barraSuperiorBACK.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsView extends StatefulWidget {
  static const routeName = '/settings';

  @override
  _SettingsViewState createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  List<String> _languages = ['English', 'Spanish'];


  String _selectedLocation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selectedLocation = _languages[0];
  }

  @override
  Widget build(BuildContext context) {

    final _sizeScreen = MediaQuery.of(context).size;
    final Divider _divider = Divider(color: Color(0xffC4C4C4), height: 1,);
    final Color _colorDropdown = Color(0xffC4C4C4);
    final Color _colorLetras = Color(0xff929292);

    return Scaffold(
      appBar: barraSuperior(context),
      body: ListView(
        children: <Widget>[
          Container(
            height:_sizeScreen.height*0.15,
            child: Stack(
              children: <Widget>[
                Container(
                  color: Colors.black,
                  height: _sizeScreen.height*0.15,
                  width: double.infinity,
                  child: Image.asset(
                    'assets/images/background_short.png',
                    fit: BoxFit.fitHeight,
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    "APP SETUP",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(20),
                  child: Icon(Icons.settings, color:  Color(0xffA1A1A1), size: 43,),
                  alignment: Alignment.topRight,
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              left: 20,
              top: 20.0,
              bottom: 20.0,
            ),
            color: Color(0xFFE5E5E5),
            height: 60.0,
            child: Text(
              "Please setup your APP",
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: 17,
                  fontFamily: 'Roboto-Medium',
                  letterSpacing: -0.5),
            ),
          ),
          Container(
            height: _sizeScreen.height*0.1,
            margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    "App Language",
                    style: TextStyle(
                      fontFamily: 'Roboto-Medium',
                      fontSize: 18,
                      color: _colorLetras,
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width*0.4,
                  decoration: BoxDecoration(
                    border: Border.all(color: _colorDropdown,),
                    borderRadius: BorderRadius.circular(5)
                  ),
                  child: Container(
                    height: 40,
                    alignment: Alignment.centerRight,
                    child: DropdownButton(
                      underline: Container(),
                      icon: Container(
                        padding: EdgeInsets.zero,
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          border: Border(
                            left: BorderSide(color: _colorDropdown),
                          ),
                        ),
                        child: Icon(Icons.arrow_drop_down, color: _colorDropdown, size: 40,),
                      ),
                      value: _selectedLocation,
                      onChanged: (String newValue) {
                        print(_sizeScreen.height*0.1);
                        setState(() {
                          _selectedLocation = newValue;
                        });
                      },
                      items: _languages.map((String location) {
                        return new DropdownMenuItem<String>(
                          value: location,
                          child: new Container(
                            padding: EdgeInsets.only(right: 10),
                            child: Text(location, style: TextStyle(fontSize: 17,color: Color(0xff929292),),),
                          )
                        );
                      }).toList(),
                    ),
                  )
                )
              ]
            ),
          ),
          _divider,
          Container(
            height: _sizeScreen.height*0.1,
            margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    "App Notifications",
                    style: TextStyle(
                      fontFamily: 'Roboto-Medium',
                      fontSize: 18,
                      color: _colorLetras,
                    ),
                  ),
                ),
                Container(
                  child: CupertinoSwitch(
                    activeColor: Colors.green,
                    value: true,
                    onChanged: (bool value) {
                      setState(() {});
                    },
                  ),
                )
              ],
            ),
          ),
          _divider,
          Container(
            height: _sizeScreen.height*0.1,
            margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    "Microphone",
                    style: TextStyle(
                      fontFamily: 'Roboto-Medium',
                      fontSize: 18,
                      color: _colorLetras,
                    ),
                  ),
                ),
                Container(
                  child: CupertinoSwitch(
                    activeColor: Colors.green,
                    value: false,
                    onChanged: (bool value) {
                      setState(() {});
                    },
                  ),
                )
              ],
            ),
          ),
          _divider,
          Container(
            height: _sizeScreen.height*0.1,
            margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    "Camera",
                    style: TextStyle(
                      fontFamily: 'Roboto-Medium',
                      fontSize: 18,
                      color: _colorLetras,
                    ),
                  ),
                ),
                Container(
                  child: CupertinoSwitch(
                    activeColor: Colors.green,
                    value: false,
                    onChanged: (bool value) {
                      setState(() {});
                    },
                  ),
                )
              ],
            ),
          ),
          _divider,
          Container(
            height: _sizeScreen.height*0.1,
            margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    "Calendar",
                    style: TextStyle(
                      fontFamily: 'Roboto-Medium',
                      fontSize: 18,
                      color: Color(0xFF929292),
                    ),
                  ),
                ),
                Container(
                  child: CupertinoSwitch(
                    activeColor: Colors.green,
                    value: true,
                    onChanged: (bool value) {
                      setState(() {});
                    },
                  ),
                )
              ],
            ),
          ),
          _divider,
          Container(
            height: _sizeScreen.height*0.1,
            margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    "Location",
                    style: TextStyle(
                      fontFamily: 'Roboto-Medium',
                      fontSize: 18,
                      color: Color(0xFF929292),
                    ),
                  ),
                ),
                Container(
                  child: CupertinoSwitch(
                    activeColor: Colors.green,
                    value: true,
                    onChanged: (bool value) {
                      setState(() {});
                    },
                  ),
                )
              ],
            ),
          ),
          _divider
        ],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(top: 10, left: 10, right: 10),
        height: _sizeScreen.height*0.1,
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded( child: Text("FELABAN APP", style: TextStyle(color: Color(0xff8C8C8C), fontSize: 17),),),
                Text("Powered by:", style: TextStyle(color: Color(0xff8C8C8C), fontSize: 17),)
              ],
            ),
            Row(
              children: <Widget>[
                Expanded( child: Text("Copyright 2019 V1.0", style: TextStyle(color: Color(0xff8C8C8C), fontSize: 17),),),
                GestureDetector(
                  child: Text("www.kubilabs.com", style: TextStyle(color: Color(0xff8C8C8C), fontSize: 17, fontWeight: FontWeight.bold),),
                  onTap: (){
                    const url = 'https://www.kubilabs.com/';
                    try{
                      if (canLaunch(url) != null) {
                        launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    }
                    catch (e){
                      
                    }
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
