import 'package:flutter/material.dart';
import 'package:ruse/components/boxAndButtons.dart';
import 'package:ruse/components/constants.dart';
import 'package:ruse/components/sliders.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: 1200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20.0,
                    right: 20.0,
                  ),
                  child: buildCarouselSlider(),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButtonHomepage(
                        mainTitle: 'Object\n',
                        mainIcon: IconsM.scissors,
                        onPressed: () {},
                        secondTitle: 'Remover Bulk',
                        edgeInsetss: EdgeInsets.all(40.0),
                      ),
                      TextButtonHomepage(
                        mainTitle: ' Picture\n ',
                        mainIcon: IconsM.eraser,
                        onPressed: () {},
                        secondTitle: 'Super Impose',
                        edgeInsetss: EdgeInsets.all(40.0),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40.0, right: 30.0),
                  child: Row(
                    children: [
                      ButtonSingle(
                        onPressed: () {},
                        mainIcon: IconsM.spider_face,
                        title: 'Identify Objects',
                        colour: kTextColor,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      ButtonSingle(
                        onPressed: () {},
                        mainIcon: IconsM.photo_size_select_large,
                        title: 'Picture Editing',
                        colour: kTextColor,
                      ),
                      SizedBox(
                        width: 30.0,
                      ),
                      ButtonSingle(
                        onPressed: () {},
                        mainIcon: IconsM.eraser,
                        title: 'Object Manipulator',
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
                          onPressed: () {},
                        ),
                        WidthBox10(),
                        ScrollSingle(
                          title: 'Picture Identify',
                          mainIcon: IconsM.photo_size_select_large,
                          onPressed: () {},
                        ),
                        WidthBox10(),
                        ScrollSingle(
                          title: 'Resize',
                          mainIcon: IconsM.photo_size_select_large,
                          onPressed: () {},
                        ),
                        WidthBox10(),
                        ScrollSingle(
                          title: 'Colorize',
                          mainIcon: IconsM.adult,
                          onPressed: () {},
                        ),
                        WidthBox10(),
                        ScrollSingle(
                          title: 'Object Identify',
                          mainIcon: IconsM.spider_face,
                          onPressed: () {},
                        ),
                        WidthBox10(),
                        ScrollSingle(
                          title: 'Delete Object',
                          mainIcon: IconsM.eraser,
                          onPressed: () {},
                        ),
                        WidthBox10(),
                        ScrollSingle(
                          title: 'Object Add',
                          mainIcon: Icons.add,
                          onPressed: () {},
                        ),
                      ])),
                ),
                HeightBox25(),
                Column(
                  children: [
                    BigImage(),
                    HeightBox25(),
                    BigImage(),
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
      onTap: () {},
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
