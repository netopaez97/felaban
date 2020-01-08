import 'package:felaban/components/barraSuperiorBACK.dart';
import 'package:felaban/models/attendeesModel.dart';
import 'package:felaban/models/eventoEspecificoModel.dart';
import 'package:felaban/models/eventosModel.dart';
import 'package:felaban/providers/attendees_provider.dart';
import 'package:felaban/providers/eventos_provider.dart';
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
        _barraTitulo("SESSIONS"),
        _listaEventosFavoritos(),
        _barraTitulo("ATTENDEES"),
        _listaAttendeesFavoritos(),
      ],
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
          return ListTile(
            leading: Image.asset(eventosFavoritos[item].image),
            title: Text(eventosFavoritos[item].name),
            onTap: (){
              eventosProvider.eventoEspecificoActual = eventosFavoritos[item];
              Navigator.pushNamed(context, Routes.detalleAgenda);
            },
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
                title: Text(attendeesFavoritos[item].name),
                onTap: (){
                  attendeesInfo.attendeeActual = attendeesFavoritos[item];
                  Navigator.pushNamed(context, Routes.perfilUsuario);
                },
              ),
              Divider()
            ],
          );
        },
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