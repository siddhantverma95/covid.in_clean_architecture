import 'package:flutter/material.dart';

import '../adaptive_dimension.dart';

abstract class BaseStatelessWidget extends StatelessWidget{
  AdaptiveDimensions _dimension;
  
  BaseStatelessWidget({Key key});

  void initDimension(BuildContext context){

    AdaptiveDimensions.init(context, 375, 850);
    _dimension = AdaptiveDimensions.instance;
  }
  @override
  Widget build(BuildContext context) {
    initDimension(context);
    return setView(context);
  }

  AdaptiveDimensions getAdaptiveDimensions(){
    return _dimension;
  }

  Widget setView(BuildContext context);

  width(double width) => getAdaptiveDimensions().width(width);

  height(double height) => getAdaptiveDimensions().height(height);

  fieldHeight() => 40;

  textSize(double fontSize, {bool scale = true}) =>
      getAdaptiveDimensions().size(fontSize, scale: scale) < 12
          ? 12.0
          : getAdaptiveDimensions().size(fontSize, scale: scale);

  top(double top) => getAdaptiveDimensions().top(top);

  bottom(double bottom) => getAdaptiveDimensions().bottom(bottom);

  left(double left) => getAdaptiveDimensions().left(left);

  right(double right) => getAdaptiveDimensions().right(right);

  fullWidth() => getAdaptiveDimensions().fullWidth();

  fullHeight() => getAdaptiveDimensions().fullHeight();
}