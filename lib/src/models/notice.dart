// To parse this JSON data, do
//
//     final notice = noticeFromJson(jsonString);

import 'dart:convert';

Notice noticeFromJson(String str) => Notice.fromJson(json.decode(str));

String noticeToJson(Notice data) => json.encode(data.toJson());

class Notice {
  Notice({
    required this.id,
    required this.title,
    required this.description,
    required this.time,
    required this.autor,
  });

  String id;
  String title;
  String description;
  String time;
  String autor;

  factory Notice.fromJson(Map<String, dynamic> json) => Notice(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        time: json["time"],
        autor: json["autor"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "time": time,
        "autor": autor,
      };
}
