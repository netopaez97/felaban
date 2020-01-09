import 'package:felaban/models/eventoEspecificoModel.dart';
import 'package:felaban/models/eventosModel.dart';
import 'package:flutter/material.dart';

class EventosProvider with ChangeNotifier {


  ///¡LEER!
  ///En este momento no es correcto colocar la variable favorito en el modelo EventoEspecifico.
  ///puesto que un evento específico es favorito solo para UN usuario, no para todos.

  ///Evento general.
  EventosModel _eventoActual;
  ///Eventos felaban
  List<EventosModel> _eventos = [];
  ///Evento específicio del evento general.
  EventoEspecificoModel _eventoEspecificoActual;
  ///Lista de eventos especificos favoritos para el usuario
  List<EventoEspecificoModel> _listaEventEspecificosFavoritos = [];

  get eventoActual {
    return _eventoActual;
  }
  get eventos {
    return _eventos;
  }
  get eventoEspecificoActual {
    return _eventoEspecificoActual;
  }
  get listaEventEspecificosFavoritos {
    return _listaEventEspecificosFavoritos;
  }

  //Evento escogido por el usuario
  set eventoActual( EventosModel nuevoEveneto){
    this._eventoActual = nuevoEveneto;

    notifyListeners();
  }
  //Editar lista de eventos felaban
  set eventos( List<EventosModel> newEventos){
    this._eventos = newEventos;
  }
  //Evento específico escogido por el usuario en la agenda
  set eventoEspecificoActual (EventoEspecificoModel _nuevoEventoEspecifico) {
    this._eventoEspecificoActual = _nuevoEventoEspecifico;
    
    notifyListeners();
  }
  //Lista de eventos especificos favoritos para el usuario
  set agregarEventoAFavoritos(EventoEspecificoModel e){
    this._listaEventEspecificosFavoritos.add(e);

    notifyListeners();
  }

  set eliminarEventoAFavoritos(EventoEspecificoModel e){
    this._listaEventEspecificosFavoritos.removeWhere((eventoAEliminar) => eventoAEliminar == e);

    notifyListeners();
  }
  
  set listaEventEspecificosFavoritos(List<EventoEspecificoModel> newListFavEventoEspecifico){
    this._listaEventEspecificosFavoritos = newListFavEventoEspecifico;

    notifyListeners();
  }

  List<EventosModel> obtenerEventosFelaban(){

    List<EventoEspecificoModel> agenda = [
      EventoEspecificoModel(
        name:"Arrival & Registration",
        place:"Registration Area",
        sponsor:"",
        favorite:false,
        time:TimeOfDay(hour: 8, minute: 0),
        image:"assets/images/arrival_registration.png",
      ),
      EventoEspecificoModel(
        name:"Breakfast",
        place:"Breakfast Area",
        sponsor:"Sponsor by SPONSOR NAME",
        favorite:false,
        time:TimeOfDay(hour: 9, minute: 9),
        image:"assets/images/breakfast.png",
      ),
      EventoEspecificoModel(
        name:"Session #1",
        place:"AARON LASHERChief",
        sponsor:"Marketing Officer - Bread Wallet",
        favorite:false,
        time:TimeOfDay(hour: 10, minute: 0),
        image:"assets/images/adam_burke.png",
      ),
      EventoEspecificoModel(
        name:"Opening Remarks",
        place:"Main Salon",
        sponsor:"Felaban",
        favorite:false,
        time:TimeOfDay(hour: 9, minute: 30),
        image:"assets/drawerImages/speaker.png",
      ),
      EventoEspecificoModel(
        name:"Session #2",
        place:"ADAM BURKE",
        sponsor:"US Azure Channel Sales irector - Microsoft",
        favorite:false,
        time:TimeOfDay(hour: 12, minute: 0),
        image:"assets/images/aaron_lasher.png",
      ),
      EventoEspecificoModel(
        name:"Breakfast",
        place:"Breakfast Area",
        sponsor:"Sponsor By",
        favorite:false,
        time:TimeOfDay(hour: 13, minute: 0),
        image:"assets/images/breakfast.png",
      ),
    ];

    agenda.sort((a,b) {
      var adate = a.time.toString(); //before -> var adate = a.expiry;
      var bdate = b.time.toString(); //var bdate = b.expiry;
      return adate.compareTo(bdate);
    });

    List<EventosModel> _eventosFelaban = [
      EventosModel(
        titulo: "CLAIN 2019",
        descripcion: "Congreso Latinoamericano de Auditoria Interna y Evaluación de Riesgos",
        ubicacion: "Hollywood - Florida",
        fecha: ["Thursday, September 1, 2019","Friday, September 2, 2019","Saturday, September 3, 2019"],
        imagenPequena: "assets/images/clain_logo.png",
        imagenGrande: "assets/images/clain.png",
        agenda: agenda,
      ),
      EventosModel(
        titulo: "CL@B 2019",
        descripcion: "Congreso Latinoamericano de Automatizacion Bancaria",
        ubicacion: "Hollywood - Florida",
        fecha: ["Thursday, September 1, 2019","Friday, September 2, 2019","Saturday, September 3, 2019"],
        imagenPequena: "assets/images/clab_logo.png",
        imagenGrande: "assets/images/clab.png",
        agenda: agenda,
      ),
      EventosModel(
        titulo: "ASAMBLEA FELABAN 2020",
        descripcion: "Asamblea Anual\nFELABAN",
        ubicacion: "Guatemala",
        fecha: ["Thursday, September 1, 2019","Friday, September 2, 2019","Saturday, September 3, 2019"],
        imagenPequena: "assets/images/asamblea_felaban_logo.png",
        imagenGrande: "assets/images/asamblea_felaban.png",
        agenda: agenda,
      ),
      EventosModel(
        titulo: "CLAIN 2019",
        descripcion: "Congreso Latinoamericano de Auditoria Interna y Evaluación de Riesgos",
        ubicacion: "Hollywood - Florida",
        fecha: ["Thursday, September 1, 2019","Friday, September 2, 2019","Saturday, September 3, 2019"],
        imagenPequena: "assets/images/clain_logo.png",
        imagenGrande: "assets/images/clain.png",
        agenda: agenda,
      ),
    ];

    _eventos = _eventosFelaban;
    
    return _eventosFelaban;
  }


}