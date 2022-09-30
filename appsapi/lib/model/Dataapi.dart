import 'dart:convert';

List<Productdata> productdataFromJson(String str) => List<Productdata>.from(
    json.decode(str).map((x) => Productdata.fromJson(x)));

String productdataToJson(List<Productdata> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Productdata {
  Productdata({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  int userId;
  int id;
  String title;
  String body;

  factory Productdata.fromJson(Map<String, dynamic> json) => Productdata(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };
}
