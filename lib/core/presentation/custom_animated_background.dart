import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';

import 'base_screen/base_stateful_widget.dart';

class CustomAnimatedBackground extends BaseStatefulWidget {
  final Widget child;
  final Color color;

  CustomAnimatedBackground({Key key, @required this.child, @required this.color}) : super(key);
  

  @override
  _CustomAnimatedBackgroundState createState() => _CustomAnimatedBackgroundState();
}

class _CustomAnimatedBackgroundState extends BaseState<CustomAnimatedBackground> with TickerProviderStateMixin{

  @override
  Widget setView(BuildContext context) {
    return AnimatedBackground(
      vsync: this,
      behaviour: RandomParticleBehaviour(
        options: ParticleOptions(
          image: Image.asset('assets/images/corona.png'),
          baseColor: widget.color,
          maxOpacity: .7,
          minOpacity: .4,
          spawnMaxRadius: width(30),
          spawnMinRadius: width(10),
          particleCount: 8,
          spawnMinSpeed: 5,
          spawnMaxSpeed: 10


        )
      ),
      child: widget.child,
    );
  }
}