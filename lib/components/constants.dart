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
