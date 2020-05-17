import 'package:covid_in/core/presentation/base_screen/base_stateless_widget.dart';
import 'package:flutter/material.dart';

class AppBarDesktop extends BaseStatelessWidget{

  @override
  Widget setView(context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: width(8), vertical: height(16)),
      child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Text('Covid.in', style: Theme.of(context).textTheme.headline3.apply(color: Colors.black, fontWeightDelta: 2),),
        Row(
          children: <Widget>[
            FlatButton(onPressed: (){}, child: Text('Dashboard')),
            FlatButton(onPressed: (){}, child: Text('District Zone'))
          ],
        )
      ],
    ));
  }
}