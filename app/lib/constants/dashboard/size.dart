import 'package:flutter/material.dart';

class DashboardSize extends StatelessWidget {
  late Size _screenSize;
  late double _height;
  late double _width;
  late double _customeContainerHeight;
  late double _customeContainerWidth;

  Size get getscreenSize {
    return this._screenSize;
  }

  double get getHeight {
    return this._height;
  }

  double get getWidth {
    return this._width;
  }

  @override
  Widget build(BuildContext context) {
    this._screenSize = MediaQuery.of(context).size;
    this._height = this._screenSize.height;
    this._width = _screenSize.width;

    return Container();
  }
}
