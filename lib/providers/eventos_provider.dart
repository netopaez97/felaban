import 'package:felaban/models/eventoEspecifico.dart';
import 'package:felaban/models/eventosModel.dart';
import 'package:flutter/material.dart';

class EventosProvider with ChangeNotifier {

  ///Evento general.
  EventosModel _eventoActual;
  ///Evento específicio del evento general.
  EventoEspecifico _eventoEspecificoActual;
  ///Lista de eventos especificos favoritos para el usuario
  List<EventoEspecifico> _listaEventEspecificosFavoritos = [];

  get eventoActual {
    return _eventoActual;
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
  //Evento específico escogido por el usuario en la agenda
  set eventoEspecificoActual (EventoEspecifico _nuevoEventoEspecifico) {
    this._eventoEspecificoActual = _nuevoEventoEspecifico;
    
    notifyListeners();
  }
  //Lista de eventos especificos favoritos para el usuario
  set agregarEventoAFavoritos(EventoEspecifico e){
    this._listaEventEspecificosFavoritos.add(e);

    notifyListeners();
  }

  set eliminarEventoAFavoritos(EventoEspecifico e){
    this.listaEventEspecificosFavoritos.removeWhere((eventoAEliminar) => eventoAEliminar == e);

    notifyListeners();
  }

  List<EventosModel> obtenerEventosFelaban(){

    List<EventoEspecifico> agenda = [
      EventoEspecifico(
        name:"Arrival & Registration",
        place:"Registration Area",
        sponsor:"",
        favorite:false,
        time:TimeOfDay(hour: 8, minute: 0),
        image:"assets/images/arrival_registration.png",
      ),
      EventoEspecifico(
        name:"Breakfast",
        place:"Breakfast Area",
        sponsor:"Sponsor by SPONSOR NAME",
        favorite:false,
        time:TimeOfDay(hour: 9, minute: 9),
        image:"assets/images/breakfast.png",
      ),
      EventoEspecifico(
        name:"Session #1",
        place:"AARON LASHERChief",
        sponsor:"Marketing Officer - Bread Wallet",
        favorite:false,
        time:TimeOfDay(hour: 10, minute: 0),
        image:"assets/images/adam_burke.png",
      ),
      EventoEspecifico(
        name:"Opening Remarks",
        place:"Main Salon",
        sponsor:"Felaban",
        favorite:false,
        time:TimeOfDay(hour: 9, minute: 30),
        image:"assets/drawerImages/speaker.png",
      ),
      EventoEspecifico(
        name:"Session #2",
        place:"ADAM BURKE",
        sponsor:"US Azure Channel Sales irector - Microsoft",
        favorite:false,
        time:TimeOfDay(hour: 12, minute: 0),
        image:"assets/images/aaron_lasher.png",
      ),
      EventoEspecifico(
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
    
    return [
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
  }


}