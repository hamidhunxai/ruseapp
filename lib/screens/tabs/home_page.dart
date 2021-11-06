import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:ruse/components/constants.dart';
import 'package:ruse/screens/cutter/nextpage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _current = 0;
  final List images = [
    'assets/images/t.png',
    'assets/images/logo.png',
  ];
  final List place = [
    'asd',
    'asd',
  ];
  List<Widget> generateImageTiles() {
    return images
        .map(
          (element) => ClipRRect(
            child: Image.asset(
              element,
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(15.0),
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      body: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(5),
        alignment: Alignment.center,
        constraints: BoxConstraints.expand(height: 225),
        child: Stack(
          children: [
            CarouselSlider(
                items: generateImageTiles(),
                options: CarouselOptions(
                    enlargeCenterPage: true,
                    autoPlay: true,
                    aspectRatio: 18 / 8,
                    onPageChanged: (index, other) {
                      setState(() {
                        _current = index;
                      });
                    })),
            AspectRatio(
                aspectRatio: 18 / 8,
                child: Center(
                  child: Text(place[_current]),
                )),
          ],
        ),
      ),
    );
  }
}
