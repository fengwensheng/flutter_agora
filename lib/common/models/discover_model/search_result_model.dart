// To parse this JSON data, do
//
//     final searchResultModel = searchResultModelFromJson(jsonString);

import 'dart:convert';

SearchResultModel searchResultModelFromJson(String str) =>
    SearchResultModel.fromJson(json.decode(str));

String searchResultModelToJson(SearchResultModel data) =>
    json.encode(data.toJson());

class SearchResultModel {
  SearchResultModel({
    this.resultCount,
    this.results,
  });

  int? resultCount;
  List<Result>? results;

  factory SearchResultModel.fromJson(Map<String, dynamic> json) =>
      SearchResultModel(
        resultCount: json["resultCount"],
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "resultCount": resultCount,
        "results": List<dynamic>.from(results!.map((x) => x.toJson())),
      };
}

class Result {
  Result({
    this.wrapperType,
    this.kind,
    this.collectionId,
    this.trackId,
    this.artistName,
    this.collectionName,
    this.trackName,
    this.collectionCensoredName,
    this.trackCensoredName,
    this.collectionViewUrl,
    this.feedUrl,
    this.trackViewUrl,
    this.artworkUrl30,
    this.artworkUrl60,
    this.artworkUrl100,
    this.collectionPrice,
    this.trackPrice,
    this.trackRentalPrice,
    this.collectionHdPrice,
    this.trackHdPrice,
    this.trackHdRentalPrice,
    this.releaseDate,
    this.collectionExplicitness,
    this.trackExplicitness,
    this.trackCount,
    this.country,
    this.currency,
    this.primaryGenreName,
    this.contentAdvisoryRating,
    this.artworkUrl600,
    this.genreIds,
    this.genres,
    this.artistId,
    this.artistViewUrl,
  });

  String? wrapperType;
  String? kind;
  int? collectionId;
  int? trackId;
  String? artistName;
  String? collectionName;
  String? trackName;
  String? collectionCensoredName;
  String? trackCensoredName;
  String? collectionViewUrl;
  String? feedUrl;
  String? trackViewUrl;
  String? artworkUrl30;
  String? artworkUrl60;
  String? artworkUrl100;
  double? collectionPrice;
  double? trackPrice;
  int? trackRentalPrice;
  int? collectionHdPrice;
  int? trackHdPrice;
  int? trackHdRentalPrice;
  String? releaseDate;
  String? collectionExplicitness;
  String? trackExplicitness;
  int? trackCount;
  String? country;
  String? currency;
  String? primaryGenreName;
  String? contentAdvisoryRating;
  String? artworkUrl600;
  List<String>? genreIds;
  List<String>? genres;
  int? artistId;
  String? artistViewUrl;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        wrapperType: json["wrapperType"],
        kind: json["kind"],
        collectionId: json["collectionId"],
        trackId: json["trackId"],
        artistName: json["artistName"],
        collectionName: json["collectionName"],
        trackName: json["trackName"],
        collectionCensoredName: json["collectionCensoredName"],
        trackCensoredName: json["trackCensoredName"],
        collectionViewUrl: json["collectionViewUrl"],
        feedUrl: json["feedUrl"],
        trackViewUrl: json["trackViewUrl"],
        artworkUrl30: json["artworkUrl30"],
        artworkUrl60: json["artworkUrl60"],
        artworkUrl100: json["artworkUrl100"],
        collectionPrice: json["collectionPrice"],
        trackPrice: json["trackPrice"],
        trackRentalPrice: json["trackRentalPrice"],
        collectionHdPrice: json["collectionHdPrice"],
        trackHdPrice: json["trackHdPrice"],
        trackHdRentalPrice: json["trackHdRentalPrice"],
        releaseDate: json["releaseDate"],
        collectionExplicitness: json["collectionExplicitness"],
        trackExplicitness: json["trackExplicitness"],
        trackCount: json["trackCount"],
        country: json["country"],
        currency: json["currency"],
        primaryGenreName: json["primaryGenreName"],
        contentAdvisoryRating: json["contentAdvisoryRating"] == null
            ? null
            : json["contentAdvisoryRating"],
        artworkUrl600: json["artworkUrl600"],
        genreIds: List<String>.from(json["genreIds"].map((x) => x)),
        genres: List<String>.from(json["genres"].map((x) => x)),
        artistId: json["artistId"] == null ? null : json["artistId"],
        artistViewUrl:
            json["artistViewUrl"] == null ? null : json["artistViewUrl"],
      );

  Map<String, dynamic> toJson() => {
        "wrapperType": wrapperType,
        "kind": kind,
        "collectionId": collectionId,
        "trackId": trackId,
        "artistName": artistName,
        "collectionName": collectionName,
        "trackName": trackName,
        "collectionCensoredName": collectionCensoredName,
        "trackCensoredName": trackCensoredName,
        "collectionViewUrl": collectionViewUrl,
        "feedUrl": feedUrl,
        "trackViewUrl": trackViewUrl,
        "artworkUrl30": artworkUrl30,
        "artworkUrl60": artworkUrl60,
        "artworkUrl100": artworkUrl100,
        "collectionPrice": collectionPrice,
        "trackPrice": trackPrice,
        "trackRentalPrice": trackRentalPrice,
        "collectionHdPrice": collectionHdPrice,
        "trackHdPrice": trackHdPrice,
        "trackHdRentalPrice": trackHdRentalPrice,
        "releaseDate": releaseDate,
        "collectionExplicitness": collectionExplicitness,
        "trackExplicitness": trackExplicitness,
        "trackCount": trackCount,
        "country": country,
        "currency": currency,
        "primaryGenreName": primaryGenreName,
        "contentAdvisoryRating":
            contentAdvisoryRating == null ? null : contentAdvisoryRating,
        "artworkUrl600": artworkUrl600,
        "genreIds": List<dynamic>.from(genreIds!.map((x) => x)),
        "genres": List<dynamic>.from(genres!.map((x) => x)),
        "artistId": artistId == null ? null : artistId,
        "artistViewUrl": artistViewUrl == null ? null : artistViewUrl,
      };
}
