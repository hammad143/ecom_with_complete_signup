import 'package:e_com/viewmodel/onboard_viewmodel/onboard_viewmodel.dart';
import 'package:e_com/viewmodel/state/page_state/page_state.dart';
import 'package:equatable/equatable.dart';

class PageChangeState extends PageState {
  int pageIndex = 0;

  PageChangeState({this.pageIndex});

  @override
  List<Object> get props => [pageIndex];
}
