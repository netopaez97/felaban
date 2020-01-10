// To parse this JSON data, do
//
//     final sponsorModel = sponsorModelFromJson(jsonString);

import 'dart:convert';

SponsorModel sponsorModelFromJson(String str) => SponsorModel.fromJson(json.decode(str));

String sponsorModelToJson(SponsorModel data) => json.encode(data.toJson());

class SponsorModel {
    String imageLocation;
    String name;
    String description;
    bool favorite;
    String location;
    String type;

    SponsorModel({
        this.imageLocation,
        this.name,
        this.description,
        this.favorite,
        this.location,
        this.type,
    });

    factory SponsorModel.fromJson(Map<String, dynamic> json) => SponsorModel(
        imageLocation: json["imageLocation"],
        name: json["name"],
        description: json["description"],
        favorite: json["favorite"],
        location: json["location"],
        type: json["type"],
    );

    Map<String, dynamic> toJson() => {
        "imageLocation": imageLocation,
        "name": name,
        "description": description,
        "favorite": favorite,
        "location": location,
        "type": type,
    };
}
