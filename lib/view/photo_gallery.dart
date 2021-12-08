import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/view_model/list_photo_viewmodel.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:transparent_image/transparent_image.dart';

class PhotoGallery extends StatefulWidget {
  const PhotoGallery({Key key}) : super(key: key);

  @override
  _PhotoGalleryState createState() => _PhotoGalleryState();
}

class _PhotoGalleryState extends State<PhotoGallery> {
  ListPhotoViewModel listPhotoViewModel = new ListPhotoViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          elevation: 0.0,
          bottomOpacity: 0.0,
          title: Center(
            child: Text(
              'Photo Gallery',
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
          ),
        ),
        body: FutureBuilder(
          future: listPhotoViewModel.fetchPictures(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Container(
                child: CircularProgressIndicator(),
              );
            } else {
              return StaggeredGridView.countBuilder(
                padding: EdgeInsets.all(20),
                crossAxisCount: 4,
                itemBuilder: (BuildContext context, int index) => Container(
                  color: Colors.grey,
                  child: FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image:
                        '${listPhotoViewModel.pictures[index].photoModel.downloadUrl}',
                    fit: BoxFit.cover,
                  ),
                ),
                staggeredTileBuilder: (index) =>
                    StaggeredTile.count(2, index.isEven ? 2 : 1),
                mainAxisSpacing: 4.0,
                crossAxisSpacing: 4.0,
              );
            }
          },
        ));
  }
}
