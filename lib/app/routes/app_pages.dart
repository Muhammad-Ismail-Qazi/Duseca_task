import 'package:get/get.dart';

import 'package:duseca_task_2/app/modules/choose_language/bindings/choose_language_binding.dart';
import 'package:duseca_task_2/app/modules/choose_language/views/choose_language_view.dart';
import 'package:duseca_task_2/app/modules/create_event/bindings/create_event_binding.dart';
import 'package:duseca_task_2/app/modules/create_event/views/create_event_view.dart';
import 'package:duseca_task_2/app/modules/home/bindings/home_binding.dart';
import 'package:duseca_task_2/app/modules/home/views/home_view.dart';
import 'package:duseca_task_2/app/modules/login/bindings/login_binding.dart';
import 'package:duseca_task_2/app/modules/login/views/login_view.dart';
import 'package:duseca_task_2/app/modules/send_otp/bindings/send_otp_binding.dart';
import 'package:duseca_task_2/app/modules/send_otp/views/send_otp_view.dart';
import 'package:duseca_task_2/app/modules/signup/bindings/signup_binding.dart';
import 'package:duseca_task_2/app/modules/signup/views/signup_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SIGNUP;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => SignupView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SEND_OTP,
      page: () => SendOtpView(),
      binding: SendOtpBinding(),
    ),
    GetPage(
      name: _Paths.CHOOSE_LANGUAGE,
      page: () => ChooseLanguageView(),
      binding: ChooseLanguageBinding(),
    ),
    GetPage(
      name: _Paths.CREATE_EVENT,
      page: () => CreateEventView(),
      binding: CreateEventBinding(),
    ),
  ];
}