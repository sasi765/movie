import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movies/Screen/home.dart';


class MovieEntity {
  String id;
  String title;
  String categories;
  String typeMovie;
  String year;
  String description;
  String country;
  String time;
  String trailer;
  List<ImageEntity> screenShots;
  ImageEntity screenShot;
  DateTime createdIn;
  DateTime modifiedIn;

  MovieEntity(
      {this.id,
      this.title = '',
      this.categories,
      this.year,
      this.description,
      this.time,
      this.country,
      this.trailer,
      this.typeMovie,
      this.screenShot,
      this.screenShots,
      this.createdIn,
      this.modifiedIn});

  MovieEntity.fromSnapshotJson(DocumentSnapshot snapshot)
      : this.id = snapshot.id,
        this.title = snapshot["Title"],
        this.trailer = snapshot["Trailer"],
        this.description = snapshot["Description"],
        this.typeMovie = snapshot["TypeMovie"],
        this.categories = snapshot["Categories"],
        this.year = snapshot["Year"],
        this.country = snapshot["Country"],
        this.screenShot = ImageEntity.fromMap(snapshot['ScreenShot']),
        this.screenShots =
            snapshot["ScreenShots"].map<ImageEntity>((item) {
          return ImageEntity.fromMap(item);
        }).toList(),
        this.createdIn = snapshot['CreatedIn'].toDate(),
        this.modifiedIn = snapshot['ModifiedIn'].toDate();

  static Map<String, dynamic> stringToMap(String s) {
    Map<String, dynamic> map = json.decode(s);
    return map;
  }

  toJson() {
    return {
      "Id": this.id,
      "Title": this.title,
      "Categories": this.categories,
      "Trailer": this.trailer,
      "Description": this.description,
      "Year": this.year,
      "TypeMovie": this.typeMovie,
      'ScreenShot':
          this.screenShot == null ? ImageEntity() : this.screenShot.toJson(),
      "Country": this.country,
      "ScreenShots": this.screenShots == null
          ? List<ImageEntity>()
          : this.screenShots.map((i) => i.toJson()).toList(),
      "CreatedIn": this.createdIn == null ? DateTime.now() : this.createdIn,
      "ModifiedIn": this.createdIn == null ? DateTime.now() : this.createdIn,
    };
  }
}