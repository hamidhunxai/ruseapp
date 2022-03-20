import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:ruse/screens/objectRemover/edit_screen.dart';
import 'package:ruse/screens/objectRemover/filters.dart';
import 'package:ruse/screens/objectRemover/final_design.dart';
import 'package:ruse/screens/objectRemover/image_pro.dart';
import 'package:ruse/screens/components/boxAndButtons.dart';
import 'package:ruse/screens/components/constants.dart';
import 'package:ruse/screens/tabs/templates.dart';
import 'package:ruse/screens/components/sliders.dart';

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
            height: 1000,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Sliderz(),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: TextButtonHomepage(
                          mainTitle: 'Object\n',
                          mainIcon: IconsM.scissors,
                          onPressed: () {
                            Navigator.pushNamed(context, ImagePro.id);
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
                          onPressed: () async {
                            await getImage();
                          },
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
                          Navigator.pushNamed(context, ImagePro.id);
                        },
                        mainIcon: IconsM.photo_size_select_large,
                        title: 'Object Editing',
                        colour: kTextColor,
                      ),
                      SizedBox(
                        width: 30.0,
                      ),
                      ButtonSingle(
                        onPressed: () {
                          Navigator.pushNamed(context, FilterRuse.id);
                        },
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
                          onPressed: () {
                            Navigator.pushNamed(context, ImagePro.id);
                          },
                        ),
                        WidthBox10(),
                        ScrollSingle(
                          title: 'Picture Identify',
                          mainIcon: IconsM.photo_size_select_large,
                          onPressed: () {
                            Navigator.pushNamed(context, ImagePro.id);
                          },
                        ),
                        WidthBox10(),
                        ScrollSingle(
                          title: 'Resize',
                          mainIcon: IconsM.photo_size_select_large,
                          onPressed: () {
                            Navigator.pushNamed(context, ImagePro.id);
                          },
                        ),
                        WidthBox10(),
                        ScrollSingle(
                          title: 'Colorize',
                          mainIcon: IconsM.adult,
                          onPressed: () {
                            Navigator.pushNamed(context, ImagePro.id);
                          },
                        ),
                        WidthBox10(),
                        ScrollSingle(
                          title: 'Object Identify',
                          mainIcon: IconsM.spider_face,
                          onPressed: () {
                            Navigator.pushNamed(context, ImagePro.id);
                          },
                        ),
                        WidthBox10(),
                        ScrollSingle(
                          title: 'Delete Object',
                          mainIcon: IconsM.eraser,
                          onPressed: () {
                            Navigator.pushNamed(context, ImagePro.id);
                          },
                        ),
                        WidthBox10(),
                        ScrollSingle(
                          title: 'Object Add',
                          mainIcon: Icons.add,
                          onPressed: () {
                            Navigator.pushNamed(context, ImagePro.id);
                          },
                        ),
                      ])),
                ),
                HeightBox25(),
                Column(
                  children: [
                    BigImage(),
                    HeightBox25(),
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
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Templates()),
        );
      },
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
