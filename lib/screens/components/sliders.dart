import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:ruse/screens/objectRemover/image_pro.dart';
import 'boxAndButtons.dart';
import 'constants.dart';

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
          onPressed: () {
            Navigator.pushNamed(context, ImagePro.id);
          },
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
          onPressed: () {
            Navigator.pushNamed(context, ImagePro.id);
          },
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
          onPressed: () {
            Navigator.pushNamed(context, ImagePro.id);
          },
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

class Sliderz extends StatefulWidget {
  const Sliderz({Key? key}) : super(key: key);

  @override
  _SliderzState createState() => _SliderzState();
}

class _SliderzState extends State<Sliderz> {
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

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(
          left: 20.0,
          right: 20.0,
        ),
        child: buildCarouselSlider());
  }
}
