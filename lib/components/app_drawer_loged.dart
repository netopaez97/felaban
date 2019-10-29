import 'package:felaban/routes/Routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppDrawer extends StatelessWidget {

  final String title;
  AppDrawer(this.title, {Key key}) : super(key:key);

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
                      child: Text('Switch Event', style: TextStyle(fontSize: 18, fontFamily: 'Roboto-Medium', color: Colors.white),
                    ),
                  )
                ),
                Container(
                  color: Color(0xffF6F6F6),
                  child: ListTile(
                    title: Text(
                      'Home $title',
                      style: TextStyle(
                        color:  Color(0xff423434),
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
                ),
                Container(
                  color: Color(0xffF6F6F6),
                  child: ListTile(
                    title: Text(
                      'Programm / Agenda',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Roboto-medium',
                      ),
                    ),
                    leading: Container(
                      width: 46,
                      child: Image.asset("assets/drawerImages/clock.png"),
                    ),
                    onTap: () {
                    },
                  ),
                ),
                Container(
                  color: Color(0xffF6F6F6),
                  child: ListTile(
                    title: Text(
                      'Speakers',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Roboto-medium',
                      ),
                    ),
                    leading: Container(
                      width: 46,
                      child: Image.asset("assets/drawerImages/speaker.png"),
                    ),
                    onTap: () {
                    },
                  ),
                ),
                Container(
                  color: Color(0xffF6F6F6),
                  child: ListTile(
                    title: Text(
                      'Sponsors',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Roboto-medium',
                      ),
                    ),
                    leading: Container(
                      width: 46,
                      child: Image.asset("assets/drawerImages/sponsor.png"),
                    ),
                    onTap: () {
                    },
                  ),
                ),
                Container(
                  color: Color(0xffF6F6F6),
                  child: ListTile(
                    title: Text(
                      'Favorites',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Roboto-medium',
                      ),
                    ),
                    leading: Container(
                      width: 46,
                      child: Image.asset("assets/drawerImages/favorites.png"),
                    ),
                    onTap: () {
                    },
                  ),
                ),
                Container(
                  color: Color(0xffF6F6F6),
                  child: ListTile(
                    title: Text(
                      'Attendees',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Roboto-medium',
                      ),
                    ),
                    leading: Container(
                      width: 46,
                      child: Image.asset("assets/drawerImages/group.png"),
                    ),
                    onTap: () {
                    },
                  ),
                ),
                Container(
                  color: Color(0xffF6F6F6),
                  child: ListTile(
                    title: Text(
                      'My Meetings',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Roboto-medium',
                      ),
                    ),
                    leading: Container(
                      width: 46,
                      child: Image.asset("assets/drawerImages/deal.png"),
                    ),
                    onTap: () {
                    },
                  ),
                ),
                Container(
                  color: Color(0xffF6F6F6),
                  child: ListTile(
                    title: Text(
                      'Exhibitor List',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Roboto-medium',
                      ),
                    ),
                    leading: Container(
                      width: 46,
                      child: Image.asset("assets/drawerImages/exhibitor.png"),
                    ),
                    onTap: () {
                    },
                  ),
                ),
                Container(
                  color: Color(0xffF6F6F6),
                  child: ListTile(
                    title: Text(
                      'Venue',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Roboto-medium',
                      ),
                    ),
                    leading: Container(
                      width: 46,
                      child: Image.asset("assets/drawerImages/venue.png"),
                    ),
                    onTap: () {
                    },
                  ),
                ),
                Container(
                  color: Color(0xffF6F6F6),
                  child: ListTile(
                    title: Text(
                      'My Profile',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Roboto-medium',
                      ),
                    ),
                    leading: Container(
                      width: 46,
                      child: Image.asset("assets/drawerImages/speaker.png"),
                    ),
                    onTap: () {
                    },
                  ),
                ),
                Container(
                  color: Color(0xffF6F6F6),
                  child: ListTile(
                    title: Text(
                      'Log Out',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Roboto-medium',
                      ),
                    ),
                    leading: Container(
                      width: 46,
                      child: Image.asset("assets/drawerImages/logout.png"),
                    ),
                    onTap: () {
                    },
                  ),
                ),
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