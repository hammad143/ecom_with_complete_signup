import 'package:e_com/model/onboard_model/onboard_model.dart';
import 'package:e_com/util/constants/color_const.dart';
import 'package:e_com/view/responsive_setup/local_widget_builder.dart';
import 'package:flutter/material.dart';

class OnBoardPage extends StatelessWidget {
  final List<OnBoardModel> pageList;
  final int index;

  const OnBoardPage({Key key, this.pageList, this.index = 0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LocalWidgetBuilder(builder: (ctx, constriants, factor) {
      return Column(
        children: [
          Expanded(
            child: Container(
              height: factor * 100,
              child: Image.asset(
                pageList[index].img_src,
              ),
            ),
          ),
          Text(
            "${pageList[index].title}",
            style: TextStyle(
              fontSize: factor * 6,
              fontWeight: FontWeight.bold,
              color: kPrimaryColor,
            ),
          ),
          SizedBox(height: factor * 6),
          Text(
            "${pageList[index].desc}",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: factor * 4,
              fontWeight: FontWeight.bold,
              color: kSecondaryColor,
            ),
          ),
        ],
      );
    });
  }
}
