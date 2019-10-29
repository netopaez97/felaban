import 'package:felaban/routes/Routes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:ui' as ui;

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.1,
                    child: Container(
                      padding: EdgeInsets.only(left: 15),
                      alignment: Alignment.centerLeft,
                      color: Color(0xFF004A80),
                      child: Text('Welcome', style: TextStyle(fontSize: 18, fontFamily: 'Roboto-Medium', color: Colors.white),
                    ),
                  )
                ),
                ListTile(
                  title: Text(
                    'Home',
                    style: TextStyle(
                      fontSize: 16,
                        fontFamily: 'Roboto-Medium'
                    ),
                  ),
                  leading: Container(
                    width: 46,
                    child: Icon(
                      FontAwesomeIcons.home,
                      color: Color(0xffA1A1A1),
                    ),
                  ),
                  onTap: () {
                    Navigator.pushReplacementNamed(context, Routes.home);
                  },
                ),
                Divider(),
                ListTile(
                  title: Text(
                    'About FELABAN',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Roboto-medium',
                    ),
                  ),
                  leading: Container(
                    width: 46,
                    child: Image.asset("assets/drawerImages/about_felaban.png",),
                  ),
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      Routes.about_felaban,
                    );
                  },
                ),
                Divider(),
                ListTile(
                  title: Text(
                    'About IFC',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Roboto-Medium',
                    ),
                  ),
                  leading: Container(
                    width: 46,
                    child: Image.asset("assets/drawerImages/about_ifc.png"),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, Routes.about_ifc);
                  },
                ),
                Divider(),
                ListTile(
                  title: Text(
                    'APP Setup',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontFamily: 'Roboto-Medium',
                    ),
                  ),
                  leading: Container(
                    width: 46,
                    child: Icon(
                      Icons.settings,
                      color: Color(0xffA1A1A1),
                      size: 28,
                    ),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, Routes.settings);
                  },
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(15),
            width: MediaQuery.of(context).size.width,
            color: Color(0xFF818181),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Follow FELABAN",
                  style: TextStyle(
                    fontFamily: 'Roboto-Light',
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10,),
                Image.asset("assets/drawerImages/social_media.png"),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height*0.1,
            child: Container(
              padding: EdgeInsets.only(right: 15),
              alignment: Alignment.centerRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text("Powered by: ", style: TextStyle(color: Color(0xffA1A1A1)),),
                  Image.asset("assets/drawerImages/kubilabs_logo.png"),
                ],
              )
            ),
          )
        ],
      ),
    );
  }
}
