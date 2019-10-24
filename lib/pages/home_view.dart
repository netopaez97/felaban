import 'package:felaban/components/app_drawer.dart';
import 'package:felaban/components/backgroundSuperior.dart';
import 'package:felaban/routes/Routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
      leading: CupertinoButton(
        minSize: double.minPositive,
        child: Icon(FontAwesomeIcons.bars, color: Colors.white),
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
        child: Container(
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              BackgroundSuperiorWidget(titulo: "Neto"),
              
              Container(
                height: MediaQuery.of(context).size.height*0.6,
                child: ListView.builder(
                shrinkWrap: true,
                itemCount: 4,
                itemBuilder: (BuildContext context, int item){
                  return Container(
                    margin: EdgeInsets.all(10),
                    height: 127,
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
                  );
                }
              ),
            
              )
            ],
          ),
        )
      ),
    );
  }
}
