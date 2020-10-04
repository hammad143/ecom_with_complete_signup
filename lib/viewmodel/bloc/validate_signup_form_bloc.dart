import 'package:bloc/bloc.dart';
import 'package:e_com/viewmodel/events/form_validation_events/validate_signup_form_event.dart';
import 'package:e_com/viewmodel/state/validate_form_state/validate_signup_form_state.dart';

class ValidateSignUpFormBloc
    extends Bloc<ValidateSignUpFormEvent, ValidateFormState> {
  ValidateSignUpFormBloc({ValidateFormState initialState})
      : super(initialState);

  @override
  Stream<ValidateFormState> mapEventToState(
      ValidateSignUpFormEvent event) async* {
    print(event.email.isEmpty);
    if (event.email.isEmpty)
      yield EmailEmptyErrorState("Email is required");
    else if (event.password.isEmpty)
      yield PasswordEmptyErrorState("Password is required");
    else if (event.confirmPass.isEmpty)
      yield ConfirmPasswordEmptyErrorState("Confirm Password is required");
    else if (event.email != "hammad@gmail.com")
      yield EmailErrorState("Email is not correct");
    else if (event.password != "mason")
      yield PasswordErrorState("Password is incorrect");
    else if (event.confirmPass != event.password)
      yield ConfirmErrorState("Confirm password doesn't match");
    else if (!event.isChecked)
      yield CheckBoxErrorState(
          "It's required to accept the terms and conditions");
    else
      yield SignUpFormSuccessfulState();
  }
}
