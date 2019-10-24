import 'dart:convert';

EventosModel eventosModelFromJson(String str) => EventosModel.fromJson(json.decode(str));

String eventosModelToJson(EventosModel data) => json.encode(data.toJson());

class EventosModel {
    String titulo;
    String descripcion;
    String ubicacion;
    String fecha;
    String imagenUbicacion;

    EventosModel({
        this.titulo,
        this.descripcion,
        this.ubicacion,
        this.fecha,
        this.imagenUbicacion,
    });

    factory EventosModel.fromJson(Map<String, dynamic> json) => EventosModel(
        titulo: json["titulo"],
        descripcion: json["descripcion"],
        ubicacion: json["ubicacion"],
        fecha: json["fecha"],
        imagenUbicacion: json["imagenUbicacion"],
    );

    Map<String, dynamic> toJson() => {
        "titulo": titulo,
        "descripcion": descripcion,
        "ubicacion": ubicacion,
        "fecha": fecha,
        "imagenUbicacion": imagenUbicacion,
    };
}