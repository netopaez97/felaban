import 'package:felaban/models/exhibitorModel.dart';
import 'package:flutter/material.dart';

class ExhibitorProvider with ChangeNotifier {


  ///¡LEER!
  ///En este momento no es correcto colocar la variable favorito en el modelo Exhibitors.
  ///puesto que un evento específico es favorito solo para UN usuario, no para todos.

  ///Evento general.
  ExhibitorsModel _exhibitorActual;
  ///Eventos felaban
  List<ExhibitorsModel> _exhibitors = [];
  ///Lista de eventos especificos favoritos para el usuario
  List<ExhibitorsModel> _listaExhibitorsFavoritos = [];

  get exhibitorActual {
    return _exhibitorActual;
  }
  get exhibitors {
    return _exhibitors;
  }
  get listaExhibitorsFavoritos {
    return _listaExhibitorsFavoritos;
  }

  //Exhibitor escogido por el usuario
  set exhibitorActual( ExhibitorsModel nuevoEveneto){
    this._exhibitorActual = nuevoEveneto;

    notifyListeners();
  }
  //Editar lista de exhibitors felaban
  set exhibitors( List<ExhibitorsModel> newExhibitors){
    this._exhibitors = newExhibitors;
  }
  //Lista de exhibitors especificos favoritos para el usuario
  set agregarExhibitorAFavoritos(ExhibitorsModel e){
    this._listaExhibitorsFavoritos.add(e);

    notifyListeners();
  }

  set eliminarExhibitorAFavoritos(ExhibitorsModel e){
    this._listaExhibitorsFavoritos.removeWhere((exhibitorAEliminar) => exhibitorAEliminar == e);

    notifyListeners();
  }

  set listaExhibitorsFavoritos(List<ExhibitorsModel> newListFavSpekers){
    this._listaExhibitorsFavoritos = newListFavSpekers;

    notifyListeners();
  }

  List<ExhibitorsModel> obtenerExhibitorsFelaban(){

    List<ExhibitorsModel> exhibitors = [
      ExhibitorsModel(
        name:"LUXWORX - MACVAD GROUP",
        booth: "108",
        summary: "Smart-repair™ products that make your life easier.",
        description: "Coca-Cola, conocida comúnmente como Coca en muchos países hispanohablantes (en inglés Coke) es una bebida gaseosa y refrescante, vendida a nivel mundial, en tiendas, restaurantes y máquinas expendedoras en más de doscientos países o territorios. Es un producto de The Coca-Cola Company. En un principio, cuando la inventó el farmacéutico John Pemberton, fue concebida como una bebida medicinal patentada.",
        imageLocation: "assets/exhibitors/lda_technologies.png",
        favorite: false,
      ),
      ExhibitorsModel(
        name:"LDA International",
        booth: "209",
        summary: "Batteries, Home Hardware, Face Masks, Closeouts",
        description: "Coca-Cola, conocida comúnmente como Coca en muchos países hispanohablantes (en inglés Coke) es una bebida gaseosa y refrescante, vendida a nivel mundial, en tiendas, restaurantes y máquinas expendedoras en más de doscientos países o territorios. Es un producto de The Coca-Cola Company. En un principio, cuando la inventó el farmacéutico John Pemberton, fue concebida como una bebida medicinal patentada.",
        imageLocation: "assets/exhibitors/lda_technologies.png",
        favorite: false,
      ),
      ExhibitorsModel(
        name:"MDA International",
        booth: "209",
        summary: "Batteries, Home Hardware, Face Masks, Closeouts",
        description: "Coca-Cola, conocida comúnmente como Coca en muchos países hispanohablantes (en inglés Coke) es una bebida gaseosa y refrescante, vendida a nivel mundial, en tiendas, restaurantes y máquinas expendedoras en más de doscientos países o territorios. Es un producto de The Coca-Cola Company. En un principio, cuando la inventó el farmacéutico John Pemberton, fue concebida como una bebida medicinal patentada.",
        imageLocation: "assets/exhibitors/lda_technologies.png",
        favorite: false,
      ),
      ExhibitorsModel(
        name:"NDA International",
        booth: "209",
        summary: "Batteries, Home Hardware, Face Masks, Closeouts",
        description: "Coca-Cola, conocida comúnmente como Coca en muchos países hispanohablantes (en inglés Coke) es una bebida gaseosa y refrescante, vendida a nivel mundial, en tiendas, restaurantes y máquinas expendedoras en más de doscientos países o territorios. Es un producto de The Coca-Cola Company. En un principio, cuando la inventó el farmacéutico John Pemberton, fue concebida como una bebida medicinal patentada.",
        imageLocation: "assets/exhibitors/lda_technologies.png",
        favorite: false,
      ),
      ExhibitorsModel(
        name:"LDA International",
        booth: "209",
        summary: "Batteries, Home Hardware, Face Masks, Closeouts",
        description: "Coca-Cola, conocida comúnmente como Coca en muchos países hispanohablantes (en inglés Coke) es una bebida gaseosa y refrescante, vendida a nivel mundial, en tiendas, restaurantes y máquinas expendedoras en más de doscientos países o territorios. Es un producto de The Coca-Cola Company. En un principio, cuando la inventó el farmacéutico John Pemberton, fue concebida como una bebida medicinal patentada.",
        imageLocation: "assets/exhibitors/lda_technologies.png",
        favorite: false,
      ),
    ];

    exhibitors.sort((a,b) {
      var adate = a.name.toString(); //before -> var adate = a.expiry;
      var bdate = b.name.toString(); //var bdate = b.expiry;
      return adate.compareTo(bdate);
    });
    
    return exhibitors;
  }


}