// To parse this JSON data, do
//
//     final eventoEspecificoModel = eventoEspecificoModelFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/material.dart';

EventoEspecificoModel eventoEspecificoModelFromJson(String str) => EventoEspecificoModel.fromJson(json.decode(str));

String eventoEspecificoModelToJson(EventoEspecificoModel data) => json.encode(data.toJson());

class EventoEspecificoModel {
    String name;
    String place;
    String sponsor;
    bool favorite;
    String image;
    TimeOfDay time;

    EventoEspecificoModel({
        this.name,
        this.place,
        this.sponsor,
        this.favorite,
        this.image,
        this.time,
    });

    factory EventoEspecificoModel.fromJson(Map<String, dynamic> json) => EventoEspecificoModel(
        name: json["name"],
        place: json["place"],
        sponsor: json["sponsor"],
        favorite: json["favorite"],
        image: json["image"],
        time: json["time"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "place": place,
        "sponsor": sponsor,
        "favorite": favorite,
        "image": image,
        "time":time,
    };
}