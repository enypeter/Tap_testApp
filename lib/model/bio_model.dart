import 'dart:convert';

class BioModel {
  BioModel({
     required this.location,
     required this.name,
     required this.profilePicture,
     required this.gender,
     required this.age,
     required this.socketId,
     required this.friendshipSocketId,
     required this.bio,
     required this.customerId,
     required this.subscriptionId,
     required this.instagram,
     required this.isBoosted,
     required this.bioModelBreak,
     required this.count,
     required this.boostExp,
     required this.boostPaid,
     required this.premiumExp,
     required this.isGlobal,
     required this.isDating,
     required this.jobTitle,
     required this.likes,
     required this.friendshipLikes,
     required this.friendshipDislikes,
     required this.blocked,
     required this.dislikes,
     required this.interests,
     required this.isPremium,
     required this.currency,
     required this.id,
     required this.user,
     required this.birthday,
     required this.photos,
     required this.filters,
     required this.basicInfo,
     required this.preference,
     required this.date,
     required this.v,
     required this.media,
     required this.bioModelId,
  });

  Location location;
  String name;
  String profilePicture;
  String gender;
  int age;
  String socketId;
  String friendshipSocketId;
  String bio;
  String customerId;
  String subscriptionId;
  List<dynamic> instagram;
  bool isBoosted;
  bool bioModelBreak;
  int count;
  DateTime boostExp;
  bool boostPaid;
  DateTime premiumExp;
  bool isGlobal;
  bool isDating;
  String jobTitle;
  List<dynamic> likes;
  List<dynamic> friendshipLikes;
  List<dynamic> friendshipDislikes;
  List<dynamic> blocked;
  List<dynamic> dislikes;
  List<Interest> interests;
  bool isPremium;
  String currency;
  String id;
  String user;
  DateTime birthday;
  List<Photo> photos;
  List<Filter> filters;
  List<BasicInfo> basicInfo;
  List<dynamic> preference;
  DateTime date;
  int v;
  List<Media> media;
  String bioModelId;

  factory BioModel.fromJson(String str) => BioModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory BioModel.fromMap(Map<String, dynamic> json) => BioModel(
    location: Location.fromMap(json["location"]),
    name: json["name"],
    profilePicture: json["profile_picture"],
    gender: json["gender"],
    age: json["age"],
    socketId: json["socket_id"],
    friendshipSocketId: json["friendship_socket_id"],
    bio: json["bio"],
    customerId: json["customer_id"],
    subscriptionId: json["subscription_id"],
    instagram: List<dynamic>.from(json["instagram"].map((x) => x)),
    isBoosted: json["is_boosted"],
    bioModelBreak: json["break"],
    count: json["count"],
    boostExp: DateTime.parse(json["boost_exp"]),
    boostPaid: json["boost_paid"],
    premiumExp: DateTime.parse(json["premium_exp"]),
    isGlobal: json["is_global"],
    isDating: json["is_dating"],
    jobTitle: json["job_title"],
    likes: List<dynamic>.from(json["likes"].map((x) => x)),
    friendshipLikes: List<dynamic>.from(json["friendship_likes"].map((x) => x)),
    friendshipDislikes: List<dynamic>.from(json["friendship_dislikes"].map((x) => x)),
    blocked: List<dynamic>.from(json["blocked"].map((x) => x)),
    dislikes: List<dynamic>.from(json["dislikes"].map((x) => x)),
    interests: List<Interest>.from(json["interests"].map((x) => Interest.fromMap(x))),
    isPremium: json["is_premium"],
    currency: json["currency"],
    id: json["_id"],
    user: json["user"],
    birthday: DateTime.parse(json["birthday"]),
    photos: List<Photo>.from(json["photos"].map((x) => Photo.fromMap(x))),
    filters: List<Filter>.from(json["filters"].map((x) => Filter.fromMap(x))),
    basicInfo: List<BasicInfo>.from(json["basic_info"].map((x) => BasicInfo.fromMap(x))),
    preference: List<dynamic>.from(json["preference"].map((x) => x)),
    date: DateTime.parse(json["date"]),
    v: json["__v"],
    media: List<Media>.from(json["media"].map((x) => Media.fromMap(x))),
    bioModelId: json["id"],
  );

