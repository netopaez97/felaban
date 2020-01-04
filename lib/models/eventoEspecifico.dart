// To parse this JSON data, do
//
//     final eventoEspecifico = eventoEspecificoFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/material.dart';

EventoEspecifico eventoEspecificoFromJson(String str) => EventoEspecifico.fromJson(json.decode(str));

String eventoEspecificoToJson(EventoEspecifico data) => json.encode(data.toJson());

class EventoEspecifico {
    String name;
    String place;
    String sponsor;
    bool favorite;
    String image;
    TimeOfDay time;

    EventoEspecifico({
        this.name,
        this.place,
        this.sponsor,
        this.favorite,
        this.image,
        this.time,
    });

    factory EventoEspecifico.fromJson(Map<String, dynamic> json) => EventoEspecifico(
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