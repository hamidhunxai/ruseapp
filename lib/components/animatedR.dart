import 'package:flutter/cupertino.dart';
import 'dart:math' as math;

class AnimattedR extends StatefulWidget {
  @override
  _AnimattedRState createState() => _AnimattedRState();
}

class _AnimattedRState extends State<AnimattedR> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 10),
    vsync: this,
  )..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedRuse(controller: _controller);
  }
}

class AnimatedRuse extends StatelessWidget {
  const AnimatedRuse({
    Key? key,
    required AnimationController controller,
  })  : _controller = controller,
        super(key: key);

  final AnimationController _controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Container(
              alignment: Alignment.center,
              child: AnimatedBuilder(
                animation: _controller,
                child: Container(
                  child: Image.asset(
                    'assets/images/r.png',
                    width: 100,
                    height: 100,
                    fit: BoxFit.contain,
                  ),
                ),
                builder: (BuildContext context, Widget? child) {
                  return Transform.rotate(
                    angle: _controller.value * 6.3 * math.pi,
                    child: child,
                  );
                },
              )),
        ),
        SizedBox(
          width: 10.0,
        ),
        Container(width: 150.0, child: Image.asset('assets/images/use.png')),
      ],
    );
  }
}
