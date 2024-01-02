import 'dart:convert';

class UserModel {
  final int no;
  final String fullName;
  final String address;
  final String country;
  final String companyName;
  final String imageUrl;

  UserModel({
    required this.no,
    required this.fullName,
    required this.address,
    required this.country,
    required this.companyName,
    required this.imageUrl,
  });

  factory UserModel.fromRawJson(String str) =>
      UserModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        no: json["no"],
        fullName: json["full_name"],
        address: json["address"],
        country: json["country"],
        companyName: json["company_name"],
        imageUrl: json["image_url"],
      );

  Map<String, dynamic> toJson() => {
        "no": no,
        "full_name": fullName,
        "address": address,
        "country": country,
        "company_name": companyName,
        "image_url": imageUrl,
      };
}
