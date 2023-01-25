# flutter_photo_view_package

## 1. Research: Project Title

- Keywords:
    - _flutter photo view_
    - _photo view flutter_
    - _flutter photo view example_
    - _photo_view flutter example_
    - _flutter image zoom in animation_
    - _flutter open image on click_
    - _pinch zoom image flutter_
    - _flutter zoomable image_
    - _flutter photoview network image_
    - _photoviewgallery flutter example_
    - _flutter photo view full screen_
    - _flutter photo viewer_
    - _flutter zoom image_
    - _flutter zoom image on tap_
    - _how to zoom image in flutter_
    - _flutter photo view full screen_
    - _flutter interactive viewer_
    - _flutter photo view full screen_
    - _flutter photo view gallery_
    - _flutter image viewer with zoom_
- Video Title: _Flutter Photo View - How To Zoom, Pinch, Or View Image, NetworkImage On Full Screen In Gallery_


## 2. Research: Competitors

**Flutter Videos/Articles**

- _https://pub.dev/packages/photo_view (Official package documentation)_
- _https://medium.flutterdevs.com/photoview-influtter-be29f167aa0f_
- _https://mobikul.com/photoview-in-flutter-2_
- _https://rrtutors.com/tutorials/flutter-photo-view-gallery-app-with-zoom-option_
- _https://protocoderspoint.com/flutter-photo-view-widget-with-zoomable-image-gallery_
- _24K: https://www.youtube.com/watch?v=cZwbVPix2PE_
- _12K: https://www.youtube.com/watch?v=ccWy2BdYwPo_
- _6K: https://www.youtube.com/watch?v=YV7D8XEQoYs_
- _1K: https://www.youtube.com/watch?v=sgWKUQdZBDo_
- _1K: https://www.youtube.com/watch?v=YTVoAM6L6uo_
- 

**Android/Swift/React Videos**

NA

**Great Features**
- _Users can view, rotate and zoom the image._
- _It owns loadingBuilder property that we use for the time it takes for any image until then the loading indicator will rotate._
- _It has background decoration of remaining screen other than the image widget._
- _minScale and maxScale determine the maximum and minimum size of image in which the image will be allowed to take._
- _

