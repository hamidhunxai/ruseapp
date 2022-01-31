import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:ruse/bgremover/widget/filters_list.dart';
import 'dart:io';
import 'filters_save.dart';

class MainFilters extends StatelessWidget {
  final File image;
  GlobalKey<ExtendedImageEditorState> globalKey =
      GlobalKey<ExtendedImageEditorState>();
  MainFilters({required this.image, required this.globalKey});

  final List<List<double>> filtersList = [
    greyscale,
    purple,
  ];
  void convertWidgetToImage() async {
    RenderRepaintBoundary? repaintBoundary =
        globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary?;
    ui.Image? boxImage = await repaintBoundary?.toImage(pixelRatio: 1);
    ByteData? byteData =
        await boxImage?.toByteData(format: ui.ImageByteFormat.png);
    Uint8List? uint8list = byteData?.buffer.asUint8List();
    Navigator.of(globalKey.currentContext!).push(MaterialPageRoute(
        builder: (context) => FilterSave(imageData: uint8list!)));
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return RepaintBoundary(
      key: globalKey,
      child: Container(
        child: PageView.builder(
            itemCount: filtersList.length,
            itemBuilder: (context, index) {
              return ColorFiltered(
                colorFilter: ColorFilter.matrix(filtersList[index]),
                child: image != null
                    ? ExtendedImage(
                        image: ExtendedFileImageProvider(image),
                        extendedImageEditorKey: globalKey,
                      )
                    : Text(""),
              );
            }),
      ),
    );
  }
}
