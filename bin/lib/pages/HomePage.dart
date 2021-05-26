import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation animation;
  String text = 'Hello';

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: Duration(
        seconds: 1,
      ),
      vsync: this,
    );
    animation = Tween(begin: 1.0, end: 2.0).animate(animationController);

    animationController.addStatusListener(animationStatusListener);
    animationController.forward();
  }

  void animationStatusListener(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      animationController.reverse();
    } else if (status == AnimationStatus.dismissed) {
      animationController.forward();
    }
  }
@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animated Circle"),
      ),
      body: AnimatedBuilder(
        animation: animation,
        builder: (BuildContext context, Widget child) {
          final size = 100 * (animation.value);
          return Center(
            child: Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(size/2),
                ),
                color: Colors.red
              ),
              child: Text(text)
            ),
          );
        },
      ),
    );
  }
}
