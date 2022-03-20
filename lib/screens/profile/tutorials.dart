import 'package:flutter/material.dart';

class Tutorials extends StatelessWidget {
  const Tutorials({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar,
      body: SafeArea(
        child: Container(
          child: Text("Tutorials"),
        ),
      ),
    );
  }

  AppBar get buildAppBar {
    return AppBar(
      centerTitle: true,
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/R.gif',
            fit: BoxFit.contain,
            height: 42,
          ),
          Image.asset(
            "assets/images/use.png",
            height: 42,
          ),
          Container(padding: const EdgeInsets.all(8.0))
        ],
      ),
      backgroundColor: const Color(0xff323232),
    );
  }
}
