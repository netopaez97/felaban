import 'package:felaban/components/barraSuperiorBACK.dart';
import 'package:felaban/models/eventoEspecifico.dart';
import 'package:felaban/models/eventosModel.dart';
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
        _barraTitulo("Eventos"),
        _listaEventosFavoritos(),
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
    final List<EventoEspecifico> eventosFavoritos = eventosProvider.listaEventEspecificosFavoritos;
    
    return eventosFavoritos == null || eventosFavoritos.length == 0 ? Padding(
        padding: const EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Text("No hay eventos en tu lista de favoritos"),
          ),
        ),
      )
      :ListView.builder(
        shrinkWrap: true,
        itemCount: eventosFavoritos.length,
        itemBuilder: (context, item){
          return ListTile(
            leading: Icon(Icons.favorite),
            title: Text(eventosFavoritos[item].name),
            onTap: (){
              eventosProvider.eventoEspecificoActual = eventosFavoritos[item];
              Navigator.pushNamed(context, Routes.detalleAgenda);
            },
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