import 'package:flutter/material.dart';
import 'package:gallery_app/Controllers/album_info_controller.dart';
import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:get/get.dart';

class AlbumInfoTile extends StatelessWidget {
  const AlbumInfoTile({
    Key? key,
    required this.albumInfoController,
    required this.index,
  }) : super(key: key);
  final int index;
  final AlbumInfoController albumInfoController;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() {
        final ImageProvider imageProvider =
            Image.network(albumInfoController.photos[index].url).image;
        showImageViewer(
          context,
          imageProvider,
          backgroundColor: Colors.black,
          closeButtonColor: Colors.white,
          immersive: true,
        );
      }),
      child: SizedBox(
        height: Get.height * 0.3,
        child: Image.network(
          albumInfoController.photos[index].thumbnailUrl,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) {
              return child;
            }
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            );
          },
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
