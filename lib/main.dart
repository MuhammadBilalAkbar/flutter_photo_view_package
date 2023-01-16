import 'package:flutter/material.dart';

import 'page/simple_photo_view_page.dart';
import 'page/clipped_photo_view_page.dart';
import 'page/gallery_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SimplePhotoViewPage(), // 1. Basic and Simple
      // home: const ClippedPhotoViewPage(), // 2. Clipped by using AspectRatio and ClipRRect
      // home: const GalleryPage(), // 3. Using list of images and show as gallery.
    );
  }
}
