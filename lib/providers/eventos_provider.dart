import 'package:felaban/models/eventosModel.dart';
import 'package:flutter/material.dart';

class EventosProvider with ChangeNotifier {

  EventosModel _eventoActual;

  get eventoActual {
    return _eventoActual;
  }

  set eventoActual( EventosModel nuevoEveneto){
    this._eventoActual = nuevoEveneto;

    notifyListeners();
  }


  List<EventosModel> obtenerEventosFelaban(){
    return [
      EventosModel(
        titulo: "CLAIN 2019",
        descripcion: "Congreso Latinoamericano de Auditoria Interna y Evaluación de Riesgos",
        ubicacion: "Hollywood - Florida",
        fecha: "04 - 06 Sep 2019",
        imagenUbicacion: "assets/images/clain_logo.png",
      ),
      EventosModel(
        titulo: "CL@B 2019",
        descripcion: "Congreso Latinoamericano de Automatizacion Bancaria",
        ubicacion: "Hollywood - Florida",
        fecha: "04 - 06 Sep 2019",
        imagenUbicacion: "assets/images/clab_logo.png",
      ),
      EventosModel(
        titulo: "ASAMBLEA FELABAN 2020",
        descripcion: "Asamblea Anual\nFELABAN",
        ubicacion: "Guatemala",
        fecha: "08 - 11 Nov 2020",
        imagenUbicacion: "assets/images/otro_homepage_felaban.png",
      ),
      EventosModel(
        titulo: "CLAIN 2019",
        descripcion: "Congreso Latinoamericano de Auditoria Interna y Evaluación de Riesgos",
        ubicacion: "Hollywood - Florida",
        fecha: "04 - 06 Sep 2019",
        imagenUbicacion: "assets/images/clain_logo.png",
      ),
    ];
  }


}