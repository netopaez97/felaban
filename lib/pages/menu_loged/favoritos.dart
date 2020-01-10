import 'package:felaban/components/barraSuperiorBACK.dart';
import 'package:felaban/models/attendeesModel.dart';
import 'package:felaban/models/eventoEspecificoModel.dart';
import 'package:felaban/models/exhibitorModel.dart';
import 'package:felaban/models/speakersModel.dart';
import 'package:felaban/models/sponsorModel.dart';
import 'package:felaban/pages/menu_loged/exhibitor/detalle_exhibitor_list.dart';
import 'package:felaban/pages/menu_loged/speakers/speakers_detalle.dart';
import 'package:felaban/pages/menu_loged/sponsors/sponsors_detalle.dart';
import 'package:felaban/providers/attendees_provider.dart';
import 'package:felaban/providers/eventos_provider.dart';
import 'package:felaban/providers/exhibitor_provider.dart';
import 'package:felaban/providers/speakersProvider.dart';
import 'package:felaban/providers/sponsors_provider.dart';
import 'package:felaban/routes/Routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoritosPage extends StatefulWidget {

  static const routeName = '/favoritosPage';

  @override
  _FavoritosPageState createState() => _FavoritosPageState();
}

class _FavoritosPageState extends State<FavoritosPage> {

  final double _margenHorizontal = 15;

  Widget _cuerpoDeLaPagina(){
    return ListView(
      children: <Widget>[
        _barraFavoritos(),
        _barraTitulo("SESSIONS"),
        _listaEventosFavoritos(),
        _barraTitulo("ATTENDEES"),
        _listaAttendeesFavoritos(),
        _barraTitulo("SPEAKERS"),
        _listaSpeakersFavoritos(),
        _barraTitulo("SPONSORS"),
        _listaSponsorsFavoritos(),
        _barraTitulo("EXHIBITORS"),
        _listaExhibitorsFavoritos(),
      ],
    );
  }