  Map<String, dynamic> toMap() => {
    "location": location.toMap(),
    "name": name,
    "profile_picture": profilePicture,
    "gender": gender,
    "age": age,
    "socket_id": socketId,
    "friendship_socket_id": friendshipSocketId,
    "bio": bio,
    "customer_id": customerId,
    "subscription_id": subscriptionId,
    "instagram": List<dynamic>.from(instagram.map((x) => x)),
    "is_boosted": isBoosted,
    "break": bioModelBreak,
    "count": count,
    "boost_exp": boostExp.toIso8601String(),
    "boost_paid": boostPaid,
    "premium_exp": premiumExp.toIso8601String(),
    "is_global": isGlobal,
    "is_dating": isDating,
    "job_title": jobTitle,
    "likes": List<dynamic>.from(likes.map((x) => x)),
    "friendship_likes": List<dynamic>.from(friendshipLikes.map((x) => x)),
    "friendship_dislikes": List<dynamic>.from(friendshipDislikes.map((x) => x)),
    "blocked": List<dynamic>.from(blocked.map((x) => x)),
    "dislikes": List<dynamic>.from(dislikes.map((x) => x)),
    "interests": List<dynamic>.from(interests.map((x) => x.toMap())),
    "is_premium": isPremium,
    "currency": currency,
    "_id": id,
    "user": user,
    "birthday": birthday.toIso8601String(),
    "photos": List<dynamic>.from(photos.map((x) => x.toMap())),
    "filters": List<dynamic>.from(filters.map((x) => x.toMap())),
    "basic_info": List<dynamic>.from(basicInfo.map((x) => x.toMap())),
    "preference": List<dynamic>.from(preference.map((x) => x)),
    "date": date.toIso8601String(),
    "__v": v,
    "media": List<dynamic>.from(media.map((x) => x.toMap())),
    "id": bioModelId,
  };
}

class BasicInfo {
  BasicInfo({
     required this.premium,
     required this.id,
     required this.key,
     required this.value,
  });

  bool premium;
  String id;
  BasicInfoKey key;
  String value;

  factory BasicInfo.fromJson(String str) => BasicInfo.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory BasicInfo.fromMap(Map<String, dynamic> json) => BasicInfo(
    premium: json["premium"],
    id: json["_id"],
    key: BasicInfoKey.fromMap(json["key"]),
    value: json["value"],
  );

  Map<String, dynamic> toMap() => {
    "premium": premium,
    "_id": id,
    "key": key.toMap(),
    "value": value,
  };
}

class BasicInfoKey {
  BasicInfoKey({
     required this.id,
     required this.name,
     required this.selection,
  });

  String id;
  String name;
  String selection;

  factory BasicInfoKey.fromJson(String str) => BasicInfoKey.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory BasicInfoKey.fromMap(Map<String, dynamic> json) => BasicInfoKey(
    id: json["_id"],
    name: json["name"],
    selection: json["selection"],
  );

  Map<String, dynamic> toMap() => {
    "_id": id,
    "name": name,
    "selection": selection,
  };
}

class Filter {
  Filter({
     required this.premium,
     required this.id,
     required this.key,
     required this.value,
     required this.type,
     required this.selection,
     required this.range,
  });

  bool premium;
  String id;
  CategoryClass key;
  String value;
  String type;
  String selection;
  String range;

  factory Filter.fromJson(String str) => Filter.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Filter.fromMap(Map<String, dynamic> json) => Filter(
    premium: json["premium"],
    id: json["_id"],
    key: CategoryClass.fromMap(json["key"]),
    value: json["value"],
    type: json["type"],
    selection: json["selection"],
    range: json["range"],
  );

  Map<String, dynamic> toMap() => {
    "premium": premium,
    "_id": id,
    "key": key.toMap(),
    "value": value,
    "type": type,
    "selection": selection,
    "range": range,
  };
}

