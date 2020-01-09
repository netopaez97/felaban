import 'package:felaban/components/barraSuperiorBACK.dart';
import 'package:felaban/models/eventoEspecificoModel.dart';
import 'package:felaban/models/speakersModel.dart';
import 'package:felaban/pages/menu_loged/agenda/detalle_agenda/gallery.dart';
import 'package:felaban/pages/menu_loged/speakers/speakers_detalle.dart';
import 'package:felaban/providers/eventos_provider.dart';
import 'package:felaban/providers/speakersProvider.dart';
import 'package:felaban/routes/Routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class DetalleAgendaView extends StatefulWidget {

  static const routeName = "/detalleAgenda";

  @override
  _DetalleAgendaViewState createState() => _DetalleAgendaViewState();
}

class _DetalleAgendaViewState extends State<DetalleAgendaView> {

  bool _favorite = false;

  final String _nombreAgenda = "Opening ceremony";

  final List<SpeakersModel> _listaDeSpeakers = [
    SpeakersModel(
      name:"Laura Bommer",
      cargo:"Moderator",
      imageLocation:"assets/detalleAgenda/laura_bommer.png",
      favorite: false,
    ),
    SpeakersModel(
      name:"Giorgio Trettenero Castro",
      cargo:"Secretary General FELABAN",
      imageLocation:"assets/images/profile_face.png",
      favorite: false,
    ),
  ];

  bool _eventoActivo = true;

  Widget _cuerpoDeLaPagina(){
    return ListView(
      children: <Widget>[
        _informacionCeremonia(),
        _pasarelaOpciones(),
        _descripcion(),
        _speakersTituloBarra(),
        _speakersContenido(),
        _sessionQyATituloBarra(),
        _sessionQyADescription(),
        _livePollsTituloBarra(),
        _livePollsDescripcion(),
        _photosTituloBarra(),
        _photosDescripcion(),
      ],
    );
  }

