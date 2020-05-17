import 'package:flutter/widgets.dart';

class AdaptiveDimensions {
  static MediaQueryData _mediaQuery;
  static double _widthScaleFactor;
  static double _heightScaleFactor;
  static double _textScaleFactor;

  static AdaptiveDimensions instance;

  AdaptiveDimensions._internal(BuildContext buildContext, double referenceWidth,
      double referenceHeight) {
    _mediaQuery = MediaQuery.of(buildContext);
    _widthScaleFactor = _mediaQuery.size.width / referenceWidth;
    _heightScaleFactor = _mediaQuery.size.height / referenceHeight;
    _textScaleFactor = _mediaQuery.textScaleFactor;
  }

  static init(BuildContext buildContext, double referenceWidth,
      double referenceHeight) {
    instance = AdaptiveDimensions._internal(
        buildContext, referenceWidth, referenceHeight);
  }

  width(double width) => (width * _widthScaleFactor).toInt().toDouble();

  height(double height) => (height * _heightScaleFactor).toInt().toDouble();

  size(double fontSize, {bool scale = true}) =>
      scale ? width(fontSize) / _textScaleFactor : width(fontSize);

  top(double top) => (top * _heightScaleFactor).toInt().toDouble();

  bottom(double bottom) => (bottom * _heightScaleFactor).toInt().toDouble();

  left(double left) => (left * _widthScaleFactor).toInt().toDouble();

  right(double right) => (right * _widthScaleFactor).toInt().toDouble();

  fullWidth() => _mediaQuery.size.width;

  fullHeight() => _mediaQuery.size.height;
}
