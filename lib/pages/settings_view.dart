import 'package:felaban/components/app_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SettingsView extends StatefulWidget {
  static const routeName = '/settings';

  @override
  _SettingsViewState createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  List<String> _languages = ['English', 'Spanish'];

  String _selectedLocation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        backgroundColor: Color(0xff8C8C8C),
        actionsForegroundColor: Colors.white,
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Row(
            children: <Widget>[
              Icon(CupertinoIcons.back,),
              Text("Back", style: TextStyle(fontSize: 16, color: Colors.white),)
            ],
          ),
        ),
        border: Border.all(
          style: BorderStyle.none
        ),
        padding: EdgeInsetsDirectional.zero,
      ),
      drawer: AppDrawer(),
      body: Container(
        margin: EdgeInsets.all(0),
        child: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: Container(
                height: MediaQuery.of(context).size.height*0.15,
                child: Stack(
                children: <Widget>[
                  Container(
                    color: Colors.black,
                    height: MediaQuery.of(context).size.height*0.15,
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
              )
            ),
            SliverToBoxAdapter(
              child: Container(
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
            ),
            SliverToBoxAdapter(
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(top: 20, bottom: 20),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom:
                            BorderSide(width: 1.0, color: Color(0xFFC4C4C4)),
                      ),
                    ),
                    child: Container(
                      margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
                      child: Row(children: <Widget>[
                        Expanded(
                          child: Text(
                            "App Language",
                            style: TextStyle(
                              fontFamily: 'Roboto-Medium',
                              fontSize: 16,
                              color: Color(0xFF929292),
                            ),
                          ),
                        ),
                        Container(
                          width: 150,
                            child: DropdownButton(
                          value: _selectedLocation,
                          onChanged: (String newValue) {
                            setState(() {
                              _selectedLocation = newValue;
                            });
                          },
                          items: _languages.map((String location) {
                            return new DropdownMenuItem<String>(
                              child: new Text(location),
                            );
                          }).toList(),
                        ))
                      ]),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 20, bottom: 20),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom:
                            BorderSide(width: 1.0, color: Color(0xFFC4C4C4)),
                      ),
                    ),
                    child: Container(
                      margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              "App Notifications",
                              style: TextStyle(
                                fontFamily: 'Roboto-Medium',
                                fontSize: 16,
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
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 20, bottom: 15),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom:
                            BorderSide(width: 1.0, color: Color(0xFFC4C4C4)),
                      ),
                    ),
                    child: Container(
                      margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              "Microphone",
                              style: TextStyle(
                                fontFamily: 'Roboto-Medium',
                                fontSize: 16,
                                color: Color(0xFF929292),
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
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 20, bottom: 15),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom:
                            BorderSide(width: 1.0, color: Color(0xFFC4C4C4)),
                      ),
                    ),
                    child: Container(
                      margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              "Camera",
                              style: TextStyle(
                                fontFamily: 'Roboto-Medium',
                                fontSize: 16,
                                color: Color(0xFF929292),
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
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 20, bottom: 15),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom:
                            BorderSide(width: 1.0, color: Color(0xFFC4C4C4)),
                      ),
                    ),
                    child: Container(
                      margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              "Calendar",
                              style: TextStyle(
                                fontFamily: 'Roboto-Medium',
                                fontSize: 16,
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
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 20, bottom: 15),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom:
                            BorderSide(width: 1.0, color: Color(0xFFC4C4C4)),
                      ),
                    ),
                    child: Container(
                      margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              "Location",
                              style: TextStyle(
                                fontFamily: 'Roboto-Medium',
                                fontSize: 16,
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
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
