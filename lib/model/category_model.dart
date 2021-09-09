
import 'dart:convert';

class CategoryModel {
  CategoryModel({
     required this.interests,
     required this.premium,
     required this.id,
     required this.name,
     required this.selection,
     required this.date,
     required this.slug,
     required this.v,
  });

  List<Interest> interests;
  bool premium;
  int id;
  String name;
  String selection;
  String date;
  String slug;
  int v;

  factory CategoryModel.fromJson(String str) => CategoryModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CategoryModel.fromMap(Map<String, dynamic> json) => CategoryModel(
    interests: List<Interest>.from(json["interests"].map((x) => Interest.fromMap(x))),
    premium: json["premium"],
    id: json["_id"],
    name: json["name"],
    selection: json["selection"],
    date: json["date"],
    slug: json["slug"],
    v: json["__v"],
  );

  Map<String, dynamic> toMap() => {
    "interests": List<dynamic>.from(interests.map((x) => x.toMap())),
    "premium": premium,
    "_id": id,
    "name": name,
    "selection": selection,
    "date": date,
    "slug": slug,
    "__v": v,
  };
}

class Interest {
  Interest({
     required this.flag,
     required this.id,
     required this.name,
     required this.category,
     required this.date,
     required this.slug,
     required this.v,
     required this.image,
  });

  bool flag;
  String id;
  String name;
  String category;
  DateTime date;
  String slug;
  int v;
  String image;

  factory Interest.fromJson(String str) => Interest.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Interest.fromMap(Map<String, dynamic> json) => Interest(
    flag: json["flag"],
    id: json["_id"],
    name: json["name"],
    category: json["category"],
    date: DateTime.parse(json["date"]),
    slug: json["slug"],
    v: json["__v"],
    image: json["image"],
  );

  Map<String, dynamic> toMap() => {
    "flag": flag,
    "_id": id,
    "name": name,
    "category":category,
    "date": date,
    "slug": slug,
    "__v": v,
    "image": image,
  };
}
