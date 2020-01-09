// To parse this JSON data, do
//
//     final speakersModel = speakersModelFromJson(jsonString);

import 'dart:convert';

SpeakersModel speakersModelFromJson(String str) => SpeakersModel.fromJson(json.decode(str));

String speakersModelToJson(SpeakersModel data) => json.encode(data.toJson());

class SpeakersModel {
    String imageLocation;
    String name;
    String cargo;
    bool favorite;

    SpeakersModel({
        this.imageLocation,
        this.name,
        this.cargo,
        this.favorite,
    });

    factory SpeakersModel.fromJson(Map<String, dynamic> json) => SpeakersModel(
        imageLocation: json["imageLocation"],
        name: json["name"],
        cargo: json["cargo"],
        favorite: json["favorite"]
    );

    Map<String, dynamic> toJson() => {
        "imageLocation": imageLocation,
        "name": name,
        "cargo": cargo,
        "favorite": favorite,
    };
}
