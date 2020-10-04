import 'package:bloc/bloc.dart';
import 'package:e_com/viewmodel/events/input_field_event/input_change_event.dart';
import 'package:e_com/viewmodel/state/input_field_state/input_field_state.dart';

class InputFieldBloc extends Bloc<InputTextChangeEvent, InputTextFieldState> {
  InputFieldBloc({InputTextFieldState initialState}) : super(initialState);

  @override
  Stream<InputTextFieldState> mapEventToState(
      InputTextChangeEvent event) async* {
    yield InputTextFieldState();
  }
}
