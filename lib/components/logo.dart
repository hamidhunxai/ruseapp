import 'package:flutter/cupertino.dart';

class Logo extends StatelessWidget {
  const Logo({
    Key? key,
  }) : super(key: key);

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
