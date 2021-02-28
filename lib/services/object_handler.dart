import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';
import 'package:watch_list_tracker/services/file_handler.dart';

class ObjectHandler {
  List<DObject> objects;
  Future<List<DObject>> getObjects() async {
    // final fileHandler = new FileHandler();
    // mockdata.forEach(
    //   (element) async {
    //       final path = await fileHandler.localPath;
    //       String filePath = '/' + Uuid().v4() + '.jpg';
    //       File file= await (Image.asset(element.imageAddress) as File).copy(path + filePath);
    //       element.imageAddress=file.path;
    //   },
    // );
    final prefs = await SharedPreferences.getInstance();
    // prefs.clear();
    String res = prefs.getString('DObjects');
    if (res != null) {
      final List<DObject> data = DObject.decode(res);
      objects = data;
      return data;
    } else {
      String data = DObject.encode(mockdata);
      await prefs.setString('DObjects', data);
      objects = mockdata;
      return mockdata;
    }
  }

  Future<List<DObject>> updateObject(DObject object) async {
    final prefs = await SharedPreferences.getInstance();
    objects.forEach((element) {
      if (element.id == object.id) {
        element = object;
      }
    });
    saveObjects();
    return objects;
  }

  Future<List<DObject>> deleteObject(DObject object) async {
    final prefs = await SharedPreferences.getInstance();
    objects.remove(objects);
    saveObjects();
    return objects;
  }

  void saveObjects() async {
    final prefs = await SharedPreferences.getInstance();
    String data = DObject.encode(objects);
    await prefs.setString('DObjects', data);
  }
}

class DObject {
  final String id;
  String title;
  String subtitle;
  String desc;
  String imageAddress;
  bool favorite;
  int episodes;
  String lastModifiedTime;
  DObject({
    this.id,
    this.title,
    this.subtitle,
    this.desc,
    this.imageAddress,
    this.favorite,
    this.episodes,
    this.lastModifiedTime,
  });

  factory DObject.fromJson(Map<String, dynamic> parsedJson) {
    return new DObject(
        id: parsedJson['id'] ?? "",
        title: parsedJson['title'] ?? "",
        subtitle: parsedJson['subtitle'] ?? "",
        desc: parsedJson['desc'] ?? "",
        imageAddress: parsedJson['imageAddress'] ?? "",
        favorite: parsedJson['favorite'] ?? false,
        episodes: parsedJson['episodes'] ?? 0,
        lastModifiedTime: parsedJson['lastModifiedTime'] ?? null);
  }

  static Map<String, dynamic> toMap(DObject object) => {
        "id": object.id,
        "title": object.title,
        "subtitle": object.subtitle,
        "desc": object.desc,
        "imageAddress": object.imageAddress,
        "favorite": object.favorite,
        "episodes": object.episodes,
        "lastModifiedTime": object.lastModifiedTime,
      };

  static String encode(List<DObject> objects) => json.encode(
        objects
            .map<Map<String, dynamic>>((object) => DObject.toMap(object))
            .toList(),
      );

  static List<DObject> decode(String objects) =>
      (json.decode(objects) as List<dynamic>)
          .map<DObject>((item) => DObject.fromJson(item))
          .toList();
}

//mock data;
List<DObject> mockdata = [
  DObject(
      id: Uuid().v4(),
      lastModifiedTime: DateTime.now().toString(),
      title: 'Tokyo ghoul',
      subtitle: 'season 1',
      imageAddress:null,
      episodes: 12,
      favorite: true,
      desc: 'nothing to say ,just watch it ,i bet you like it'),
  DObject(
      id: Uuid().v4(),
      lastModifiedTime: DateTime.now().toString(),
      title: 'Tokyo ghoul',
      subtitle: 'season 2',
      imageAddress: null,
      episodes: 13,
      favorite: false,
      desc: 'nothing to say ,just watch it ,i bet you like it'),
  DObject(
      id: Uuid().v4(),
      lastModifiedTime: DateTime.now().toString(),
      title: 'Tokyo ghoul',
      subtitle: 'season 3',
      imageAddress: null,
      episodes: 10,
      favorite: true,
      desc: 'nothing to say ,just watch it ,i bet you like it'),
  DObject(
      id: Uuid().v4(),
      lastModifiedTime: DateTime.now().toString(),
      title: 'Tokyo ghoul',
      subtitle: 'season 4',
      imageAddress: null,
      episodes: 8,
      favorite: false,
      desc: 'nothing to say ,just watch it ,i bet you like it'),
  DObject(
      id: Uuid().v4(),
      lastModifiedTime: DateTime.now().toString(),
      title: 'Slime',
      subtitle: 'season 1',
      imageAddress:null,
      episodes: 7,
      favorite: true,
      desc: 'nothing to say ,just watch it ,i bet you like it'),
];
