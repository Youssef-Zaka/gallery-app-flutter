import 'dart:io';

import 'package:camera_camera/camera_camera.dart';
import 'package:flutter/material.dart';
import 'package:gallery_app/Controllers/albums_controller.dart';
import 'package:gallery_app/widgets/album_tile.dart';
import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';

class AlbumScreen extends GetView<AlbumController> {
  AlbumScreen({Key? key}) : super(key: key);

  static const String routeName = '/';

  final albumController = Get.put(AlbumController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text(
            'Albums',
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.image_search_rounded,
                color: Colors.white,
              ),
              onPressed: () async {
                FilePickerResult? result = await FilePicker.platform.pickFiles(
                  type: FileType.image,
                );

                if (result != null) {
                  File file = File(result.files.single.path!);
                } else {
                  // User canceled the picker
                }
              },
            ),
            IconButton(
              icon: const Icon(
                Icons.camera_alt_outlined,
                color: Colors.white,
              ),
              onPressed: () async {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: Get.width * 0.1),
                              child: CameraCamera(
                                onFile: (file) {
                                  print(file);
                                  //When take foto you should close camera
                                  Navigator.pop(context);
                                },
                              ),
                            )));
              },
            ),
          ],
        ),
        body: SizedBox(
          height: Get.height,
          width: Get.width,
          child: albumController.doneLoading.value
              ?
              //if done loading, show a list view of albums
              ListView.builder(
                  itemCount: albumController.albums.length,
                  itemBuilder: (context, index) {
                    return AlbumTile(
                        albumController: albumController, index: index);
                  },
                )
              : const Center(
                  //if not done loading, show loading indicator
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                ),
        ),
      ),
    );
  }
}
