import 'dart:convert';

class CategoryModel {
  CategoryModel({
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

  factory CategoryModel.fromJson(String str) => CategoryModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CategoryModel.fromMap(Map<String, dynamic> json) => CategoryModel(
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
    "category": category,
    "date": date.toIso8601String(),
    "slug": slug,
    "__v": v,
    "image": image,
  };
}

