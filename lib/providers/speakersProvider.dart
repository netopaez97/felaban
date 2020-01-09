import 'package:felaban/models/speakersModel.dart';
import 'package:flutter/material.dart';

class SpeakersProvider with ChangeNotifier {


  ///¡LEER!
  ///En este momento no es correcto colocar la variable favorito en el modelo Speakers.
  ///puesto que un evento específico es favorito solo para UN usuario, no para todos.

  ///Evento general.
  SpeakersModel _speakerActual;
  ///Eventos felaban
  List<SpeakersModel> _speakers = [];
  ///Lista de eventos especificos favoritos para el usuario
  List<SpeakersModel> _listaSpeakersFavoritos = [];

  get speakerActual {
    return _speakerActual;
  }
  get speakers {
    return _speakers;
  }
  get listaSpeakersFavoritos {
    return _listaSpeakersFavoritos;
  }

  //Speaker escogido por el usuario
  set speakerActual( SpeakersModel nuevoEveneto){
    this._speakerActual = nuevoEveneto;

    notifyListeners();
  }
  //Editar lista de speakers felaban
  set speakers( List<SpeakersModel> newSpeakers){
    this._speakers = newSpeakers;
  }
  //Lista de speakers especificos favoritos para el usuario
  set agregarSpeakerAFavoritos(SpeakersModel e){
    this._listaSpeakersFavoritos.add(e);

    notifyListeners();
  }

  set eliminarSpeakerAFavoritos(SpeakersModel e){
    this._listaSpeakersFavoritos.removeWhere((speakerAEliminar) => speakerAEliminar == e);

    notifyListeners();
  }

  set listaSpeakersFavoritos(List<SpeakersModel> newListFavSpekers){
    this._listaSpeakersFavoritos = newListFavSpekers;

    notifyListeners();
  }

  List<SpeakersModel> obtenerSpeakersFelaban(){

    List<SpeakersModel> speakers = [
      SpeakersModel(
        imageLocation:"assets/speakers/liz_wiseman.png",
        name: "Liz Wiseman",
        cargo:"Executive Strategy and Leadership Consultant",
        favorite:false,
      ),
      SpeakersModel(
        imageLocation:"assets/speakers/matt_higgins.png",
        name: "Matt Higgins",
        cargo:"Co-founder and CEO RSE Ventures, Shark Tank Panelist",
        favorite:false,
      ),
      SpeakersModel(
        imageLocation:"assets/speakers/liz_wiseman.png",
        name: "Liz Wiseman",
        cargo:"Executive Strategy and Leadership Consultant",
        favorite:false,
      ),
      SpeakersModel(
        imageLocation:"assets/speakers/matt_higgins.png",
        name: "Matt Higgins",
        cargo:"Co-founder and CEO RSE Ventures, Shark Tank Panelist",
        favorite:false,
      ),
      SpeakersModel(
        imageLocation:"assets/speakers/liz_wiseman.png",
        name: "Liz Wiseman",
        cargo:"Executive Strategy and Leadership Consultant",
        favorite:false,
      ),
      SpeakersModel(
        imageLocation:"assets/speakers/matt_higgins.png",
        name: "Matt Higgins",
        cargo:"Co-founder and CEO RSE Ventures, Shark Tank Panelist",
        favorite:false,
      ),
      SpeakersModel(
        imageLocation:"assets/speakers/liz_wiseman.png",
        name: "Liz Wiseman",
        cargo:"Executive Strategy and Leadership Consultant",
        favorite:false,
      ),
      SpeakersModel(
        imageLocation:"assets/speakers/matt_higgins.png",
        name: "Matt Higgins",
        cargo:"Co-founder and CEO RSE Ventures, Shark Tank Panelist",
        favorite:false,
      ),
    ];

    speakers.sort((a,b) {
      var adate = a.name.toString(); //before -> var adate = a.expiry;
      var bdate = b.name.toString(); //var bdate = b.expiry;
      return adate.compareTo(bdate);
    });
    
    return speakers;
  }


}