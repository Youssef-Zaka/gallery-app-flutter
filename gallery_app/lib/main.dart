import 'package:flutter/material.dart';
import 'package:gallery_app/Screens/album_info_screen.dart';
import 'package:gallery_app/Screens/album_screen.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AlbumScreen(),
      getPages: [
        GetPage(name: AlbumScreen.routeName, page: () => AlbumScreen()),
        GetPage(
            name: AlbumInfoScreen.routeName,
            page: () => const AlbumInfoScreen())
      ],
    );
  }
}
