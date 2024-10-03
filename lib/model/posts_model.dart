// To parse this JSON data, do
//
//     final postsModel = postsModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

PostsModel postsModelFromJson(String str) => PostsModel.fromJson(json.decode(str));

String postsModelToJson(PostsModel data) => json.encode(data.toJson());

class PostsModel {
  String message;
  Data data;

  PostsModel({
    required this.message,
    required this.data,
  });

  factory PostsModel.fromJson(Map<String, dynamic> json) => PostsModel(
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  int currentPage;
  int totalPages;
  List<Event> events;

  Data({
    required this.currentPage,
    required this.totalPages,
    required this.events,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    currentPage: json["currentPage"],
    totalPages: json["totalPages"],
    events: List<Event>.from(json["events"].map((x) => Event.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "currentPage": currentPage,
    "totalPages": totalPages,
    "events": List<dynamic>.from(events.map((x) => x.toJson())),
  };
}

class Event {
  EventLocation eventLocation;
  String id;
  User user;
  String description;
  String title;
  List<String> images;
  List<String> likedUsers;
  List<dynamic> comments;
  List<String> eventCategory;
  DateTime eventStartAt;
  DateTime eventEndAt;
  bool registrationRequired;
  List<String> keywords;
  List<dynamic> hashTags;
  List<String> registration;
  int likes;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  Event({
    required this.eventLocation,
    required this.id,
    required this.user,
    required this.description,
    required this.title,
    required this.images,
    required this.likedUsers,
    required this.comments,
    required this.eventCategory,
    required this.eventStartAt,
    required this.eventEndAt,
    required this.registrationRequired,
    required this.keywords,
    required this.hashTags,
    required this.registration,
    required this.likes,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory Event.fromJson(Map<String, dynamic> json) => Event(
    eventLocation: EventLocation.fromJson(json["eventLocation"]),
    id: json["_id"],
    user: User.fromJson(json["user"]),
    description: json["description"],
    title: json["title"],
    images: List<String>.from(json["images"].map((x) => x)),
    likedUsers: List<String>.from(json["likedUsers"].map((x) => x)),
    comments: List<dynamic>.from(json["comments"].map((x) => x)),
    eventCategory: List<String>.from(json["eventCategory"].map((x) => x)),
    eventStartAt: DateTime.parse(json["eventStartAt"]),
    eventEndAt: DateTime.parse(json["eventEndAt"]),
    registrationRequired: json["registrationRequired"],
    keywords: List<String>.from(json["keywords"].map((x) => x)),
    hashTags: List<dynamic>.from(json["hashTags"].map((x) => x)),
    registration: List<String>.from(json["registration"].map((x) => x)),
    likes: json["likes"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "eventLocation": eventLocation.toJson(),
    "_id": id,
    "user": user.toJson(),
    "description": description,
    "title": title,
    "images": List<dynamic>.from(images.map((x) => x)),
    "likedUsers": List<dynamic>.from(likedUsers.map((x) => x)),
    "comments": List<dynamic>.from(comments.map((x) => x)),
    "eventCategory": List<dynamic>.from(eventCategory.map((x) => x)),
    "eventStartAt": eventStartAt.toIso8601String(),
    "eventEndAt": eventEndAt.toIso8601String(),
    "registrationRequired": registrationRequired,
    "keywords": List<dynamic>.from(keywords.map((x) => x)),
    "hashTags": List<dynamic>.from(hashTags.map((x) => x)),
    "registration": List<dynamic>.from(registration.map((x) => x)),
    "likes": likes,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
  };
}

class EventLocation {
  List<double> coordinates;

  EventLocation({
    required this.coordinates,
  });

  factory EventLocation.fromJson(Map<String, dynamic> json) => EventLocation(
    coordinates: List<double>.from(json["coordinates"].map((x) => x?.toDouble())),
  );

  Map<String, dynamic> toJson() => {
    "coordinates": List<dynamic>.from(coordinates.map((x) => x)),
  };
}

class User {
  String id;
  String firstName;
  String lastName;
  bool isVerified;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.isVerified,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["_id"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    isVerified: json["isVerified"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "firstName": firstName,
    "lastName": lastName,
    "isVerified": isVerified,
  };
}
