import 'package:felaban/models/attendeesModel.dart';
import 'package:flutter/material.dart';

class AttendeesProvider with ChangeNotifier {

  ///Attendee actual.
  AttendeesModel _attendeeActual;
  ///Lista de attendees
  List<AttendeesModel> _listAttendees;
  ///Lista de asistentes favoritos para el usuario
  List<AttendeesModel> _listaAttendeesFavoritos = [];

  get attendeeActual {
    return _attendeeActual;
  }
  get attendees {
    return _listAttendees;
  }
  get listaAttendeesFavoritos {
    return _listaAttendeesFavoritos;
  }

  //Attendee escogido por el usuario
  set attendeeActual( AttendeesModel nuevoAttendee){
    this._attendeeActual = nuevoAttendee;

    notifyListeners();
  }
  ///Editar la lista de attendees
  set attendees( List<AttendeesModel> newAttendees){
    this._listAttendees = newAttendees;
  }
  //Agregar asistentes favoritos para el usuario
  set agregarAttendeeAFavoritos(AttendeesModel a){
    this._listaAttendeesFavoritos.add(a);

    notifyListeners();
  }

  set listaAttendeesFavoritos(List<AttendeesModel> newListFavAttendees){
    this._listaAttendeesFavoritos = newListFavAttendees;

    notifyListeners();
  }

  //Eliminar asistentes favoritos para el usuario
  set eliminarAttendeeAFavoritos(AttendeesModel a){
    this._listaAttendeesFavoritos.removeWhere((attendeeAEliminar) => attendeeAEliminar == a);

    notifyListeners();
  }

  List<AttendeesModel> obtenerAttendeesFelaban(){

    List<AttendeesModel> attendees = [
      AttendeesModel(
        id:1,
        name:"Liz Wiseman",
        position:"CTO Cocacola",
        imageLocation:"assets/speakers/liz_wiseman.png",
        company:"Oracle",
        favorite: false,
      ),
      AttendeesModel(
        id:2,
        name:"Zal Wiseman",
        position:"CTA Cocacola",
        imageLocation:"assets/speakers/liz_wiseman.png",
        company:"Amazon",
        favorite: false,
      ),
      AttendeesModel(
        id:3,
        name:"Hiz Wiseman",
        position:"CTB Cocacola",
        imageLocation:"assets/speakers/liz_wiseman.png",
        company:"Kubilabs",
        favorite: false,
      ),
      AttendeesModel(
        id:4,
        name:"Bal Wiseman",
        position:"CTC Cocacola",
        imageLocation:"assets/speakers/liz_wiseman.png",
        company:"Felaban",
        favorite: false,
      ),
      AttendeesModel(
        id:5,
        name:"Bal Wiseman",
        position:"CTD Cocacola",
        imageLocation:"assets/speakers/liz_wiseman.png",
        company:"Acciona",
        favorite: false,
      ),
      AttendeesModel(
        id:6,
        name:"Liz Wiseman",
        position:"CTD Cocacola",
        imageLocation:"assets/speakers/liz_wiseman.png",
        company:"Acciona",
        favorite: false,
      ),
      AttendeesModel(
        id:7,
        name:"Liz Wiseman",
        position:"CTD Cocacola",
        imageLocation:"assets/speakers/liz_wiseman.png",
        company:"Acciona",
        favorite: false,
      ),
      AttendeesModel(
        id:8,
        name:"Liz Wiseman",
        position:"CTF Cocacola",
        imageLocation:"assets/speakers/liz_wiseman.png",
        company:"Bucaramanga",
        favorite: false,
      ),
    ];

    attendees.sort((a, b) {
      return a.company.toString().compareTo(b.company.toString());
    });
    
    _listAttendees = attendees;
    
    return attendees;
  }


}