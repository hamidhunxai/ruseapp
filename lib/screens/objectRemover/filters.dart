import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:photofilters/photofilters.dart';
import 'package:image/image.dart' as imageLib;
import 'package:image_picker/image_picker.dart';
import 'package:ruse/screens/components/constants.dart';

void main() => runApp(new MaterialApp(home: FilterRuse()));

class FilterRuse extends StatefulWidget {
  static String id = "Filter";
  @override
  _FilterRuseState createState() => new _FilterRuseState();
}

class _FilterRuseState extends State<FilterRuse> {
  late String fileName;
  List<Filter> filters = presetFiltersList;
  File? imageFile;
  final picker = ImagePicker();

  Future getImage(context) async {
    var imageFile = await picker.getImage(source: ImageSource.gallery);
    fileName = basename(imageFile!.path);
    var image = imageLib.decodeImage(await imageFile.readAsBytes());
    image = imageLib.copyResize(image!, width: 600);
    Map imagefile = await Navigator.push(
      context,
      new MaterialPageRoute(
        builder: (context) => new PhotoFilterSelector(
          title: Text("Photo Filter Example"),
          image: image!,
          filters: presetFiltersList,
          filename: fileName,
          loader: Center(child: CircularProgressIndicator()),
          fit: BoxFit.contain,
        ),
      ),
    );
    if (imagefile != null && imagefile.containsKey('image_filtered')) {
      setState(() {
        imageFile = imagefile['image_filtered'];
      });
      print(imageFile?.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: buildAppBar,
      body: Center(
        child: new Container(
          child: imageFile == null
              ? Center(
                  child: new Text('No image selected.'),
                )
              : Image.file(imageFile!),
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () => getImage(context),
        tooltip: 'Pick Image',
        child: new Icon(Icons.add_a_photo),
      ),
    );
  }

  AppBar get buildAppBar {
    return AppBar(
      centerTitle: true,
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/R.gif',
            fit: BoxFit.contain,
            height: 42,
          ),
          Image.asset(
            "assets/images/use.png",
            height: 42,
          ),
          Container(padding: const EdgeInsets.all(8.0))
        ],
      ),
      backgroundColor: kSecondaryColor,
    );
  }
}
