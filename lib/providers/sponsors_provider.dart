import 'package:felaban/models/sponsorModel.dart';
import 'package:flutter/material.dart';

class SponsorsProvider with ChangeNotifier {


  ///¡LEER!
  ///En este momento no es correcto colocar la variable favorito en el modelo Sponsor.
  ///puesto que un evento específico es favorito solo para UN usuario, no para todos.

  ///Evento general.
  SponsorModel _sponsorActual;
  ///Eventos felaban
  List<SponsorModel> _sponsors = [];
  ///Lista de eventos especificos favoritos para el usuario
  List<SponsorModel> _listaSponsorsFavoritos = [];

  get sponsorActual {
    return _sponsorActual;
  }
  get sponsors {
    return _sponsors;
  }
  get listasponsorsFavoritos {
    return _listaSponsorsFavoritos;
  }

  //Sponsor escogido por el usuario
  set sponsorActual( SponsorModel nuevoEveneto){
    this._sponsorActual = nuevoEveneto;

    notifyListeners();
  }
  //Editar lista de sponsors felaban
  set sponsors( List<SponsorModel> newSponsors){
    this._sponsors = newSponsors;
  }
  //Lista de sponsors especificos favoritos para el usuario
  set agregarSponsorAFavoritos(SponsorModel e){
    this._listaSponsorsFavoritos.add(e);

    notifyListeners();
  }

  set eliminarSponsorAFavoritos(SponsorModel e){
    this._listaSponsorsFavoritos.removeWhere((sponsorAEliminar) => sponsorAEliminar == e);

    notifyListeners();
  }

  set listaSponsorsFavoritos(List<SponsorModel> newListFavSpekers){
    this._listaSponsorsFavoritos = newListFavSpekers;

    notifyListeners();
  }

  List<SponsorModel> obtenerSponsorsFelaban(){

    List<SponsorModel> sponsors = [
      SponsorModel(
        imageLocation:"assets/images/sponsor2.png",
        name: "BAC Credomatic Guatemala",
        description:"Coca-Cola, conocida comúnmente como Coca en muchos países hispanohablantes (en inglés Coke) es una bebida gaseosa y refrescante, vendida a nivel mundial, en tiendas, restaurantes y máquinas expendedoras en más de doscientos países o territorios. Es un producto de The Coca-Cola Company. En un principio, cuando la inventó el farmacéutico John Pemberton, fue concebida como una bebida medicinal patentada.",
        favorite:false,
        location:"Room 220",
        type: "APP Sponsor",
      ),
      SponsorModel(
        imageLocation:"assets/sponsors/banrural.png",
        name: "BANRURAL",
        description:"Coca-Cola, conocida comúnmente como Coca en muchos países hispanohablantes (en inglés Coke) es una bebida gaseosa y refrescante, vendida a nivel mundial, en tiendas, restaurantes y máquinas expendedoras en más de doscientos países o territorios. Es un producto de The Coca-Cola Company. En un principio, cuando la inventó el farmacéutico John Pemberton, fue concebida como una bebida medicinal patentada.",
        favorite:false,
        location:"Booth 23",
        type: "Platinum Sponsor",
      ),
      SponsorModel(
        imageLocation:"assets/sponsors/bcie.png",
        name: "Banco Centroamericano de Integracion Economica",
        description:"Coca-Cola, conocida comúnmente como Coca en muchos países hispanohablantes (en inglés Coke) es una bebida gaseosa y refrescante, vendida a nivel mundial, en tiendas, restaurantes y máquinas expendedoras en más de doscientos países o territorios. Es un producto de The Coca-Cola Company. En un principio, cuando la inventó el farmacéutico John Pemberton, fue concebida como una bebida medicinal patentada.",
        favorite:false,
        location:"Booth 20",
        type: "Platinum Sponsor",
      ),
      SponsorModel(
        imageLocation:"assets/sponsors/febraban.png",
        name: "FEBRABAN Brasil",
        description:"Coca-Cola, conocida comúnmente como Coca en muchos países hispanohablantes (en inglés Coke) es una bebida gaseosa y refrescante, vendida a nivel mundial, en tiendas, restaurantes y máquinas expendedoras en más de doscientos países o territorios. Es un producto de The Coca-Cola Company. En un principio, cuando la inventó el farmacéutico John Pemberton, fue concebida como una bebida medicinal patentada.",
        favorite:false,
        location:"Booth 39",
        type: "Platinum Sponsor",
      ),
      SponsorModel(
        imageLocation:"assets/sponsors/bantrab.png",
        name: "BANTRAB",
        description:"Coca-Cola, conocida comúnmente como Coca en muchos países hispanohablantes (en inglés Coke) es una bebida gaseosa y refrescante, vendida a nivel mundial, en tiendas, restaurantes y máquinas expendedoras en más de doscientos países o territorios. Es un producto de The Coca-Cola Company. En un principio, cuando la inventó el farmacéutico John Pemberton, fue concebida como una bebida medicinal patentada.",
        favorite:false,
        location:"Booth 40",
        type: "Platinum Sponsor",
      ),
      SponsorModel(
        imageLocation:"assets/sponsors/banco_industrial.png",
        name: "Banco Industrial Panamá",
        description:"Coca-Cola, conocida comúnmente como Coca en muchos países hispanohablantes (en inglés Coke) es una bebida gaseosa y refrescante, vendida a nivel mundial, en tiendas, restaurantes y máquinas expendedoras en más de doscientos países o territorios. Es un producto de The Coca-Cola Company. En un principio, cuando la inventó el farmacéutico John Pemberton, fue concebida como una bebida medicinal patentada.",
        favorite:false,
        location:"Booth 02",
        type: "Silver Sponsors",
      ),
    ];

    sponsors.sort((a,b) {
      var adate = a.name.toString(); //before -> var adate = a.expiry;
      var bdate = b.name.toString(); //var bdate = b.expiry;
      return adate.compareTo(bdate);
    });
    
    return sponsors;
  }


}