import 'package:equatable/equatable.dart';

class ValidateFormState extends Equatable {
  @override
  List<Object> get props => [];
}

class SignUpFormSuccessfulState extends ValidateFormState {}

class FormErrorState extends ValidateFormState {
  final String errMsg;

  FormErrorState(this.errMsg);
}

class EmailErrorState extends FormErrorState {
  EmailErrorState(String errMsg) : super(errMsg);
}

class PasswordErrorState extends FormErrorState {
  PasswordErrorState(String errMsg) : super(errMsg);
}

class ConfirmErrorState extends FormErrorState {
  ConfirmErrorState(String errMsg) : super(errMsg);
}

class CheckBoxErrorState extends FormErrorState {
  CheckBoxErrorState(String errMsg) : super(errMsg);
}

class EmailEmptyErrorState extends FormErrorState {
  EmailEmptyErrorState(String errMsg) : super(errMsg);
}

class PasswordEmptyErrorState extends FormErrorState {
  PasswordEmptyErrorState(String errMsg) : super(errMsg);
}

class ConfirmPasswordEmptyErrorState extends FormErrorState {
  ConfirmPasswordEmptyErrorState(String errMsg) : super(errMsg);
}
