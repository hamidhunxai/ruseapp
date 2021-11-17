import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const kPrimaryColor = const Color(0xff22A91B);
const kSecondaryColor = const Color(0xff323232);
const kTextColor = const Color(0xffFFFFFF);

const kTextFieldDecoration = InputDecoration(
  hintText: 'Enter a Value',
  hintStyle: TextStyle(
    color: kTextColor,
  ),
  filled: false,
  contentPadding: EdgeInsets.all(20.0),
  border:
      OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white38, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kPrimaryColor, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
);

const splashDecoration = BoxDecoration(
  image: DecorationImage(
    image: AssetImage("assets/images/beaut.png"),
    fit: BoxFit.cover,
  ),
);
const kTextStyle = TextStyle(
  color: kTextColor,
  fontFamily: 'Mukta',
  fontSize: 12,
  fontWeight: FontWeight.normal,
  height: 1,
);
final List images = [
  'assets/images/t.png',
  'assets/images/logo.png',
];

class IconsM {
  IconsM._();

  static const _kFontFam = 'Icons';
  static const String? _kFontPkg = null;

  static const IconData scissors =
      IconData(0xe800, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData layers_alt =
      IconData(0xe801, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData photo_size_select_large =
      IconData(0xe802, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData adult =
      IconData(0xe803, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData picture_collage_svgrepo_com =
      IconData(0xe804, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData spider_face =
      IconData(0xeaaf, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData eraser =
      IconData(0xf12d, fontFamily: _kFontFam, fontPackage: _kFontPkg);
}
