import 'package:e_com/view/responsive_setup/device_size_info.dart';
import 'package:flutter/cupertino.dart';

class DeviceSizeConfig extends DeviceSizeInfo {
  static double deviceBlockWidth,
      deviceBlockHeight,
      widgetScaleFactor,
      textScaleFactor;
  static DeviceSizeInfo deviceSizeInfo;
  static DeviceSizeConfig _sizeConfig;

  DeviceSizeConfig._(BoxConstraints constraints, Orientation orientation) {
    deviceSizeInfo = this;
    deviceHeight = constraints.maxHeight;
    deviceWidth = constraints.maxWidth;
    this.orientation = orientation;
    deviceBlockHeight = deviceHeight / 100;
    deviceBlockWidth = deviceWidth / 100;
    widgetScaleFactor = orientation == Orientation.landscape
        ? deviceBlockHeight
        : deviceBlockWidth;
    textScaleFactor = widgetScaleFactor;
  }

  factory DeviceSizeConfig() => _sizeConfig;

  static initilize(BoxConstraints constraints, Orientation orientation) =>
      _sizeConfig = DeviceSizeConfig._(constraints, orientation);
}
