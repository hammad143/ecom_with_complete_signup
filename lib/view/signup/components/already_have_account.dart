import 'package:e_com/util/constants/color_const.dart';
import 'package:e_com/util/constants/main_const.dart';
import 'package:e_com/view/responsive_setup/device_size_config.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AlreadyHaveAccount extends StatelessWidget {
  AlreadyHaveAccount({
    Key key,
  }) : super(key: key);

  final _onTapRecognizer = TapGestureRecognizer();

  @override
  Widget build(BuildContext context) {
    _onTapRecognizer.onTap = onTap;
    return RichText(
      text: TextSpan(
        style: TextStyle(color: Colors.black54, fontSize: kNormalFontSize),
        children: [
          TextSpan(text: "Already have an acount?"),
          TextSpan(text: " "),
          WidgetSpan(
              alignment: PlaceholderAlignment.middle,
              child: SizedBox(
                width: DeviceSizeConfig.widgetScaleFactor * 9,
                child: Column(
                  children: [
                    Text(
                      "Login",
                      style: TextStyle(
                          color: kPrimaryColor, fontSize: kNormalFontSize),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 1),
                      height: 1,
                      color: kPrimaryColor,
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }

  onTap() {
    print("You are cool");
  }
}
