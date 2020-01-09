// To parse this JSON data, do
//
//     final attendeesModel = attendeesModelFromJson(jsonString);

import 'dart:convert';

AttendeesModel attendeesModelFromJson(String str) => AttendeesModel.fromJson(json.decode(str));

String attendeesModelToJson(AttendeesModel data) => json.encode(data.toJson());

class AttendeesModel {
    int id;
    String name;
    String position;
    String imageLocation;
    String company;
    bool favorite;

    AttendeesModel({
        this.id,
        this.name,
        this.position,
        this.imageLocation,
        this.company,
        this.favorite,
    });

    factory AttendeesModel.fromJson(Map<String, dynamic> json) => AttendeesModel(
        id: json["id"],
        name: json["name"],
        position: json["position"],
        imageLocation: json["imageLocation"],
        company: json["company"],
        favorite: json["favorite"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "position": position,
        "imageLocation": imageLocation,
        "company": company,
        "favorite": favorite,
    };
}