  Widget _barraFavoritos(){
    return Container(
      color: Color(0xff489ED2),
      padding: EdgeInsets.symmetric(horizontal: _margenHorizontal),
      height: 53,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text("Favorites", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),),
          Icon(Icons.favorite, color:Colors.white),
        ],
      ),
    );
  }

  Widget _barraTitulo(String empresa){
    return Container(
      alignment: Alignment.centerLeft,
      color: Color(0xffF0F0F0),
      padding: EdgeInsets.symmetric(horizontal: _margenHorizontal),
      height: 53,
      child: Text(empresa, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xff489ED2)),),
    );
  }

  Widget _listaEventosFavoritos(){

    final EventosProvider eventosProvider = Provider.of<EventosProvider>(context);
    final List<EventoEspecificoModel> eventosFavoritos = eventosProvider.listaEventEspecificosFavoritos;
    
    return eventosFavoritos == null || eventosFavoritos.length == 0 ? Padding(
        padding: const EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Text("There aren't events in your favorite list."),
          ),
        ),
      )
      :ListView.builder(
        shrinkWrap: true,
        itemCount: eventosFavoritos.length,
        itemBuilder: (context, item){
          return Column(
            children: <Widget>[
              ListTile(
                leading: Image.asset(eventosFavoritos[item].image),
                title: Text(eventosFavoritos[item].name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(eventosFavoritos[item].place, style: TextStyle(fontSize: 15, color: Colors.red)),
                    Text(eventosFavoritos[item].sponsor, style: TextStyle(fontSize: 15, color: Colors.red)),
                  ],
                ),
                onTap: (){
                  eventosProvider.eventoEspecificoActual = eventosFavoritos[item];
                  Navigator.pushNamed(context, Routes.detalleAgenda);
                },
              ),
              _divider(),
            ],
          );
        },
      );
  }

  Widget _listaAttendeesFavoritos(){

    final attendeesInfo = Provider.of<AttendeesProvider>(context);
    final List<AttendeesModel> attendeesFavoritos = attendeesInfo.listaAttendeesFavoritos;
    
    return attendeesFavoritos == null || attendeesFavoritos.length == 0 ? Padding(
        padding: const EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Text("There aren't favorite attendees in your list"),
          ),
        ),
      )
      :ListView.builder(
        shrinkWrap: true,
        itemCount: attendeesFavoritos.length,
        itemBuilder: (context, item){
          return Column(
            children: <Widget>[
              ListTile(
                leading: Image.asset(attendeesFavoritos[item].imageLocation),
                title: Text(attendeesFavoritos[item].name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                subtitle: Text(attendeesFavoritos[item].company, style: TextStyle(fontSize: 15)),
                onTap: (){
                  attendeesInfo.attendeeActual = attendeesFavoritos[item];
                  Navigator.pushNamed(context, Routes.perfilUsuarioPublico);
                },
              ),
              _divider(),
            ],
          );
        },
      );
  }

  Widget _listaSpeakersFavoritos(){

    final speakersInfo = Provider.of<SpeakersProvider>(context);
    final List<SpeakersModel> speakersFavorito = speakersInfo.listaSpeakersFavoritos;
    
    return speakersFavorito == null || speakersFavorito.length == 0 ? Padding(
        padding: const EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Text("There aren't favorite speakers in your list"),
          ),
        ),
      )
      :ListView.builder(
        shrinkWrap: true,
        itemCount: speakersFavorito.length,
        itemBuilder: (context, item){
          return Column(
            children: <Widget>[
              ListTile(
                leading: Image.asset(speakersFavorito[item].imageLocation),
                title: Text(speakersFavorito[item].name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                subtitle: Text(speakersFavorito[item].cargo, style: TextStyle(fontSize: 15)),
                onTap: (){
                  speakersInfo.speakerActual = speakersFavorito[item];
                  Navigator.push(context, MaterialPageRoute(
                    builder: (BuildContext context) => DetalleSpeakersView()
                  ));
                },
              ),
              _divider(),
            ],
          );
        },
      );
  }

  Widget _listaSponsorsFavoritos(){

    final sponsorsInfo = Provider.of<SponsorsProvider>(context);
    final List<SponsorModel> sponsorsFavoritos = sponsorsInfo.listasponsorsFavoritos;
    
    return sponsorsFavoritos == null || sponsorsFavoritos.length == 0 ? Padding(
        padding: const EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Text("There aren't favorite sponsors in your list"),
          ),
        ),
      )
      :ListView.builder(
        shrinkWrap: true,
        itemCount: sponsorsFavoritos.length,
        itemBuilder: (context, item){
          return Column(
            children: <Widget>[
              ListTile(
                leading: Image.asset(sponsorsFavoritos[item].imageLocation),
                title: Text(sponsorsFavoritos[item].name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                subtitle: Text(sponsorsFavoritos[item].location, style: TextStyle(fontSize: 15)),
                onTap: (){
                  sponsorsInfo.sponsorActual = sponsorsFavoritos[item];
                  print(sponsorsInfo.sponsorActual.favorite);
                  Navigator.push(context, MaterialPageRoute(
                    builder: (BuildContext context) => DetalleSponsorView()
                  ));
                },
              ),
              _divider(),
            ],
          );
        },
      );
  }

  Widget _listaExhibitorsFavoritos(){

    final exhibitorsInfo = Provider.of<ExhibitorProvider>(context);
    final List<ExhibitorsModel> exhibitorsFavoritos = exhibitorsInfo.listaExhibitorsFavoritos;
    
    return exhibitorsFavoritos == null || exhibitorsFavoritos.length == 0 ? Padding(
        padding: const EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Text("There aren't favorite exhibitors in your list"),
          ),
        ),
      )
      :ListView.builder(
        shrinkWrap: true,
        itemCount: exhibitorsFavoritos.length,
        itemBuilder: (context, item){
          return Column(
            children: <Widget>[
              ListTile(
                leading: Image.asset(exhibitorsFavoritos[item].imageLocation),
                title: Text(exhibitorsFavoritos[item].name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                onTap: (){
                  exhibitorsInfo.exhibitorActual = exhibitorsFavoritos[item];
                  print(exhibitorsInfo.exhibitorActual.favorite);
                  Navigator.push(context, MaterialPageRoute(
                    builder: (BuildContext context) => ExhibitorDetailPage(exhibitorsInfo.exhibitorActual)
                  ));
                },
              ),
              Divider(color: Color(0xffC4C4C4),)
            ],
          );
        },
      );
  }

  Widget _divider(){
    return Divider(height: 1, color: Color(0xffC4C4C4),);
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: barraSuperior(context),
      body: _cuerpoDeLaPagina(),
    );
  }
}