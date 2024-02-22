// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonString);

import 'dart:convert';

ProfileModel profileModelFromJson(String str) => ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
    final String? phone;
    final String? name;
    final String? email;

    ProfileModel({
        this.phone,
        this.name,
        this.email,
    });

    ProfileModel copyWith({
        String? phone,
        String? name,
        String? email,
    }) => 
        ProfileModel(
            phone: phone ?? this.phone,
            name: name ?? this.name,
            email: email ?? this.email,
        );

    factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        phone: json["phone"],
        name: json["name"],
        email: json["email"],
    );

    Map<String, dynamic> toJson() => {
        "phone": phone,
        "name": name,
        "email": email,
    };
}
