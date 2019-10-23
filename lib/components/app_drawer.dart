import 'package:felaban/routes/Routes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  child: Container(
                      margin: EdgeInsets.only(
                        top: 40.0,
                      ),
                      child: Text(
                        "FELABAN APP",
                        style: TextStyle(
                            fontSize: 35,
                            color: Colors.white,
                            fontFamily: 'Roboto-Light'),
                      )),
                  decoration: BoxDecoration(
                    color: Color(0xFF004A80),
                  ),
                ),
                ListTile(
                  title: Text(
                    'HOME',
                    style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Roboto-Medium'),
                  ),
                  leading: Icon(Icons.home, size: 45),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushReplacementNamed(context, Routes.home);
                  },
                ),
                Divider(),
                ListTile(
                  title: Text(
                    'About FELABAN',
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Roboto-medium',
                    ),
                  ),
                  leading: Icon(
                    Icons.info,
                    size: 45,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushReplacementNamed(
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
                      fontSize: 15.0,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Roboto-Medium',
                    ),
                  ),
                  leading: Icon(Icons.info, size: 45),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushReplacementNamed(context, Routes.about_ifc);
                  },
                ),
                Divider(),
                ListTile(
                  title: Text(
                    'APP Setup',
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF423434),
                      fontFamily: 'Roboto-Medium',
                    ),
                  ),
                  leading: Icon(
                    Icons.settings,
                    size: 45,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushReplacementNamed(context, Routes.settings);
                  },
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 10, bottom: 10),
            height: 100,
            width: MediaQuery.of(context).size.width,
            color: Color(0xFF818181),
            child: Column(
              children: <Widget>[
                Text(
                  "Follow FELABAN",
                  style: TextStyle(
                    fontFamily: 'Roboto-Light',
                    fontSize: 22.0,
                    color: Colors.white,
                  ),
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Icon(
                        FontAwesomeIcons.instagram,
                        size: 40,
                        color: Colors.white,
                      ),
                    ),
                    Expanded(
                      child: Icon(
                        FontAwesomeIcons.twitter,
                        size: 40,
                        color: Colors.white,
                      ),
                    ),
                    Expanded(
                      child: Icon(
                        FontAwesomeIcons.facebook,
                        size: 40,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
