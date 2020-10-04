import 'package:e_com/routes/routes.dart';
import 'package:e_com/util/constants/color_const.dart';
import 'package:e_com/util/constants/main_const.dart';
import 'package:e_com/view/responsive_setup/device_size_config.dart';
import 'package:e_com/view/responsive_setup/local_widget_builder.dart';
import 'package:e_com/view/signup/signup_view.dart';
import 'package:e_com/viewmodel/bloc/page_bloc/page_change_bloc.dart';
import 'package:e_com/viewmodel/events/page_events/page_change_event.dart';
import 'package:e_com/viewmodel/state/page_state/page_change_state.dart';
import 'package:e_com/viewmodel/state/page_state/page_initial_state.dart';
import 'package:e_com/viewmodel/state/page_state/page_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnBoardBottomNavigationComp extends StatelessWidget {
  final PageState state;
  int _dotIndex = 0;
  final List pageList;
  final PageController pageController;

  PageChangeBloc _bloc;
  OnBoardBottomNavigationComp(
      {Key key, this.state, this.pageList, this.pageController})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    print("${DeviceSizeConfig.deviceSizeInfo.deviceHeight}");
    _bloc = BlocProvider.of<PageChangeBloc>(context);
    return Expanded(
      child: LocalWidgetBuilder(builder: (ctx, constraints, factor) {
        if (state is PageInitialState) {
          return buildBottomRowWithSkip();
        } else {
          final _state = (state as PageChangeState);
          if (_state.pageIndex == pageList.length - 1) {
            return Container(
              alignment: Alignment.center,
              width: constraints.maxWidth,
              child: MaterialButton(
                color: kPrimaryColor,
                minWidth: constraints.maxWidth,
                height: DeviceSizeConfig.widgetScaleFactor * 8,
                onPressed: () => reDirectToSignUp(context),
                child: Text("Get Started",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: kNormalFontSize,
                    )),
              ),
            );
          }
          _dotIndex = _state.pageIndex;

          return buildBottomRowWithSkip();
        }
      }),
    );
  }

  _buildIndicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      margin: EdgeInsets.symmetric(horizontal: 5),
      width: isActive ? 25 : 10,
      height: 10,
      decoration: BoxDecoration(
        color: isActive ? kPrimaryColor : Colors.grey,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }

  List<Widget> _buildIndicatorList() {
    List _items = <Widget>[];
    for (int i = 0; i < pageList.length; i++) {
      if (i == _dotIndex)
        _items.add(_buildIndicator(true));
      else
        _items.add(_buildIndicator(false));
    }
    return _items;
  }

  Widget buildBottomRowWithSkip() {
    return Builder(
      builder: (ctx) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MaterialButton(
            onPressed: () {},
            child: Text("Skip"),
          ),
          Row(
            children: _buildIndicatorList(),
          ),
          Container(
            height: DeviceSizeConfig.widgetScaleFactor * 10,
            width: DeviceSizeConfig.widgetScaleFactor * 10,
            child: Material(
              color: kPrimaryColor,
              shape: CircleBorder(),
              child: InkWell(
                customBorder: CircleBorder(),
                onTap: nextPage,
                child: Icon(Icons.arrow_forward, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  nextPage() {
    if (_dotIndex != pageList.length)
      pageController.animateToPage(
        _dotIndex + 1,
        duration: Duration(milliseconds: 500),
        curve: Curves.ease,
      );
  }

  reDirectToSignUp(ctx) {
    Navigator.pushReplacement(
        ctx, MaterialPageRoute(builder: (ctx) => SignUp()));
    /* Navigator.pushReplacementNamed(
      ctx,
      Routes.signup,
    ); */
  }
}
