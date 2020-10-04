import 'package:flutter/material.dart';

class AppDefaultPadded extends StatelessWidget {
  final double horizontal, vertical;
  final Widget child;

  const AppDefaultPadded(
      {Key key, this.horizontal = 0, this.vertical = 0, @required this.child})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
      child: child,
    );
  }
}
