import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:image_editor_pro/image_editor_pro.dart';
import 'package:firexcode/firexcode.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ImagePro extends StatefulWidget {
  static String id = "ImagePro";

  @override
  _ImageProState createState() => _ImageProState();
}

class _ImageProState extends State<ImagePro> {
  final controllerDefaultImage = TextEditingController();
  File? _defaultImage;
  File? _image;
  bool isLoading = false;
  List<String?> listOfStr = [];
  var storage = FirebaseStorage.instance;

  Future<void> getimageditor() =>
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return ImageEditorPro(
          appBarColor: Colors.black87,
          bottomBarColor: Colors.black87,
          pathSave: Directory("assets/images/$_image"),
          defaultImage: _defaultImage,
        );
      })).then((geteditimage) {
        if (geteditimage != null) {
          setState(() {
            _image = geteditimage;
          });
        }
      }).catchError((er) {
        print(er);
      });

  @override
  Widget build(BuildContext context) {
    return condition(
            condtion: _image == null,
            isTrue: XColumn(crossAxisAlignment: CrossAxisAlignment.center)
                .list([
                  TextField(
                    controller: controllerDefaultImage,
                    readOnly: true,
                    decoration: InputDecoration(
                      isDense: true,
                      hintText: 'No default image',
                    ),
                  ),
                  16.0.sizedHeight(),
                  'Set Default Image'.text().xRaisedButton(
                    onPressed: () async {
                      final imageGallery = await ImagePicker()
                          .getImage(source: ImageSource.gallery);
                      if (imageGallery != null) {
                        _defaultImage = File(imageGallery.path);
                        setState(() =>
                            controllerDefaultImage.text = _defaultImage!.path);
                      }
                    },
                  ),
                  'Open Editor'.text().xRaisedButton(
                    onPressed: () {
                      getimageditor();
                    },
                  ),
                ])
                .xCenter()
                .xap(value: 16),
            isFalse:
                _image == null ? Container() : Image.file(_image!).toCenter())
        .xScaffold(
      appBar: buildAppBar,
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
      backgroundColor: const Color(0xff323232),
    );
  }

  SavedButton() {
    listOfStr.forEach((img) async {
      String imageName = img!
          .substring(img.lastIndexOf("/"), img.lastIndexOf("."))
          .replaceAll("/", "");

      final Directory systemTempDir = Directory.systemTemp;
      final byteData = await rootBundle.load(img);

      final file = _image;
      await file!.writeAsBytes(byteData.buffer
          .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
      TaskSnapshot snapshot =
          await storage.ref("images").child("images/$imageName").putFile(file);
      if (snapshot.state == TaskState.success) {
        final String downloadUrl = await snapshot.ref.getDownloadURL();
        await FirebaseFirestore.instance
            .collection("images")
            .add({"url": downloadUrl, "name": imageName});
        setState(() {
          isLoading = false;
        });
        final snackBar = SnackBar(content: Text('Yay! Success'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else {
        print('Error from image repo ${snapshot.state.toString()}');
        throw ('This file is not an image');
      }
    });
  }
}

Widget condition(
    {required bool condtion, required Widget isTrue, required Widget isFalse}) {
  return condtion ? isTrue : isFalse;
}