  Widget _informacionCeremonia(){
    return GestureDetector(
      onTap: (){
        setState(() {
          _eventoActivo = !_eventoActivo;
        });
      },
      child: Container(
      height: 110,
        child: Stack(
          children: <Widget>[
            Container(
              color: Colors.black,
              width: double.infinity,
              child: Image.asset("assets/background.png", fit: BoxFit.cover,),
            ),
            Container(
              margin: EdgeInsets.only(left: 10, top: 10, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(_nombreAgenda, style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
                  Text("Wednesday 09:30 - 10:00 am", style: TextStyle(color: Colors.white, fontSize: 16),),
                  Text("Sep 01, 2019", style: TextStyle(color: Colors.white, fontSize: 16),),
                ],
              ),
            ),
            Container(
              height: double.infinity,
              margin: EdgeInsets.only(bottom: 10, right: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Icon(Icons.place, color:Colors.white),
                  Text("Main Central Area", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _pasarelaOpciones(){

    final EventosProvider _eventosInfo = Provider.of<EventosProvider>(context);
    final EventoEspecificoModel _eventoEspecificoActual = _eventosInfo.eventoEspecificoActual;

    print(_eventoEspecificoActual.favorite);

    double anchoBotones = MediaQuery.of(context).size.width*0.22;

    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: MediaQuery.of(context).size.width*0.04),
      color: Color(0xff489ED2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            child: Container(
              width: anchoBotones,
              child: Column(
                children: <Widget>[
                  IconButton(
                    icon: _eventoActivo == false
                    
                    ? Image.asset("assets/detalleAgenda/calendario.png")
                    : Image.asset("assets/detalleAgenda/calendario.png", color: Colors.white.withOpacity(0.34),),

                    onPressed: (){

                    },
                  ),
                    _eventoActivo == false

                    ? Text("Add to calendar", style: TextStyle(color: Colors.white, fontSize: 12), textAlign: TextAlign.center,)
                    : Text("Add to calendar", style: TextStyle(color: Colors.white.withOpacity(0.34), fontSize: 12), textAlign: TextAlign.center,),
                ],
              ),
            ),
          ),
          GestureDetector(
            child: Container(
              width: anchoBotones,
              child: Column(
                children: <Widget>[

                  IconButton(
                      icon: _eventoActivo == false
                      
                      ? Icon(IconData(0xF35A, fontFamily: CupertinoIcons.iconFont, fontPackage: CupertinoIcons.iconFontPackage), color: Colors.white, size: 34,)
                      : Icon(IconData(0xF35A, fontFamily: CupertinoIcons.iconFont, fontPackage: CupertinoIcons.iconFontPackage), color: Colors.white.withOpacity(0.34), size: 34,),
                      onPressed: (){},
                    ),
                    _eventoActivo == false

                    ? Text("Reminder", style: TextStyle(color: Colors.white, fontSize: 12), textAlign: TextAlign.center,)
                    : Text("Reminder", style: TextStyle(color: Colors.white.withOpacity(0.34), fontSize: 12), textAlign: TextAlign.center,),  
                ],
              ),
            ),
          ),
          GestureDetector(
            child: Container(
              width: anchoBotones,
              child: Column(
                children: <Widget>[
                  IconButton(
                    icon: Image.asset("assets/detalleAgenda/camera.png"),
                    onPressed: (){
                      ImagePicker.pickImage(source: ImageSource.camera);
                    },
                  ),
                  Text("Photo", style: TextStyle(color: Colors.white, fontSize: 12), textAlign: TextAlign.center,),
                ],
              ),
            ),
          ),
          GestureDetector(
            child: Container(
              width: anchoBotones,
              child: Column(
                children: <Widget>[
                  IconButton(
                    icon: _eventoEspecificoActual.favorite==false
                      ? Icon(IconData(0xF442, fontFamily: CupertinoIcons.iconFont, fontPackage: CupertinoIcons.iconFontPackage), color: Colors.white, size: 34,)
                      : Icon(IconData(0xF443, fontFamily: CupertinoIcons.iconFont, fontPackage: CupertinoIcons.iconFontPackage), color: Colors.white, size: 34,),
                    onPressed: (){
                      if(_eventoEspecificoActual.favorite==false)
                        setState(() {
                          _eventosInfo.agregarEventoAFavoritos = _eventoEspecificoActual;
                          _eventoEspecificoActual.favorite=!_eventoEspecificoActual.favorite;
                        });
                      else
                        setState(() {
                          _eventosInfo.eliminarEventoAFavoritos = _eventoEspecificoActual;
                          _eventoEspecificoActual.favorite=!_eventoEspecificoActual.favorite;
                        });
                    },
                  ),
                  Text("Favorite", style: TextStyle(color: Colors.white, fontSize: 12), textAlign: TextAlign.center,),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _descripcion(){
    return Container(
      margin: EdgeInsets.all(MediaQuery.of(context).size.width*0.05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(_nombreAgenda.toUpperCase(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
          SizedBox(height: 5,),
          Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ", style: TextStyle(fontSize: 16), )
        ],
      )
    );
  }

  Widget _speakersTituloBarra(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      color: Color(0xffC4C4C4),
      height: 53,
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text("SPEAKERS", style: TextStyle( fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),),
          Image.asset("assets/drawerImages/speaker.png", color: Colors.white,)
        ],
      ),
    );
  }

  Widget _speakersContenido(){
    
    final speakersInfo = Provider.of<SpeakersProvider>(context);

    List<Widget> _speakersAMostrar = [];
    for(int i=0; i<_listaDeSpeakers.length;i++){
      _speakersAMostrar.add(Container(
        color: Color(0xffEEEEEE),
        child: Column(
          children: <Widget>[
            ListTile(
              leading: Container(
                width: 71,
                height: 71,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(_listaDeSpeakers[i].imageLocation),
                  )
                )
              ),
              title: Text(_listaDeSpeakers[i].name, style: TextStyle(fontSize: 20),),
              subtitle: Text(_listaDeSpeakers[i].cargo, style: TextStyle(fontSize: 17),),
              trailing: Icon(Icons.arrow_forward_ios, color: Colors.white),
              onTap: (){
                speakersInfo.speakerActual = _listaDeSpeakers[i];
                Navigator.push(context, MaterialPageRoute(
                  builder: (BuildContext context) => DetalleSpeakersView()
                ));
              },
            ),
            Divider(color: Colors.white, height: 1,)
          ],
        )
      ),);
    }

    return Column(
      children: _speakersAMostrar,
    );
  }

  Widget _sessionQyATituloBarra(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      color: Color(0xffC4C4C4),
      height: 53,
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text("SESSION Q&A", style: TextStyle( fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),),
          Image.asset("assets/detalleAgenda/qya.png", color: Colors.white,)
        ],
      ),
    );
  }

  Widget _sessionQyADescription(){
    if(_eventoActivo == false)
      return Container(
        margin: EdgeInsets.all(MediaQuery.of(context).size.width*0.05),
        child: Text("Questions can be submitted one hour before and Up to thirty minutes after this sesion.", style: TextStyle(fontSize: 16), )
      );
    else
      return Container(
        margin: EdgeInsets.all(MediaQuery.of(context).size.width*0.05),
        child: GestureDetector(
          child: Text("Click here to ask a Question.", style: TextStyle(fontSize: 16),),
          onTap: (){
            Navigator.pushNamed(context, Routes.qyaAgendaDetalles);
          },
          onDoubleTap: (){
            print("object");
          },
        ),
      );
  }

  Widget _livePollsTituloBarra(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      color: Color(0xffC4C4C4),
      height: 53,
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text("LIVE POLLS", style: TextStyle( fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),),
          Image.asset("assets/detalleAgenda/live_polls.png",)
        ],
      ),
    );
  }

  Widget _livePollsDescripcion(){
    if(_eventoActivo == false)
      return Container(
        margin: EdgeInsets.all(MediaQuery.of(context).size.width*0.05),
        child: Text("No active Polls at this moment, please come back when session is Live.", style: TextStyle(fontSize: 16), )
      );
    else
      return Container(
        margin: EdgeInsets.all(MediaQuery.of(context).size.width*0.05),
        child: GestureDetector(
          child: Text("Click here to Participate.", style: TextStyle(fontSize: 16),),
          onTap: (){
            Navigator.pushNamed(context, Routes.livePollAgendaDetalles);
          },
        ),
      );
  }

  Widget _photosTituloBarra(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      color: Color(0xffC4C4C4),
      height: 53,
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text("PHOTOS", style: TextStyle( fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),),
          Image.asset("assets/detalleAgenda/camera.png", color: Colors.white,)
        ],
      ),
    );
  }

  Widget _photosDescripcion(){

    List _direccionesImagenes = [
      "assets/detalleAgenda/photo1.png",
      "assets/detalleAgenda/photo2.png",
      "assets/detalleAgenda/photo3.png",
      "assets/detalleAgenda/photo4.png",
      "assets/detalleAgenda/photo5.png",
    ];

    return Container(
      margin: EdgeInsets.all(MediaQuery.of(context).size.width*0.05),
      child: GridView.builder(
        itemCount: _direccionesImagenes.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, crossAxisSpacing: 7),
        itemBuilder: (context,direccion){
          return GestureDetector(
            child: Image.asset(_direccionesImagenes[direccion]),
            onTap: (){
              Navigator.push(context, 
                MaterialPageRoute(
                  builder: (BuildContext context) => GalleryAgendaDetallesView(_direccionesImagenes[direccion]),
                )
              );
            },
          );
        },
        shrinkWrap: true,
        /* crossAxisCount: 3,
        children: <Widget>[
          GestureDetector(
            child: Image.asset("assets/detalleAgenda/photo1.png"),
            onTap: (){
              Navigator.push(context, 
                MaterialPageRoute(
                  builder: (BuildContext context) => GalleryAgendaDetallesView("assets/detalleAgenda/photo1.png"),
                )
              );
            },
          ),
          Image.asset("assets/detalleAgenda/photo2.png"),
          Image.asset("assets/detalleAgenda/photo3.png"),
          Image.asset("assets/detalleAgenda/photo4.png"),
          Image.asset("assets/detalleAgenda/photo5.png"),
        ], */
      )
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: barraSuperior(context),
      body: _cuerpoDeLaPagina(),
    );
  }

}