class CategoryClass {
  CategoryClass({
     required this.id,
     required this.name,
  });

  String id;
  String name;

  factory CategoryClass.fromJson(String str) => CategoryClass.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CategoryClass.fromMap(Map<String, dynamic> json) => CategoryClass(
    id: json["_id"],
    name: json["name"],
  );

  Map<String, dynamic> toMap() => {
    "_id": id,
    "name": name,
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
  CategoryClass category;
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
    category: CategoryClass.fromMap(json["category"]),
    date: DateTime.parse(json["date"]),
    slug: json["slug"],
    v: json["__v"],
    image: json["image"],
  );

  Map<String, dynamic> toMap() => {
    "flag": flag,
    "_id": id,
    "name": name,
    "category": category.toMap(),
    "date": date.toIso8601String(),
    "slug": slug,
    "__v": v,
    "image": image,
  };
}

class Location {
  Location({
     required this.type,
     required this.coordinates,
  });

  String type;
  List<double> coordinates;

  factory Location.fromJson(String str) => Location.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Location.fromMap(Map<String, dynamic> json) => Location(
    type: json["type"],
    coordinates: List<double>.from(json["coordinates"].map((x) => x.toDouble())),
  );

  Map<String, dynamic> toMap() => {
    "type": type,
    "coordinates": List<dynamic>.from(coordinates.map((x) => x)),
  };
}

class Media {
  Media({
     required this.question,
     required this.isVideo,
     required this.id,
     required this.user,
     required this.video,
     required this.date,
     required this.v,
     required this.filename,
     required this.comment,
     required this.index,
  });

  List<Question> question;
  bool isVideo;
  String id;
  String user;
  String video;
  DateTime date;
  int v;
  String filename;
  String comment;
  int index;

  factory Media.fromJson(String str) => Media.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Media.fromMap(Map<String, dynamic> json) => Media(
    question:  List<Question>.from(json["question"].map((x) => Question.fromMap(x))),
    isVideo: json["is_video"],
    id: json["_id"],
    user: json["user"] ,
    video: json["video"],
    date: json["date"],
    v:json["__v"],
    filename: json["filename"] ,
    comment: json["comment"],
    index: json["index"],
  );

  Map<String, dynamic> toMap() => {
    "question": List<dynamic>.from(question.map((x) => x.toMap())),
    "is_video": isVideo,
    "_id": id,
    "user": user,
    "video": video ,
    "date": date,
    "__v": v,
    "filename": filename,
    "comment": comment,
    "index": index,
  };
}

class Question {
  Question({
     required this.flag,
     required this.id,
     required this.name,
     required this.category,
     required this.date,
     required this.slug,
     required this.v,
  });

  bool flag;
  String id;
  String name;
  String category;
  DateTime date;
  String slug;
  int v;

  factory Question.fromJson(String str) => Question.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Question.fromMap(Map<String, dynamic> json) => Question(
    flag: json["flag"],
    id: json["_id"],
    name: json["name"],
    category: json["category"],
    date: DateTime.parse(json["date"]),
    slug: json["slug"],
    v: json["__v"],
  );

  Map<String, dynamic> toMap() => {
    "flag": flag,
    "_id": id,
    "name": name,
    "category": category,
    "date": date.toIso8601String(),
    "slug": slug,
    "__v": v,
  };
}

class Photo {
  Photo({
     required this.filename,
     required this.comment,
     required this.index,
     required this.isVideo,
     required this.id,
  });

  String filename;
  String comment;
  int index;
  bool isVideo;
  String id;

  factory Photo.fromJson(String str) => Photo.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Photo.fromMap(Map<String, dynamic> json) => Photo(
    filename: json["filename"],
    comment: json["comment"],
    index: json["index"],
    isVideo: json["is_video"],
    id: json["_id"],
  );

  Map<String, dynamic> toMap() => {
    "filename": filename,
    "comment": comment,
    "index": index,
    "is_video": isVideo,
    "_id": id,
  };
}
