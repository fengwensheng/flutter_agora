// To parse this JSON data, do
//
//     final audioBarModel = audioBarModelFromJson(jsonString);

import 'dart:convert';

AudioBarModel audioBarModelFromJson(String str) =>
    AudioBarModel.fromJson(json.decode(str));

String audioBarModelToJson(AudioBarModel data) => json.encode(data.toJson());

class AudioBarModel {
  AudioBarModel({
    this.image,
    this.url,
  });

  String? image;
  String? url;

  factory AudioBarModel.fromJson(Map<String, dynamic> json) => AudioBarModel(
        image: json["image"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "url": url,
      };
}
