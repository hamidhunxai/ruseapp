import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:ruse/components/constants.dart';
import 'boxAndButtons.dart';

class Item1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/sliders/1.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: SliderButtonText(
          onPressed: () {},
          title: 'Object Manipulator',
          colour: kSecondaryColor,
        ),
      ),
    );
  }
}

class Item2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/sliders/2.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 70.0),
        child: SliderButtonText(
          onPressed: () {},
          title: 'Background Changer',
          colour: kSecondaryColor,
        ),
      ),
    );
  }
}

class Item3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/sliders/3.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: SliderButtonText(
          onPressed: () {},
          title: 'Edit Your Image',
          colour: kSecondaryColor,
        ),
      ),
    );
  }
}

class Item4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/sliders/4.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: SliderButtonText(
          onPressed: () {},
          title: 'Colorize Your Photo',
          colour: kTextColor,
        ),
      ),
    );
  }
}

List cardList = [Item1(), Item2(), Item3(), Item4()];

// ignore: unused_element
int _currentIndex = 0;

CarouselSlider buildCarouselSlider() {
  return CarouselSlider(
    options: CarouselOptions(
      viewportFraction: 1,
      height: 200.0,
      autoPlay: true,
      autoPlayInterval: Duration(seconds: 3),
      autoPlayAnimationDuration: Duration(milliseconds: 800),
      autoPlayCurve: Curves.fastOutSlowIn,
      pauseAutoPlayOnTouch: true,
      onPageChanged: (index, reason) {
        setState(() {
          _currentIndex = index;
        });
      },
    ),
    items: cardList.map((card) {
      return Builder(builder: (BuildContext context) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.30,
            width: MediaQuery.of(context).size.width,
            child: Card(
              color: Colors.blueAccent,
              child: card,
            ),
          ),
        );
      });
    }).toList(),
  );
}

void setState(Null Function() param0) {}
