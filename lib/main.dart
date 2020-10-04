import 'package:device_preview/device_preview.dart';
import 'package:e_com/view/responsive_setup/device_size_config.dart';
import 'package:e_com/view/signup/signup_view.dart';
import 'package:e_com/routes/routes.dart';
import 'package:e_com/util/constants/color_const.dart';
import 'package:e_com/view/login/login_view.dart';
import 'package:e_com/view/onboard/onboard_view.dart';
import 'package:e_com/view/responsive_setup/responsive_builder.dart';
import 'package:e_com/viewmodel/bloc/page_bloc/page_change_bloc.dart';
import 'package:e_com/viewmodel/bloc/validate_signup_form_bloc.dart';
import 'package:e_com/viewmodel/state/validate_form_state/validate_signup_form_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() =>
//runApp(DevicePreview(builder: (ctx) => App()));
    runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ValidateSignUpFormBloc()),
        BlocProvider(create: (context) => PageChangeBloc()),
      ],
      child: ResponsiveBuilder(builder: (ctx) {
        return MaterialApp(
          theme: ThemeData(
            primaryColor: kPrimaryColor,
          ),
          initialRoute: Routes.onboard,
          routes: {
            Routes.login: (ctx) => Login(),
            Routes.signup: (ctx) => SignUp(),
            Routes.onboard: (ctx) {
              return ResponsiveBuilder(
                builder: (ctx) => OnBoardView(),
              );
            }
          },
        );
      }),
    );
  }
}
