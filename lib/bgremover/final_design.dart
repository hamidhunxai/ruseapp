import 'dart:ui';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'filters/FilterItem.dart';
import 'filters/filter_model.dart';

// https://dribbble.com/shots/7520392-Photo-editor-app/attachments/331802?mode=media

class PhotoEditor extends StatefulWidget {
  static String id = "PhotoEditor";
  final List arguments;
  PhotoEditor({required this.arguments});
  @override
  _PhotoEditorState createState() => _PhotoEditorState();
}

class _PhotoEditorState extends State<PhotoEditor> {
  final GlobalKey<ExtendedImageEditorState> editorKey =
      GlobalKey<ExtendedImageEditorState>();
  File? image;
  @override
  void initState() {
    super.initState();
    image = widget.arguments[0];
  }

  Color _color = Color.fromRGBO(135, 195, 236, 1); // light blue
  Color _color2 = Color.fromRGBO(80, 138, 203, 1); // accent blue
  Color _clickedColor = Color.fromRGBO(70, 107, 131, 1); // accent blue

  final _filters = [
    Colors.white,
    ...List.generate(
      Colors.primaries.length,
      (index) => Colors.primaries[(index * 4) % Colors.primaries.length],
    )
  ];

  final _filterColor = ValueNotifier<Color>(Colors.white);

  void _onFilterChanged(Color value) {
    _filterColor.value = value;
  }

  static List<String> fruitname = [
    'Filters',
    'Auto',
    'Manual',
  ];

  final List<FruitDataModel> Fruitdata = List.generate(
      fruitname.length,
      (index) => FruitDataModel(
          '${fruitname[index]}', '${fruitname[index]} Description...'));

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          // background color
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              color: _color,
              child: Stack(
                children: <Widget>[
                  // accent blue color circle1
                  Positioned(
                    top: -50.0,
                    right: -150.0,
                    child: Container(
                      height: 500.0,
                      width: 500.0,
                      decoration: BoxDecoration(
                        color: _color2,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  // accent blue color circle2
                  Positioned(
                    bottom: -100.0,
                    left: 0.0,
                    child: Container(
                      height: 300.0,
                      width: 300.0,
                      decoration: BoxDecoration(
                        color: _color2,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // top filter
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            bottom: screenHeight * 0.30,
            child: Container(
              child: ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    color: _color.withOpacity(0.2),
                  ),
                ),
              ),
            ),
          ),

          // bottom filter
          Positioned(
            top: screenHeight * 0.70,
            right: 0,
            left: 0,
            bottom: 0,
            child: Container(
              child: ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    color: Colors.white.withOpacity(0.2),
                  ),
                ),
              ),
            ),
          ),

          // appbar & image
          Positioned(
            top: 0,
            left: 16.0,
            right: 16.0,
            child: Column(
              children: <Widget>[
                SafeArea(
                  top: true,
                  left: true,
                  right: true,
                  child: Container(
                    height: 40.0,
                    child: Row(
//                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Icon(
                          Icons.menu,
                          size: 36.0,
                          color: Colors.white,
                        ),
                        Spacer(),
                        Icon(
                          Icons.pause_circle_filled,
                          size: 36.0,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 8.0,
                        ),
                        Icon(
                          Icons.play_circle_filled,
                          size: 36.0,
                          color: Colors.white.withOpacity(0.5),
                        ),
                        SizedBox(
                          width: 8.0,
                        ),
                        Icon(
                          Icons.cloud_upload,
                          size: 36.0,
                          color: Colors.white.withOpacity(0.5),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(child: _buildPhotoWithFilter()),
              ],
            ),
          ),

          // bottom container
          Positioned(
            top: screenHeight * 0.70,
            bottom: 0,
            left: 0,
            right: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(left: 16.0),
                  height: 35.0,
                  child: ListView.builder(
                    itemCount: Fruitdata.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          child: Text(Fruitdata[index].name),
                        ),
                      );
                    },
                  ),
                ),

                // ListView

                Container(
                  height: 64.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(48.0),
                          topRight: Radius.circular(48.0)),
                      color: Colors.black),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Flexible(
                        flex: 1,
                        child: Container(
                          child: Center(
                              child: Icon(
                            Icons.picture_in_picture,
                            size: 32.0,
                            color: Colors.white,
                          )),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Container(
                          color: _clickedColor,
                          child: Center(
                              child: Icon(
                            Icons.edit,
                            size: 32.0,
                            color: Colors.white,
                          )),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Container(
                          child: Center(
                              child: Icon(
                            Icons.text_rotate_vertical,
                            size: 40.0,
                            color: Colors.white,
                          )),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Container(
                          child: Center(
                              child: Icon(
                            Icons.crop,
                            size: 32.0,
                            color: Colors.white,
                          )),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPhotoWithFilter() {
    return ValueListenableBuilder(
      valueListenable: _filterColor,
      builder: (context, value, child) {
        final color = value as Color;
        return Image.file(
          image!,
          color: color.withOpacity(0.5),
          colorBlendMode: BlendMode.color,
          fit: BoxFit.cover,
        );
      },
    );
  }
}

class FruitDetail {}