[comment]: <> (- _What is the use of photo_view package in flutter? -> https://medium.flutterdevs.com/photoview-influtter-be29f167aa0f_)

**Problems from Videos**
- _In [this](https://www.youtube.com/watch?v=YV7D8XEQoYs) video can we combine this plugin with CacheNetwotkImage? Use CachedNetworkImageProvider for that purpose._

**Problems from Flutter Stackoverflow**

- _https://stackoverflow.com/questions/70404718/error-with-photoview-looking-up-a-deactivated-widgets-ancestor-is-unsafe_
- _https://stackoverflow.com/questions/70330582/flutter-photo-view-plugin-after-upgrade-get-this-error_
- _https://stackoverflow.com/questions/71715481/error-saying-that-looking-up-a-deactivated-widgets-ancestor-is-unsafe-when-usin_
- _https://stackoverflow.com/questions/61599027/photoview-library-not-being-able-to-zoom-in-zoom-out-of-image_
- _https://stackoverflow.com/questions/72021202/exception-caught-by-widgets-library-when-coming-back-from-a-page_
- _https://stackoverflow.com/questions/72244499/looking-up-a-deactivated-widgets-ancestor-is-unsafe-with-statefullwidget_

## 3. Video Structure

**Main Points / Purpose Of Lesson**

1. _Sometime we need to view or zoom an image. We can use `photo_view` package to zoom the image with its properties set by us. We Learn how to view, zoom or pinch photo on full screen from gallery or network_
2. _Main Points_
    - _Overview of pre-built photo view libraries like AssetImage, Image.asset, NetworkImage, Image.network, circularAvator._
    - _Why `photo_view` is needed when there are pre-built packages._
    - _Now explain the structured main content of video._
3. _In this video lesson, we will be diving into the Flutter [`photo_view`](https://pub.dev/packages/photo_view) library and exploring its various features to view, pinch, zoom and drag an image. It can also be used to view gallery images. Photo View provides a gesture sensitive zoomable widget. Photo View is largely used to show interactive images and other stuff such as SVG. PhotoView is extremely customizable though its options and the controllers._

**The Structured Main Content**
1. _Introduction to `photo_view` Library_
    - _Overview of features and properties_
    - _How to install and setup the library_
   - _Run flutter pub add `photo_view` in terminal or add `photo_view` manually by visiting [pub.dev/packages/photo_view](https://pub.dev/packages/photo_view) and add latest package in pubspec.yaml file._
   - _Import its library in file where you want to use it.
   - _minScale means the zoom out dynamic value computed by PhotoView library. We can not zoom out more than this value._
   - _maxScale means the zoom in dynamic value computed by PhotoView library. We can not zoom in more than this value._
   - _By default `photo_view` package shows image on whole screen and takes the space of a complete page. Inline photo, show others widgets with photoView image on same screen._
2. _`imageProvider` is required for photoView_
   - _We can use AssetImage or NetworkImage here._    
    ``` dart
        body: PhotoView(
          imageProvider: const NetworkImage(
              'https://images.unsplash.com/photo-1426604966848-d7adac402bff?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'),
          // We can also provide AssetImage
          /// imageProvider: AssetImage(''),
        ),
   ```
   - _We can rotate the image and change `backgroundDecoration` inside PhotoView widget
   ``` dart
          backgroundDecoration: const BoxDecoration(
            color: Colors.black,
          ),
          enableRotation: true,
   ```
   - _`minScale` and `maxScale` are for dynamic zoom out and zoom in value inside PhotoView widget.
   ``` dart
          minScale: PhotoViewComputedScale.contained * .8,
          maxScale: PhotoViewComputedScale.covered * 2,
   ```
   - _`loadingBuilder` is used for the time it takes for any image until then the loading indicator will rotate.
    ```dart
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
     ```
3. _We can also show other widgets with PhotoView widget on same screen._
   clipped_photo_view_page can show other widgets with image. Wrap PhotoView with ClipRRect and wrap ClipRRect with AspectRatio.
    ```dart
   Scaffold(
        appBar: AppBar(
          title: const Text('Clipped Photo View'),
        ),
        body: Center(
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: ClipRRect(
              child: PhotoView(
                imageProvider: const NetworkImage(
                    'https://images.unsplash.com/photo-1426604966848-d7adac402bff?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'),
                minScale: PhotoViewComputedScale.contained * .8,
                maxScale: PhotoViewComputedScale.covered * 2,
                enableRotation: true,
                backgroundDecoration: const BoxDecoration(color: Colors.black),
                // loadingBuilder: (context, event) => ,
              ),
            ),
          ),
        ),
      );
    ```
4. _gallery_page. Show images in the form of gallery by photo view package._
    ```dart
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class GalleryPage extends StatelessWidget {
const GalleryPage({Key? key}) : super(key: key);

@override
Widget build(BuildContext context) {
final imagesList = [
'https://images.unsplash.com/photo-1426604966848-d7adac402bff?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
'https://images.unsplash.com/photo-1493246507139-91e8fad9978e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
'https://images.unsplash.com/photo-1502021680532-838cfc650323?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=871&q=80',
];
return Scaffold(
appBar: AppBar(
title: const Text('Gallery'),
),
body: PhotoViewGallery.builder(
itemCount: imagesList.length,
builder: (context, index) => PhotoViewGalleryPageOptions(
imageProvider: NetworkImage(
imagesList[index],
),
minScale: PhotoViewComputedScale.contained * 0.8,
maxScale: PhotoViewComputedScale.covered * 2,
),
scrollDirection: Axis.horizontal,
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
}
```