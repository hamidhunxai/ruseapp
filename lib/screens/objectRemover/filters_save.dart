import 'dart:typed_data';

import 'package:flutter/material.dart';

class FilterSave extends StatelessWidget {
  final Uint8List imageData;
  FilterSave({required this.imageData});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Container(
        constraints: BoxConstraints(
          maxWidth: size.width,
          maxHeight: size.height,
        ),
        child: Image.memory(
          imageData,
          width: size.width,
          height: size.height,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
