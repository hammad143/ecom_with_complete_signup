import 'package:e_com/viewmodel/events/page_events/page_event.dart';

class PageChangeEvent extends PageEvent {
  final int pageIndex;

  PageChangeEvent(this.pageIndex);
}
