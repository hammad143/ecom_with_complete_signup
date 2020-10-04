import 'package:e_com/util/constants/color_const.dart';
import 'package:e_com/util/constants/main_const.dart';
import 'package:e_com/view/responsive_setup/device_size_config.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key key,
    @required this.controller,
    this.hintText,
    this.suffixIcon,
    this.contentPadding = const EdgeInsets.only(left: 10),
    this.obscureText = false,
  }) : super(key: key);

  final TextEditingController controller;
  final String hintText;
  final Widget suffixIcon;
  final EdgeInsets contentPadding;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: DeviceSizeConfig.widgetScaleFactor * 10,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kDefaultPadding * 2),
        color: kPrimaryColor,
      ),
      child: TextField(
        onChanged: (text) {},
        style: TextStyle(color: Colors.white, fontSize: kNormalFontSize),
        controller: controller,
        smartDashesType: SmartDashesType.enabled,
        obscureText: obscureText,
        decoration: InputDecoration(
            contentPadding: contentPadding,
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.white),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            suffixIcon: suffixIcon),
      ),
    );
  }
}
