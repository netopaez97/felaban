import 'package:felaban/components/app_drawer_no_loged.dart';
import 'package:felaban/components/backgroundSuperior.dart';
import 'package:felaban/models/eventosModel.dart';
import 'package:felaban/pages/login/login_preview.dart';
import 'package:felaban/providers/eventos_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    super.initState();

    _eventos = _eventosProvider.obtenerEventosFelaban();
  }

  @override
  Widget build(BuildContext context) {

    final eventosInfo = Provider.of<EventosProvider>(context);

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
              BackgroundSuperiorWidget(titulo: "Upcoming Conferences", negrita: false,),
              
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
                          _eventos[item].imagenPequena,
                          width: 73,
                        ),
                        title: Container(
                          padding: EdgeInsets.only(top: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                                Text(_eventos[item].fecha[0],style: TextStyle(fontFamily: 'Roboto-Medium',fontSize: 14),),
                              ],),
                            ],
                          ),
                        ),
                        onTap: (){

                          eventosInfo.eventoActual = EventosModel(
                            titulo: _eventos[item].titulo,
                            descripcion: _eventos[item].descripcion,
                            ubicacion: _eventos[item].ubicacion,
                            fecha: _eventos[item].fecha,
                            imagenPequena: _eventos[item].imagenPequena,
                            imagenGrande: _eventos[item].imagenGrande,
                          );

                          print(eventosInfo.eventoActual.titulo);

                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => LoginPreview(_eventos[item].titulo))
                          );
                        }
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
