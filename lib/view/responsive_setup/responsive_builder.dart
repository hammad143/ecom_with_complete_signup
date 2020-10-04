import 'package:e_com/view/responsive_setup/device_size_config.dart';
import 'package:flutter/material.dart';

typedef ResponsiveWidgetBuilder = Widget Function(BuildContext);

class ResponsiveBuilder extends StatelessWidget {
  final ResponsiveWidgetBuilder builder;

  const ResponsiveBuilder({Key key, @required this.builder}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints) => OrientationBuilder(
        builder: (ctx, orientation) {
          DeviceSizeConfig.initilize(constraints, orientation);
          return builder(ctx);
        },
      ),
    );
  }
}
