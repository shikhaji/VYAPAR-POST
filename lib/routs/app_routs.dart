
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vyapar_post/views/Auth/forget_password_screen.dart';
import 'package:vyapar_post/views/Auth/forget_password_verification.dart';
import 'package:vyapar_post/views/Auth/login_screen.dart';
import 'package:vyapar_post/views/Auth/mobile_verification_screen.dart';
import 'package:vyapar_post/views/Auth/otp_verification_screen.dart';
import 'package:vyapar_post/views/Auth/signup_screen.dart';
import 'package:vyapar_post/views/Auth/update_profile_screen.dart';
import 'package:vyapar_post/views/Splash/on_boarding_screen.dart';
import 'package:vyapar_post/views/Splash/splash_screen.dart';

import '../views/example.dart';
import 'arguments.dart';

class Routs {
  static const String splash = "/example";
  static const String loginScreen = "/login_screen";
  static const String forgetPasswordScreen = "/forget_password_screen";
  static const String forgetPasswordVerification = "/forget_password_verification";
  static const String updateProfileScreen = "/update_profile_screen";
  static const String signupScreen = "/signup_screen";
  static const String mobileVerificationScreen = "/mobile_verification_screen";
  static const String otpVerificationScreen = "/otp_verification_screen";
  static const String splashScreen = "/splash_screen";
  static const String onBoardingScreen = "/on_boarding_screen";

}

class RoutGenerator {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    var arguments = settings.arguments;

    switch (settings.name) {
      case Routs.splash:
        return MaterialPageRoute(builder: (_) => const DemoScreen());

      case Routs.loginScreen:
        return MaterialPageRoute(builder: (_) => LoginScreen());

      case Routs.forgetPasswordScreen:
        return MaterialPageRoute(builder: (_) =>  ForgetPasswordScreen( ));

      case Routs.updateProfileScreen:
        return MaterialPageRoute(builder: (_) =>  UpdateProfileScreen(arguments: arguments as SendArguments));

      case Routs.signupScreen:
        return MaterialPageRoute(builder: (_) =>  SignupScreen(arguments: arguments as SendArguments));

      case Routs.mobileVerificationScreen:
        return MaterialPageRoute(builder: (_) => const MobileVerificationScreen());

      case Routs.otpVerificationScreen:
        return MaterialPageRoute(builder: (_) => OtpVerificationScreen( arguments: arguments as SendArguments,));

      case Routs.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case Routs.forgetPasswordVerification:
        return MaterialPageRoute(builder: (_) => const ForgetPasswordVerification());

      case Routs.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());






      default:
        return null;
    }
  }
}
