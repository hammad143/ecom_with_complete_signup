import 'package:e_com/util/constants/color_const.dart';
import 'package:e_com/util/constants/main_const.dart';
import 'package:e_com/util/constants/style.dart';
import 'package:e_com/util/specific_bloc_get.dart';

import 'package:e_com/view/signup/components/already_have_account.dart';
import 'package:e_com/view/signup/components/custom_text_field.dart';
import 'package:e_com/view/signup/components/sign_up_btn.dart';
import 'package:e_com/viewmodel/bloc/validate_signup_form_bloc.dart';
import 'package:e_com/viewmodel/state/validate_form_state/validate_signup_form_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FormFields extends StatelessWidget {
  final TextEditingController emailController,
      passController,
      confirmPassController;
  final bool isChecked;
  final VoidCallback onCheckBoxPress, onRegister;

  const FormFields({
    Key key,
    this.emailController,
    this.passController,
    this.confirmPassController,
    this.isChecked = false,
    this.onCheckBoxPress,
    this.onRegister,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) =>
          BlocBuilder<ValidateSignUpFormBloc, ValidateFormState>(
              builder: (ctx, state) {
        print(state.runtimeType);
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextField(
              controller: emailController,
              hintText: "Enter an email",
            ),
            if (state is EmailEmptyErrorState) errorMsgWidget(state),
            if (state is EmailErrorState) errorMsgWidget(state),
            SizedBox(height: kDefaultSpacer),
            CustomTextField(
              controller: passController,
              hintText: "Enter a password",
              contentPadding: EdgeInsets.only(left: 10, top: 15),
              obscureText: true,
              suffixIcon: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.visibility_off,
                  color: Colors.white,
                ),
              ),
            ),
            if (state is PasswordEmptyErrorState) errorMsgWidget(state),
            if (state is PasswordErrorState) errorMsgWidget(state),
            SizedBox(height: kDefaultSpacer),
            CustomTextField(
              controller: confirmPassController,
              hintText: "Enter a confirm password",
              obscureText: true,
              contentPadding: EdgeInsets.only(left: 10, top: 15),
              suffixIcon: IconButton(
                splashColor: transparent,
                splashRadius: 1,
                onPressed: () {
                  print("pressed");
                },
                icon: Icon(
                  Icons.visibility_off,
                  color: Colors.white,
                ),
              ),
            ),
            if (state is ConfirmPasswordEmptyErrorState) errorMsgWidget(state),
            if (state is ConfirmErrorState) errorMsgWidget(state),
            SizedBox(height: kDefaultSpacer),
            GestureDetector(
              onTap: onCheckBoxPress,
              child: Row(
                children: [
                  Checkbox(
                    activeColor: kPrimaryColor,
                    value: isChecked,
                    onChanged: (value) => onCheckBoxPress(),
                  ),
                  Text(
                    "I accept the terms and conditions",
                    style: Style.black54,
                  ),
                ],
              ),
            ),
            if (state is CheckBoxErrorState) errorMsgWidget(state),
            SizedBox(height: kDefaultSpacer),
            SignUpButton(
              onRegister: onRegister,
            ),
            SizedBox(height: kDefaultSpacer),
            AlreadyHaveAccount(),
          ],
        );
      }),
    );
  }

  errorMsgWidget(FormErrorState state) {
    return Align(
      alignment: Alignment.centerLeft,
      child: ErrorMessageContainer(errMsg: state.errMsg),
    );
  }
}

class ErrorMessageContainer extends StatelessWidget {
  final _duration = Duration(milliseconds: 300);
  final String errMsg;

  ErrorMessageContainer({Key key, this.errMsg}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      padding: EdgeInsets.only(left: 20, top: 5),
      duration: _duration,
      child: Text(errMsg,
          style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold)),
    );
  }
}
