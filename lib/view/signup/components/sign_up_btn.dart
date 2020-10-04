import 'package:e_com/util/constants/color_const.dart';
import 'package:e_com/util/constants/main_const.dart';
import 'package:e_com/view/responsive_setup/local_widget_builder.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({
    Key key,
    this.onRegister,
  }) : super(key: key);
  final VoidCallback onRegister;

  @override
  Widget build(BuildContext context) {
    return LocalWidgetBuilder(
      builder: (ctx, constraints, factor) => Container(
        width: constraints.maxWidth * .5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              offset: Offset(0, 5),
              color: Colors.black12,
            ),
          ],
        ),
        child: MaterialButton(
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
          color: Colors.white,
          elevation: 0,
          highlightElevation: 0,
          focusElevation: 0,
          hoverElevation: 0,
          onPressed: onRegister,
          child: Text("Sign up",
              style: TextStyle(
                color: kPrimaryColor,
                fontSize: kNormalFontSize,
              )),
        ),
      ),
    );
  }
}
