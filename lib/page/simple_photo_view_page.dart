import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class SimplePhotoViewPage extends StatelessWidget {
  const SimplePhotoViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Simple Photo View'),
        ),
        body: PhotoView(
          imageProvider: const NetworkImage(
              'https://images.unsplash.com/photo-1426604966848-d7adac402bff?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'),
          // We can also provide AssetImage
          /// imageProvider: AssetImage(''),
          minScale: PhotoViewComputedScale.contained * .8,
          maxScale: PhotoViewComputedScale.covered * 2,
          enableRotation: true,
          backgroundDecoration: const BoxDecoration(
            color: Colors.black,
          ),
          loadingBuilder: (context, event) => Center(
            child: Container(
              width: 30.0,
              height: 30.0,
              child: CircularProgressIndicator(
                backgroundColor: Colors.orange,
                value: event == null
                    ? 0
                    : event.cumulativeBytesLoaded /
                    (event.expectedTotalBytes as int),
              ),
            ),
          ),
        ),
      );
}
