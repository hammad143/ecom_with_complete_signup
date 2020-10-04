import 'package:bloc/bloc.dart';
import 'package:e_com/viewmodel/events/page_events/page_change_event.dart';
import 'package:e_com/viewmodel/events/page_events/page_event.dart';
import 'package:e_com/viewmodel/onboard_viewmodel/onboard_viewmodel.dart';
import 'package:e_com/viewmodel/state/page_state/page_change_state.dart';
import 'package:e_com/viewmodel/state/page_state/page_initial_state.dart';
import 'package:e_com/viewmodel/state/page_state/page_state.dart';

class PageChangeBloc extends Bloc<PageEvent, PageState> {
  final PageInitialState initialState;
  PageChangeBloc({this.initialState = const PageInitialState()})
      : super(initialState);

  @override
  Stream<PageState> mapEventToState(PageEvent event) async* {
    if (event is PageChangeEvent) {
      yield PageChangeState(pageIndex: event.pageIndex);
    }
  }
}
