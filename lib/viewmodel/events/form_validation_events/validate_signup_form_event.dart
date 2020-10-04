import 'package:equatable/equatable.dart';

class ValidateSignUpFormEvent extends Equatable {
  final String email, password, confirmPass;
  final bool isChecked;
  ValidateSignUpFormEvent(
      this.email, this.password, this.confirmPass, this.isChecked);
  @override
  List<Object> get props => [];
}
