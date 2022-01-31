import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

//homePage Height Box
class HeightBox25 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25.0,
    );
  }
}

//HomePage WidthBox
class WidthBox10 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 10.0,
    );
  }
}

//HomePage Circle Buttons
class ScrollSingle extends StatelessWidget {
  ScrollSingle({
    required this.title,
    required this.mainIcon,
    required this.onPressed,
  });
  final String title;
  final VoidCallback onPressed;
  final IconData mainIcon;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          style: TextButton.styleFrom(
            alignment: Alignment.center,
            backgroundColor: kSecondaryColor,
            primary: Colors.white,
            padding: EdgeInsets.all(20.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100.0), // <-- Radius
            ),
          ),
          onPressed: onPressed,
          child: Icon(Icons.ten_k_outlined),
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          title,
          style: TextStyle(color: kTextColor, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}

//HomePage Two by two = four Large Buttons
class ButtonSingle extends StatelessWidget {
  ButtonSingle(
      {required this.title,
      required this.mainIcon,
      required this.onPressed,
      required this.colour});
  final String title;
  final Color colour;
  final VoidCallback onPressed;
  final IconData mainIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.0,
      height: 100.0,
      child: TextButton(
        style: TextButton.styleFrom(
          alignment: Alignment.center,
          primary: Colors.white,
          padding: EdgeInsets.all(20.0),
          side: BorderSide(color: kPrimaryColor, width: 5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0), // <-- Radius
          ),
        ),
        onPressed: onPressed,
        child: Column(
          // Replace with a Row for horizontal icon + text
          children: <Widget>[
            Icon(mainIcon),
            Text(
              title,
              style: TextStyle(
                fontSize: 10.0,
                color: colour,
              ),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}

//HomePage Slider
class SliderButtonText extends StatelessWidget {
  SliderButtonText(
      {required this.title, required this.onPressed, required this.colour});
  final String title;
  final Color colour;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.w600,
            fontFamily: 'Mukta',
            color: colour,
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: kPrimaryColor,
          ),
          onPressed: onPressed,
          child: Text(
            "Use Now >",
          ),
        ),
      ],
    );
  }
}
//Large button Homepage

class TextButtonHomepage extends StatelessWidget {
  const TextButtonHomepage(
      {required this.onPressed,
      required this.mainIcon,
      required this.mainTitle,
      required this.secondTitle,
      required this.edgeInsetss});
  final String mainTitle;
  final String secondTitle;
  final IconData mainIcon;
  final VoidCallback onPressed;
  final EdgeInsets edgeInsetss;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      style: TextButton.styleFrom(
        primary: Colors.purple,
        backgroundColor: kPrimaryColor,
        padding: edgeInsetss,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0), // <-- Radius
        ),
      ),
      onPressed: onPressed,
      label: Align(
        alignment: AlignmentDirectional.bottomCenter,
        child: Text.rich(
          TextSpan(
            text: mainTitle, // default text style
            children: <TextSpan>[
              TextSpan(
                  text: secondTitle,
                  style: TextStyle(fontStyle: FontStyle.italic)),
            ],
          ),
        ),
      ),
      icon: Align(
        alignment: AlignmentDirectional.topCenter,
        child: Icon(
          mainIcon,
          color: Colors.pink,
          size: 24.0,
        ),
      ),
    );
  }
}

//signIn and SignUp Page
class RoundedButton extends StatelessWidget {
  RoundedButton(
      {required this.title, required this.colour, required this.onPressed});
  final String title;
  final Color colour;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: colour,
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      // elevation: 5.0,
      child: MaterialButton(
        onPressed: onPressed,
        minWidth: 400.0,
        height: 42.0,
        child: Text(
          title,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

//Profile Buttons
class ProfileButtons extends StatelessWidget {
  ProfileButtons({
    required this.title,
    required this.imageUrl,
    required this.onPressed,
    required this.colour,
  });
  final String title;
  final VoidCallback onPressed;
  final String imageUrl;
  final Color colour;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.transparent,
        onPrimary: kPrimaryColor,
      ),
      onPressed: onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
              padding: const EdgeInsets.all(2.0),
              child: ImageIcon(
                AssetImage(imageUrl),
                size: 30,
                color: colour,
              )),
          SizedBox(
            height: 10.0,
          ),
          Text(
            title,
            style: TextStyle(
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }
}

//Profile Button
class ProfileButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.transparent,
              onPrimary: kPrimaryColor,
            ),
            onPressed: () {},
            child: Icon(
              Icons.account_circle,
              color: Colors.black,
              size: 80.0,
            )),
        Text(
          'Please Login!',
          style: TextStyle(
            fontSize: 30,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}

//profile widget

class ProfilePostWidgets extends StatelessWidget {
  ProfilePostWidgets({required this.name, required this.numberPosts});
  final String numberPosts;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          numberPosts,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          name,
          style: TextStyle(
            fontSize: 15,
            letterSpacing: 0.4,
          ),
        )
      ],
    );
  }
}
