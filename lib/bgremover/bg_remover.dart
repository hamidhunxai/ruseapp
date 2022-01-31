// @dart=2.9
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:flutter/material.dart';

//filters
import 'package:ruse/bgremover/widget/filtered_image_list_widget.dart';
import 'package:ruse/bgremover/widget/filtered_image_widget.dart';

import 'package:photofilters/filters/filters.dart';
import 'package:photofilters/filters/preset_filters.dart';
import 'package:image/image.dart' as img;

import 'filter_utils.dart';
import 'dart:convert';

class BGRemover extends StatefulWidget {
  const BGRemover({Key key}) : super(key: key);

  @override
  _BGRemoverState createState() => _BGRemoverState();
}

class _BGRemoverState extends State<BGRemover> {
  File _image;
  img.Image image;
  Filter filter = presetFiltersList.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("sa"),
        actions: [
          IconButton(
            icon: Icon(Icons.add_a_photo),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              setState(() {
                filter = presetFiltersList[3];
              });
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          buildImage(),
          const SizedBox(height: 12),
          Column(
            children: [
              buildFilters(),
            ],
          )
        ],
      ),
    );
  }

  // Future pickImage() async {
  //   var image = await ImagePicker.pickImage(source: ImageSource.gallery);
  //
  //   File croppedFile = await ImageCropper.cropImage(
  //     sourcePath: image.path,
  //     aspectRatioPresets: [
  //       CropAspectRatioPreset.square,
  //       CropAspectRatioPreset.ratio3x2,
  //       CropAspectRatioPreset.original,
  //       CropAspectRatioPreset.ratio4x3,
  //       CropAspectRatioPreset.ratio16x9
  //     ],
  //     maxWidth: 512,
  //     maxHeight: 512,
  //   );
  //
  //   final imageBytes = File(croppedFile.path).readAsBytesSync();
  //
  //   final newImage = img.decodeImage(imageBytes);
  //   FilterUtils.clearCache();
  //
  //   setState(() {
  //     this.image = newImage;
  //   });
  // }

  Widget buildImage() {
    const double height = 450;
    if (image == null) return Container();

    return FilteredImageWidget(
      filter: filter,
      image: image,
      successBuilder: (imageBytes) =>
          Image.memory(imageBytes, height: height, fit: BoxFit.fitHeight),
      errorBuilder: () => Container(height: height),
      loadingBuilder: () => Container(
        height: height,
        child: Center(child: CircularProgressIndicator()),
      ),
    );
  }

  Widget buildFilters() {
    if (image == null) return buildImage();

    return FilteredImageListWidget(
      filters: presetFiltersList,
      image: image,
      onChangedFilter: (filter) {
        setState(() {
          this.filter = filter;
        });
      },
    );
  }
}
