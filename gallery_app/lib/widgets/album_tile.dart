import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gallery_app/Controllers/albums_controller.dart';
import 'package:gallery_app/Screens/album_info_screen.dart';
import 'package:get/get.dart';

class AlbumTile extends StatelessWidget {
  const AlbumTile({
    Key? key,
    required this.albumController,
    required this.index,
  }) : super(key: key);
  final int index;
  final AlbumController albumController;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() {
        Get.toNamed(AlbumInfoScreen.routeName,
            arguments: albumController.albums[index]);
      }),
      child: SizedBox(
        height: Get.height * 0.1,
        child: Row(
          children: [
            SizedBox(
              width: Get.width * 0.8,
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  albumController.albums[index].title,
                  style: TextStyle(
                    fontSize: Get.height * 0.02,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: Get.width * 0.2,
              child: const Icon(
                CupertinoIcons.forward,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
