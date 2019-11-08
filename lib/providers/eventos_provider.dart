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
        fecha: ["Thursday, September 1, 2019","Friday, September 2, 2019","Saturday, September 3, 2019"],
        imagenPequena: "assets/images/clain_logo.png",
        imagenGrande: "assets/images/clain.png"
      ),
      EventosModel(
        titulo: "CL@B 2019",
        descripcion: "Congreso Latinoamericano de Automatizacion Bancaria",
        ubicacion: "Hollywood - Florida",
        fecha: ["Thursday, September 1, 2019","Friday, September 2, 2019","Saturday, September 3, 2019"],
        imagenPequena: "assets/images/clab_logo.png",
        imagenGrande: "assets/images/clab.png"
      ),
      EventosModel(
        titulo: "ASAMBLEA FELABAN 2020",
        descripcion: "Asamblea Anual\nFELABAN",
        ubicacion: "Guatemala",
        fecha: ["Thursday, September 1, 2019","Friday, September 2, 2019","Saturday, September 3, 2019"],
        imagenPequena: "assets/images/asamblea_felaban_logo.png",
        imagenGrande: "assets/images/asamblea_felaban.png"
      ),
      EventosModel(
        titulo: "CLAIN 2019",
        descripcion: "Congreso Latinoamericano de Auditoria Interna y Evaluación de Riesgos",
        ubicacion: "Hollywood - Florida",
        fecha: ["Thursday, September 1, 2019","Friday, September 2, 2019","Saturday, September 3, 2019"],
        imagenPequena: "assets/images/clain_logo.png",
        imagenGrande: "assets/images/clain.png"
      ),
    ];
  }


}