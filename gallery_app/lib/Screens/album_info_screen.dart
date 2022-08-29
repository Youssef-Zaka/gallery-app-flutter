import 'package:flutter/material.dart';
import 'package:gallery_app/Controllers/album_info_controller.dart';
import 'package:gallery_app/Controllers/albums_controller.dart';
import 'package:gallery_app/Models/album.dart';
import 'package:gallery_app/widgets/album_info_tile.dart';
import 'package:get/get.dart';

class AlbumInfoScreen extends GetView<AlbumController> {
  const AlbumInfoScreen({Key? key}) : super(key: key);

  static const String routeName = '/album_info';

  @override
  Widget build(BuildContext context) {
    final Album album = ModalRoute.of(context)?.settings.arguments as Album;
    final albumInfoController = Get.put(AlbumInfoController(album));
    return Obx(
      () => Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            album.title!,
            style: const TextStyle(color: Colors.white),
          ),
        ),
        body: albumInfoController.doneLoading.value
            ?
            //if done loading, show a list view of albums
            Padding(
                padding: const EdgeInsets.all(15.0),
                child: ListView(
                  physics: const ClampingScrollPhysics(),
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: Get.height * 0.02,
                          child: Text(
                            'Album ID: ${album.id}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: Get.height * 0.02,
                          child: Text(
                            'Album User ID: ${album.userId}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: Get.height * 0.02,
                          child: Text(
                            'Album has ${albumInfoController.photos.length} Photos',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: Get.height * 0.01,
                        ),
                        GridView.builder(
                          shrinkWrap: true,
                          itemCount: albumInfoController.photos.length,
                          physics: const ClampingScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            childAspectRatio: 1,
                            crossAxisSpacing: 15,
                            mainAxisSpacing: 15,
                          ),
                          itemBuilder: (context, index) {
                            return AlbumInfoTile(
                                albumInfoController: albumInfoController,
                                index: index);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              )
            : const Center(
                //if not done loading, show loading indicator
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
      ),
    );
  }
}
