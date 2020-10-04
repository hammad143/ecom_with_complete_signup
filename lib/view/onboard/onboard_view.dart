// model of onboard
import 'package:e_com/model/onboard_model/onboard_model.dart';
import 'package:e_com/util/constants/color_const.dart';
import 'package:e_com/util/constants/main_const.dart';
import 'package:e_com/view/components/custom_scroll_behavior.dart';
import 'package:e_com/view/components/theme_padded_widget.dart';
import 'package:e_com/view/onboard/components/on_board_page_comp.dart';
import 'package:e_com/view/onboard/components/onboard_bottom_nav_comp.dart';
import 'package:e_com/view/responsive_setup/device_size_config.dart';
import 'package:e_com/view/responsive_setup/local_widget_builder.dart';
import 'package:e_com/viewmodel/bloc/page_bloc/page_change_bloc.dart';
import 'package:e_com/viewmodel/events/page_events/page_change_event.dart';
import 'package:e_com/viewmodel/onboard_viewmodel/onboard_viewmodel.dart';
import 'package:e_com/viewmodel/state/page_state/page_change_state.dart';
import 'package:e_com/viewmodel/state/page_state/page_initial_state.dart';
import 'package:e_com/viewmodel/state/page_state/page_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/* 
  1) on next button click post increment passed as an argument in event call;
  2) receive the state from BlocBuilder
  3)

 */

class OnBoardView extends StatelessWidget {
  final _pageList = OnBoardViewModel.onBoardModelList;
  final PageController _pageController = PageController(initialPage: 0);
  int pageIndex = 1;
  @override
  Widget build(BuildContext context) {
    final _bloc = context.bloc<PageChangeBloc>();
    return Scaffold(
      body: SafeArea(
        child: AppDefaultPadded(
          horizontal: kDefaultPadding,
          vertical: kDefaultPadding,
          child: LocalWidgetBuilder(
            builder: (ctx, constraints, localFactor) {
              return Column(
                children: [
                  Expanded(
                    flex: 5,
                    child: PageView.builder(
                      onPageChanged: (index) =>
                          _bloc.add(PageChangeEvent(index)),
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: _pageList.length,
                      controller: _pageController,
                      itemBuilder: (ctx, index) {
                        return OnBoardPage(pageList: _pageList, index: index);
                      },
                    ),
                  ),
                  BlocBuilder<PageChangeBloc, PageState>(
                    builder: (context, state) {
                      return OnBoardBottomNavigationComp(
                        pageList: _pageList,
                        state: state,
                        pageController: _pageController,
                      );
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
