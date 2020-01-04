// To parse this JSON data, do
//
//     final eventosModel = eventosModelFromJson(jsonString);

import 'dart:convert';

import 'package:felaban/models/eventoEspecifico.dart';

EventosModel eventosModelFromJson(String str) => EventosModel.fromJson(json.decode(str));

String eventosModelToJson(EventosModel data) => json.encode(data.toJson());

class EventosModel {
    String titulo;
    String descripcion;
    String ubicacion;
    List<dynamic> fecha;
    String imagenPequena;
    String imagenGrande;
    List<EventoEspecifico> agenda;

    EventosModel({
        this.titulo,
        this.descripcion,
        this.ubicacion,
        this.fecha,
        this.imagenPequena,
        this.imagenGrande,
        this.agenda,
    });

    factory EventosModel.fromJson(Map<String, dynamic> json) => EventosModel(
        titulo: json["titulo"],
        descripcion: json["descripcion"],
        ubicacion: json["ubicacion"],
        fecha: List<dynamic>.from(json["fecha"].map((x) => x)),
        imagenPequena: json["imagenPequena"],
        imagenGrande: json["imagenGrande"],
        agenda: List<dynamic>.from(json["agenda"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "titulo": titulo,
        "descripcion": descripcion,
        "ubicacion": ubicacion,
        "fecha": List<dynamic>.from(fecha.map((x) => x)),
        "imagenPequena": imagenPequena,
        "imagenGrande": imagenGrande,
        "agenda": List<dynamic>.from(agenda.map((x) => x)),
    };
}
