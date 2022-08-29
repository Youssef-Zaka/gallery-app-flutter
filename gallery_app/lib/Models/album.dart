
import 'dart:convert';

class Album {
  Album({
    this.userId,
    this.id,
    this.title,
  });

  int? userId;
  int? id;
  String? title;

  factory Album.fromJson(String str) => Album.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Album.fromMap(Map<String, dynamic> json) => Album(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
      );

  Map<String, dynamic> toMap() => {
        "userId": userId,
        "id": id,
        "title": title,
      };
}
