import 'package:e_com/viewmodel/state/page_state/page_state.dart';

class PageInitialState extends PageState {
  final int pageIndex = 0;
  const PageInitialState();

  @override
  List<Object> get props => [pageIndex];
}
