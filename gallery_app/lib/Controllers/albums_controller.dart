import 'package:dio/dio.dart';
import 'package:gallery_app/Models/album.dart';
import 'package:get/get.dart';
import 'package:gallery_app/Helpers/helper.dart' as helper;

class AlbumController extends GetxController {
  final albums = [].obs;
  final doneLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchAlbums();
  }

  void fetchAlbums() async {
    
    doneLoading.value = false;

    var response = await Dio().get(helper.baseUrl);
    if (response.statusCode == 200) {
      //map recieved json list into album list
      var albums = response.data.map<Album>((json) => Album.fromMap(json)).toList();
      this.albums.value = albums;
      doneLoading.value = true;
    }
  }
}
