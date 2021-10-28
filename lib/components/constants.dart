import 'package:flutter/material.dart';

const kPrimaryColor = const Color(0xff22A91B);
const kSecondaryColor = const Color(0xff323232);
const kTextColor = const Color(0xffFFFFFF);

const kTextFieldDecoration = InputDecoration(
  hintText: 'Enter a Value',
  fillColor: kTextColor,
  filled: true,
  contentPadding: EdgeInsets.all(20.0),
);

const splashDecoration = BoxDecoration(
  image: DecorationImage(
    image: AssetImage("assets/images/beaut.png"),
    fit: BoxFit.cover,
  ),
);
