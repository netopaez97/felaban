import 'package:felaban/components/app_drawer.dart';
import 'package:felaban/routes/Routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  static const routeName = '/home';

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  Widget _barraSuperior(){
    return CupertinoNavigationBar(
      padding: EdgeInsetsDirectional.zero,
      backgroundColor: Color(0xff8C8C8C),
      leading: IconButton(
        icon: Icon(Icons.menu, color: Colors.white),
        onPressed: () => _scaffoldKey.currentState.openDrawer(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: _barraSuperior(),
      drawer: AppDrawer(),
      body: Container(
        margin: EdgeInsets.all(0),
        color: Color(0xFFD6D6D6),
        child: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: Image.asset(
                'assets/images/background_main.png',
                width: MediaQuery.of(context).size.width,
                height: 275,
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                width: MediaQuery.of(context).size.width - 30,
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(10),
                      height: 120,
                      decoration: new BoxDecoration(
                        color: Colors.white,
                        borderRadius: new BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                      child: ListTile(
                        leading: Image.asset(
                          'assets/images/clain_logo.png',
                        ),
                        title: Container(
                          padding: EdgeInsets.only(top: 10),
                          child: ListView(
                            children: <Widget>[
                              Text("CLAIN 2019",style: TextStyle(fontFamily: 'Roboto-Black',fontSize: 16),),
                              Text("Congreso Latinoamericano de Auditoria Interna",maxLines: 3,style: TextStyle(fontFamily: 'Roboto-Medium',fontSize: 14),),
                              Row(children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(right: 2),
                                  child: Icon(Icons.location_on, size: 16,),
                                ),
                                Text("Hollywood - Florida",style: TextStyle(fontFamily: 'Roboto-Medium',fontSize: 14),),
                              ],),
                              Row(children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(right: 2),
                                  child: Icon(Icons.calendar_today, size: 16,),
                                ),
                                Text("04 - 06 Sep 2019",style: TextStyle(fontFamily: 'Roboto-Medium',fontSize: 14),),
                              ],),
                            ],
                          ),
                        ),
                        onTap: ()=> Navigator.pushNamed(context, Routes.login),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
