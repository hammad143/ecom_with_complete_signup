import 'package:e_com/view/responsive_setup/device_size_config.dart';
import 'package:flutter/material.dart';

class DeviceTypeLayout extends StatelessWidget {
  final Widget landscape, portrait;

  const DeviceTypeLayout({Key key, this.landscape, this.portrait})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final orientation = DeviceSizeConfig.deviceSizeInfo.orientation;
    print(orientation);
    return orientation == Orientation.landscape ? landscape : portrait;
  }
}
