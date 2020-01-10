// To parse this JSON data, do
//
//     final exhibitorsModel = exhibitorsModelFromJson(jsonString);

import 'dart:convert';

ExhibitorsModel exhibitorsModelFromJson(String str) => ExhibitorsModel.fromJson(json.decode(str));

String exhibitorsModelToJson(ExhibitorsModel data) => json.encode(data.toJson());

class ExhibitorsModel {
    String name;
    String booth;
    String summary;
    String description;
    String imageLocation;
    bool favorite;

    ExhibitorsModel({
        this.name,
        this.booth,
        this.summary,
        this.description,
        this.imageLocation,
        this.favorite,
    });

    factory ExhibitorsModel.fromJson(Map<String, dynamic> json) => ExhibitorsModel(
        name: json["name"],
        booth: json["booth"],
        summary: json["summary"],
        description: json["description"],
        imageLocation: json["imageLocation"],
        favorite: json["favorite"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "booth": booth,
        "summary": summary,
        "description": description,
        "imageLocation": imageLocation,
        "favorite": favorite,
    };
}
