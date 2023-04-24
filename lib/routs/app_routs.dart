
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../views/Auth/forget_password_screen.dart';
import '../views/Auth/forget_password_verification.dart';
import '../views/Auth/login_screen.dart';
import '../views/Auth/mobile_verification_screen.dart';
import '../views/Auth/otp_verification_screen.dart';
import '../views/Auth/signup_screen.dart';
import '../views/Auth/update_profile_screen.dart';
import '../views/Dashboard/category_screen.dart';
import '../views/Dashboard/comments_screen.dart';
import '../views/Dashboard/edit_profile.dart';
import '../views/Dashboard/fquestion_screen.dart';
import '../views/Dashboard/home_screen.dart';
import '../views/Dashboard/main_home_screen.dart';
import '../views/Dashboard/post_ad_Screen.dart';
import '../views/Dashboard/profile_screen.dart';
import '../views/Dashboard/subscription_plan_screen.dart';
import '../views/Dashboard/wallet_screen.dart';
import '../views/Splash/on_boarding_screen.dart';
import '../views/Splash/splash_screen.dart';

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
  static const String mainHomeScreen = "/main_home_screen";
  static const String homeScreen = "/home_screen";
  static const String postAdScreen = "/post_ad_screen";
  static const String walletScreen = "/wallet_screen";
  static const String profileScreen = "/profile_screen";
  static const String subscriptionPlanScreen = "/subscription_plan_screen";
  static const String fQuestionScreen = "/fquestion_screen";
  static const String editProfileScreen = "/edit_profile";
  static const String commentScreen = "/comments_screen";
  static const String categoryScreen = "/category_screen";

}

class RoutGenerator {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    var arguments = settings.arguments;

    switch (settings.name) {


      case Routs.loginScreen:
        return MaterialPageRoute(builder: (_) => LoginScreen());

      case Routs.fQuestionScreen:
        return MaterialPageRoute(builder: (_) => FquestionScreen());

      case Routs.forgetPasswordScreen:
        return MaterialPageRoute(builder: (_) =>  ForgetPasswordScreen( ));

      case Routs.updateProfileScreen:
        return MaterialPageRoute(builder: (_) =>  UpdateProfileScreen(arguments: arguments as SendArguments));

      case Routs.commentScreen:
        return MaterialPageRoute(builder: (_) =>  CommentsScreen(arguments: arguments as SendArguments));

      case Routs.editProfileScreen:
        return MaterialPageRoute(builder: (_) => EditProfileScreen());

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

      case Routs.mainHomeScreen:
        return MaterialPageRoute(builder: (_) => MainHomeScreen( arguments: arguments as SendArguments,));

      case Routs.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      case Routs.postAdScreen:
        return MaterialPageRoute(builder: (_) => const PostAdScreen());

      case Routs.walletScreen:
        return MaterialPageRoute(builder: (_) => const WalletScreen());

      case Routs.profileScreen:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());

      case Routs.subscriptionPlanScreen:
        return MaterialPageRoute(builder: (_) => const SubscriptionPlanScreen());

      case Routs.categoryScreen:
        return MaterialPageRoute(builder: (_) => CategoryScreen( arguments: arguments as SendArguments,));


      default:
        return  null;
    }
  }
}
