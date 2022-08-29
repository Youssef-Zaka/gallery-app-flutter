import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:gallery_app/Models/album.dart';
import 'package:gallery_app/Models/photo.dart';
import 'package:get/get.dart';
import 'package:gallery_app/Helpers/helper.dart' as helper;

class AlbumInfoController extends GetxController {
  final photos = [].obs;
  final doneLoading = false.obs;
  final Album album;
  //take an album from constructor and fetch its photos
  AlbumInfoController(this.album) {
    fetchPhotos();
  }

  void fetchPhotos() async {
    doneLoading.value = false;

    var response =
        await Dio().get('${helper.baseUrl}${album.id}${helper.photosUrl}');
    if (response.statusCode == 200) {
      //map recieved json list into photo list


      //String in json format? 
      //map json to maps
      var photoList = json
          .decode(json.encode(response.data).toString())
          .map<Photo>((json) => Photo.fromMap(json))
          .toList();

      // .map<Photo>((json) => Photo.fromMap(json)).toList();
      photos.value = photoList;
      doneLoading.value = true;
    }
  }
}
