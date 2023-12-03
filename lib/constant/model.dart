

import 'dart:convert';

List<DoctorList> doctorListFromJson(String str) => List<DoctorList>.from(json.decode(str).map((x) => DoctorList.fromJson(x)));

String doctorListToJson(List<DoctorList> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DoctorList {
    String id;
    String imageUrl;
    String name;
    String speciality;
    String rating;
    String description;
    String experience;
    String totalcheckup;

    DoctorList({
        required this.id,
        required this.imageUrl,
        required this.name,
        required this.speciality,
        required this.rating,
        required this.description,
        required this.experience,
        required this.totalcheckup,
    });

    factory DoctorList.fromJson(Map<String, dynamic> json) => DoctorList(
        id: json["_id"],
        imageUrl: json["imageUrl"],
        name: json["name"],
        speciality: json["speciality"],
        rating: json["rating"],
        description: json["description"],
        experience: json["experience"],
        totalcheckup: json["totalcheckup"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "imageUrl": imageUrl,
        "name": name,
        "speciality": speciality,
        "rating": rating,
        "description": description,
        "experience": experience,
        "totalcheckup": totalcheckup,
    };
}
