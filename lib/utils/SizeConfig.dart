import 'package:flutter/material.dart';

class SizeConfig {
  static MediaQueryData _mediaQueryData;
  static double screenWidth;
  static double screenHeight;
  static double blockSizeHorizontal;
  static double blockSizeVertical;

  static double _safeAreaHorizontal;
  static double _safeAreaVertical;
  static double safeBlockHorizontal;
  static double safeBlockVertical;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;

    print('Screen_Width $screenWidth');
    print('Screen_Height $screenHeight');

    _safeAreaHorizontal = _mediaQueryData.padding.left +
        _mediaQueryData.padding.right;
    _safeAreaVertical = _mediaQueryData.padding.top +
        _mediaQueryData.padding.bottom;
    safeBlockHorizontal = (screenWidth -
        _safeAreaHorizontal) / 100;
    safeBlockVertical = (screenHeight -
        _safeAreaVertical) / 100;
  }

  static double getDeviceScreenSize(context){

    if (MediaQuery.of(context).size.height.toDouble() > 790){
      // Large Screen Device
      print(MediaQuery.of(context).size.height.toString());
      return 2;
    }else if (780 > MediaQuery.of(context).size.height.toDouble() && MediaQuery.of(context).size.height.toDouble() > 680){
      // Medium Screen Device
      print(MediaQuery.of(context).size.height.toString());
      return 1;
    }else if (500 < MediaQuery.of(context).size.height.toDouble() && MediaQuery.of(context).size.height.toDouble() < 600){
      // Small Screen Device
      print(MediaQuery.of(context).size.height.toString());
      return 0;
    }

  }

}