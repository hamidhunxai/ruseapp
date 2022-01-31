import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photofilters/filters/filters.dart';
import 'package:ruse/bgremover/edit_screen.dart';
import 'package:ruse/bgremover/filters.dart';
import 'package:ruse/bgremover/final_design.dart';

import 'package:ruse/components/boxAndButtons.dart';
import 'package:ruse/components/constants.dart';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:ruse/components/sliders.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File? _image;
  final picker = ImagePicker();
  @override
  void initState() {
    super.initState();
  }

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
      Future.delayed(Duration(seconds: 0)).then(
        (value) => Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => EditPhotoScreen(
              arguments: [_image],
            ),
          ),
        ),
      );
    }
  }

  Future getImageFinal() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
      Future.delayed(Duration(seconds: 0)).then(
        (value) => Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => PhotoEditor(
              arguments: [_image],
            ),
          ),
        ),
      );
    }
  }

  Future getImageFilter() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: 1200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Sliders(),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: TextButtonHomepage(
                          mainTitle: 'Object\n',
                          mainIcon: IconsM.scissors,
                          onPressed: () async {
                            await getImage();
                          },
                          secondTitle: 'Remover Bulk',
                          edgeInsetss: EdgeInsets.all(20.0),
                        ),
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      Expanded(
                        child: TextButtonHomepage(
                          mainTitle: ' Picture\n ',
                          mainIcon: IconsM.eraser,
                          onPressed: () {},
                          secondTitle: 'Super Impose',
                          edgeInsetss: EdgeInsets.all(20.0),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      ButtonSingle(
                        onPressed: () async {
                          await getImageFinal();
                        },
                        mainIcon: IconsM.spider_face,
                        title: 'Identify Objects',
                        colour: kTextColor,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      ButtonSingle(
                        onPressed: () {
                          Navigator.pushNamed(context, FilterRuse.id);
                        },
                        mainIcon: IconsM.photo_size_select_large,
                        title: 'Object Editing',
                        colour: kTextColor,
                      ),
                      SizedBox(
                        width: 30.0,
                      ),
                      ButtonSingle(
                        onPressed: () {},
                        mainIcon: Icons.filter_7_sharp,
                        title: 'Filters',
                        colour: kTextColor,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      ButtonSingle(
                        onPressed: () {},
                        mainIcon: IconsM.adult,
                        title: 'Identify Person',
                        colour: kTextColor,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(children: <Widget>[
                        ScrollSingle(
                          title: 'Object Manipulator',
                          mainIcon: IconsM.spider_face,
                          onPressed: () {},
                        ),
                        WidthBox10(),
                        ScrollSingle(
                          title: 'Picture Identify',
                          mainIcon: IconsM.photo_size_select_large,
                          onPressed: () {},
                        ),
                        WidthBox10(),
                        ScrollSingle(
                          title: 'Resize',
                          mainIcon: IconsM.photo_size_select_large,
                          onPressed: () {},
                        ),
                        WidthBox10(),
                        ScrollSingle(
                          title: 'Colorize',
                          mainIcon: IconsM.adult,
                          onPressed: () {},
                        ),
                        WidthBox10(),
                        ScrollSingle(
                          title: 'Object Identify',
                          mainIcon: IconsM.spider_face,
                          onPressed: () {},
                        ),
                        WidthBox10(),
                        ScrollSingle(
                          title: 'Delete Object',
                          mainIcon: IconsM.eraser,
                          onPressed: () {},
                        ),
                        WidthBox10(),
                        ScrollSingle(
                          title: 'Object Add',
                          mainIcon: Icons.add,
                          onPressed: () {},
                        ),
                      ])),
                ),
                HeightBox25(),
                Column(
                  children: [
                    BigImage(),
                    HeightBox25(),
                    BigImage(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BigImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: Image.asset(
            "assets/images/sliders/4.jpg",
          ),
        ),
      ),
    );
  }
}
