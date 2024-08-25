import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../features/auth/presentation/screens/forget_password/forget_password_screen.dart';
import '../../features/auth/presentation/screens/login/login_screen.dart';
import '../../features/auth/presentation/screens/otp/otp_screen.dart';
import '../../features/auth/presentation/screens/reset_password/reset_password_screen.dart';
import '../../features/auth/presentation/screens/sign_up/sign_up_screen.dart';
 import '../../features/home/presentation/screens/home_web_screen.dart';
 import '../../features/splash/presentation/screens/splash/splash_web.dart';
class RoutesApp {
  static const String splashScreen = "/splashScreen";
  static const String OnboardingScreen = "/OnboardingScreen";
  static const String LoginScreen = "LoginScreen";
  static const String RegisterScreen = "RegisterScreen";
  static const String forget_passScreen = "/forgetPassScreen";
  static const String OtpScreen = "/OtpScreen";
  static const String LayoutScreen = "/LayoutScreen";
  static const String ResetPasswordScreen = "/ResetPasswordScreen";

  } class RoutesWeb {
  static const String splashScreen = "/splashScreen";
  static const String HomeWebScreen = "HomeWebScreen";
  static const String OnboardingScreen = "/OnboardingScreen";
  static const String LoginScreen = "LoginScreen";
  static const String RegisterScreen = "RegisterScreen";
  static const String forget_passScreen = "/forgetPassScreen";
  static const String OtpScreen = "/OtpScreen";
  static const String LayoutScreen = "/LayoutScreen";
  static const String ResetPasswordScreen = "/ResetPasswordScreen";

  }

class RouteGenerator {
  static String currentRoute = "";

  static Route<dynamic> getRouteApp(RouteSettings routeSettings) {
    currentRoute = routeSettings.name.toString();
    switch (routeSettings.name) {
         case RoutesApp.splashScreen:
        return CupertinoPageRoute(
            settings: routeSettings,
            builder: (_) {
              return const SplashScreen();
            });

         case RoutesApp.LoginScreen:
        return CupertinoPageRoute(
            settings: routeSettings,
            builder: (_) {
              return const LoginScreen();
            });
       case RoutesApp.ResetPasswordScreen:
        return CupertinoPageRoute(
            settings: routeSettings,
            builder: (_) {
              return ResetPasswordScreen(
                code: (routeSettings.arguments as NewPasswordArgs).code,
                email: (routeSettings.arguments as NewPasswordArgs).email,
              );
            });
      case RoutesApp.OtpScreen:
        return CupertinoPageRoute(
            settings: routeSettings,
            builder: (_) {
              return OtpScreen(
                onReSend: (routeSettings.arguments as OtpArguments).onReSend,
                onSubmit: (routeSettings.arguments as OtpArguments).onSubmit,
                sendTo: (routeSettings.arguments as OtpArguments).sendTo,
                init: (routeSettings.arguments as OtpArguments).init,
              );
            });
        case RoutesApp.forget_passScreen:
        return CupertinoPageRoute(
            settings: routeSettings,
            builder: (_) {
              return const ForgetPasswordScreen();
            });
           case RoutesApp.RegisterScreen:
        return CupertinoPageRoute(
            settings: routeSettings,
            builder: (_) {
              return const SignUpScreen();
            });
      // case Routes.SplashScreen:
      //   return CupertinoPageRoute(
      //       settings: routeSettings,
      //       builder: (_) {
      //         return const SplashScreen();
      //       });

      default:
        return unDefinedRoute();
    }
  }
  static Route<dynamic> getRouteWeb(RouteSettings routeSettings) {
    currentRoute = routeSettings.name.toString();
    switch (routeSettings.name) {
         case RoutesWeb.splashScreen:
        return CupertinoPageRoute(
            settings: routeSettings,
            builder: (_) {
              return const SplashScreen();
            });


      case RoutesWeb.HomeWebScreen:
        return CupertinoPageRoute(
            settings: routeSettings,
            builder: (_) {
              return const HomeWebScreen();
            });
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> getNestedRoute(RouteSettings routeSettings) {
    currentRoute = routeSettings.name.toString();
    switch (routeSettings.name) {

     

      default:
        return unDefinedRoute();
    }
  }


  static Route<dynamic> unDefinedRoute() {
    return CupertinoPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text("مسار غير موجود"),
              ),
              body: const Center(child: Text("مسار غير موجود")),
            ));
  }
}class OtpArguments {
  final String sendTo;
  final bool? init;
  final dynamic Function(String) onSubmit;
  final void Function() onReSend;

  OtpArguments({
    required this.sendTo,
    required this.onSubmit,
    required this.onReSend,
    this.init,
  });
}

class NewPasswordArgs {
  final String code;
  final String email;
  const NewPasswordArgs({required this.code, required this.email});
}
