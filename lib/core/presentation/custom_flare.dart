import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class CustomFlareActor extends StatelessWidget {
  final String flrPath;
  final String flrAnimation;
  const CustomFlareActor({Key key, @required this.flrPath, @required this.flrAnimation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlareActor(
      flrPath,
    alignment:Alignment.center, fit:BoxFit.contain, animation:flrAnimation);
  }
}