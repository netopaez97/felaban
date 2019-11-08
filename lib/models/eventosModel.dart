// To parse this JSON data, do
//
//     final eventosModel = eventosModelFromJson(jsonString);

import 'dart:convert';

EventosModel eventosModelFromJson(String str) => EventosModel.fromJson(json.decode(str));

String eventosModelToJson(EventosModel data) => json.encode(data.toJson());

class EventosModel {
    String titulo;
    String descripcion;
    String ubicacion;
    List<dynamic> fecha;
    String imagenPequena;
    String imagenGrande;

    EventosModel({
        this.titulo,
        this.descripcion,
        this.ubicacion,
        this.fecha,
        this.imagenPequena,
        this.imagenGrande,
    });

    factory EventosModel.fromJson(Map<String, dynamic> json) => EventosModel(
        titulo: json["titulo"],
        descripcion: json["descripcion"],
        ubicacion: json["ubicacion"],
        fecha: List<dynamic>.from(json["fecha"].map((x) => x)),
        imagenPequena: json["imagenPequena"],
        imagenGrande: json["imagenGrande"],
    );

    Map<String, dynamic> toJson() => {
        "titulo": titulo,
        "descripcion": descripcion,
        "ubicacion": ubicacion,
        "fecha": List<dynamic>.from(fecha.map((x) => x)),
        "imagenPequena": imagenPequena,
        "imagenGrande": imagenGrande,
    };
}
