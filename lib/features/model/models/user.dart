import 'dart:convert';

AppUser userFromJson(String str) => AppUser.fromJson(json.decode(str));

String userToJson(AppUser data) => json.encode(data.toJson());

class AppUser {
    int id;
    String name;
    String email;
    String phone;
    String country;
    DateTime emailVerifiedAt;
    String hasLicense;
    DateTime createdAt;
    DateTime updatedAt;
    String isCompany;
    dynamic otp;
    String type;

    AppUser({
        required this.id,
        required this.name,
        required this.email,
        required this.phone,
        required this.country,
        required this.emailVerifiedAt,
        required this.hasLicense,
        required this.createdAt,
        required this.updatedAt,
        required this.isCompany,
        required this.otp,
        required this.type,
    });

    factory AppUser.fromJson(Map<String, dynamic> json) => AppUser(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        country: json["country"],
        emailVerifiedAt: DateTime.parse(json["email_verified_at"]),
        hasLicense: json["has_license"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        isCompany: json["is_company"],
        otp: json["otp"],
        type: json["type"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "phone": phone,
        "country": country,
        "email_verified_at": emailVerifiedAt.toIso8601String(),
        "has_license": hasLicense,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "is_company": isCompany,
        "otp": otp,
        "type": type,
    };
}
