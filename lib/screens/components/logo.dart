import 'package:flutter/cupertino.dart';

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          "assets/images/R.gif",
          width: 150.0,
        ),
        Image.asset(
          "assets/images/use.png",
          width: 200.0,
        ),
      ],
    );
  }
}
