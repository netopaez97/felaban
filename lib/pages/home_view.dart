import 'package:felaban/components/app_drawer.dart';
import 'package:felaban/components/backgroundSuperior.dart';
import 'package:felaban/models/eventosModel.dart';
import 'package:felaban/pages/login_view.dart';
import 'package:felaban/providers/eventos_provider.dart';
import 'package:felaban/routes/Routes.dart';
import 'package:felaban/splash/splash_evento.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeView extends StatefulWidget {
  static const routeName = '/home';

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  final _eventosProvider = EventosProvider();
  List<EventosModel> _eventos = EventosProvider().obtenerEventosFelaban();
  
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  Widget _barraSuperior(){
    return CupertinoNavigationBar(
      backgroundColor: Color(0xff8C8C8C),
      border: Border.all(
        style: BorderStyle.none,
      ),
      actionsForegroundColor: Colors.white,
      //leading: Icon(IconData(0xF394, fontFamily: CupertinoIcons.iconFont, fontPackage: CupertinoIcons.iconFontPackage)),
      leading:  GestureDetector(
        onTap: () => _scaffoldKey.currentState.openDrawer(),
        child: Icon(IconData(0xF394, fontFamily: CupertinoIcons.iconFont, fontPackage: CupertinoIcons.iconFontPackage)),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _eventos = _eventosProvider.obtenerEventosFelaban();
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
              BackgroundSuperiorWidget(titulo: "Upcoming Conferences"),
              
              Container(
                height: MediaQuery.of(context).size.height*0.6,
                child: ListView.builder(
                shrinkWrap: true,
                itemCount: _eventos.length,
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
                        _eventos[item].imagenUbicacion,
                        width: 73,
                      ),
                      title: Container(
                        padding: EdgeInsets.only(top: 10),
                        child: ListView(
                          children: <Widget>[
                            Text(_eventos[item].titulo,style: TextStyle(fontFamily: 'Roboto-Black',fontSize: 16),),
                            Text(_eventos[item].descripcion,maxLines: 3,style: TextStyle(fontFamily: 'Roboto-Medium',fontSize: 14),),
                            Row(children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(right: 2),
                                child: Icon(Icons.location_on, size: 16,),
                              ),
                              Text(_eventos[item].ubicacion,style: TextStyle(fontFamily: 'Roboto-Medium',fontSize: 14),),
                            ],),
                            Row(children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(right: 2),
                                child: Icon(Icons.calendar_today, size: 16,),
                              ),
                              Text(_eventos[item].fecha,style: TextStyle(fontFamily: 'Roboto-Medium',fontSize: 14),),
                            ],),
                          ],
                        ),
                      ),
                      onTap: ()=> Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SplashEventView(_eventos[item].titulo))
                      ),
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
