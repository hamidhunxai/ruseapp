import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ruse/components/constants.dart';

class Templates extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      body: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(10.0), scrollDirection: Axis.vertical,
        // Generate 100 widgets that display their index in the List.
        children: [
          Object(
            name: 'Object 1',
            imageUrl: 'assets/images/sliders/1.jpg',
            onPressed: () {},
          ),
          Object(
            name: 'Object 1',
            imageUrl: 'assets/images/sliders/2.jpg',
            onPressed: () {},
          ),
          Object(
            name: 'Object 1',
            imageUrl: 'assets/images/sliders/1.jpg',
            onPressed: () {},
          ),
          Object(
            name: 'Object 1',
            imageUrl: 'assets/images/sliders/3.jpg',
            onPressed: () {},
          ),
          Object(
            name: 'Object 1',
            imageUrl: 'assets/images/sliders/4.jpg',
            onPressed: () {},
          ),
          Object(
            name: 'Object 1',
            imageUrl: 'assets/images/sliders/1.jpg',
            onPressed: () {},
          ),
          Object(
            name: 'Object 1',
            imageUrl: 'assets/images/sliders/2.jpg',
            onPressed: () {},
          ),
          Object(
            name: 'Object 1',
            imageUrl: 'assets/images/sliders/1.jpg',
            onPressed: () {},
          ),
          Object(
            name: 'Object 1',
            imageUrl: 'assets/images/sliders/3.jpg',
            onPressed: () {},
          ),
          Object(
            name: 'Object 1',
            imageUrl: 'assets/images/sliders/4.jpg',
            onPressed: () {},
          ),
          Object(
            name: 'Object 1',
            imageUrl: 'assets/images/sliders/1.jpg',
            onPressed: () {},
          ),
          Object(
            name: 'Object 1',
            imageUrl: 'assets/images/sliders/2.jpg',
            onPressed: () {},
          ),
          Object(
            name: 'Object 1',
            imageUrl: 'assets/images/sliders/1.jpg',
            onPressed: () {},
          ),
          Object(
            name: 'Object 1',
            imageUrl: 'assets/images/sliders/3.jpg',
            onPressed: () {},
          ),
          Object(
            name: 'Object 1',
            imageUrl: 'assets/images/sliders/4.jpg',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class Object extends StatelessWidget {
  Object({required this.name, required this.imageUrl, required this.onPressed});

  final String name;
  final String imageUrl;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imageUrl),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Text(
              name,
              style: TextStyle(
                fontSize: 24.0,
                color: kTextColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
