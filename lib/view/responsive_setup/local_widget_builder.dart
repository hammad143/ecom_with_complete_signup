import 'package:flutter/material.dart';

class LocalWidgetBuilder extends StatelessWidget {
  final Widget Function(BuildContext, BoxConstraints, double) builder;

  const LocalWidgetBuilder({Key key, @required this.builder}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double localFactor;
    return LayoutBuilder(
      builder: (ctx, constraints) {
        final Orientation orientation = MediaQuery.of(ctx).orientation;
        localFactor = orientation == Orientation.landscape
            ? constraints.maxHeight / 100
            : constraints.maxWidth / 100;

        return builder(ctx, constraints, localFactor);
      },
    );
  }
}
