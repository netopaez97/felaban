import 'package:felaban/models/eventosModel.dart';
import 'package:flutter/material.dart';

class EventosProvider with ChangeNotifier {

  EventosModel _eventoActual;
  // bool _eventoActivo;

  get eventoActual {
    return _eventoActual;
  }

  //Evento escogido por el usuario
  set eventoActual( EventosModel nuevoEveneto){
    this._eventoActual = nuevoEveneto;

    notifyListeners();
  }

  List<EventosModel> obtenerEventosFelaban(){

    List agenda = [
      {
        "name":"Arrival & Registration",
        "place":"Registration Area",
        "sponsor":"",
        "favorite":false,
        "time":TimeOfDay(hour: 8, minute: 0),
        "image":"assets/images/arrival_registration.png",
      },
      {
        "name":"Breakfast",
        "place":"Breakfast Area",
        "sponsor":"Sponsor by SPONSOR NAME",
        "favorite":false,
        "time":TimeOfDay(hour: 9, minute: 9),
        "image":"assets/images/breakfast.png",
      },
      {
        "name":"Session #1",
        "place":"AARON LASHERChief",
        "sponsor":"Marketing Officer - Bread Wallet",
        "favorite":false,
        "time":TimeOfDay(hour: 10, minute: 0),
        "image":"assets/images/adam_burke.png",
      },
      {
        "name":"Opening Remarks",
        "place":"Main Salon",
        "sponsor":"Felaban",
        "favorite":true,
        "time":TimeOfDay(hour: 9, minute: 30),
        "image":"assets/drawerImages/speaker.png",
      },
      {
        "name":"Session #2",
        "place":"ADAM BURKE",
        "sponsor":"US Azure Channel Sales irector - Microsoft",
        "favorite":true,
        "time":TimeOfDay(hour: 12, minute: 0),
        "image":"assets/images/aaron_lasher.png",
      },
      {
        "name":"Breakfast",
        "place":"Breakfast Area",
        "sponsor":"Sponsor By",
        "favorite":false,
        "time":TimeOfDay(hour: 13, minute: 0),
        "image":"assets/images/breakfast.png",
      },
    ];

    agenda.sort((a,b) {
      var adate = a['time'].toString(); //before -> var adate = a.expiry;
      var bdate = b['time'].toString(); //var bdate = b.expiry;
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