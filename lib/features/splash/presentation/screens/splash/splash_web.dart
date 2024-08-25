import 'package:animated_widgets_flutter/widgets/opacity_animated.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/Router/Router.dart';
import '../../../cubit/splash_cubit.dart';
import '../../../cubit/splash_states.dart';


///// put it in routes
///  import '../../modules/splash/presentation/splash.dart';
/// static const String splashScreen = "/splashScreen";

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => SplashCubit(),
        child: Scaffold(
          backgroundColor: const Color(0xff003366),
          body: BlocConsumer<SplashCubit, SplashStates>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              return  Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: OpacityAnimatedWidget.tween(
                      opacityEnabled: 1,
                      opacityDisabled: 0,
                      duration: const Duration(milliseconds: 3000),
                      enabled: true,
                      animationFinished: (finished) async {
                        // if (Utils.token == '') {
                        Navigator.pushNamed(context, RoutesWeb.HomeWebScreen);
                        // } else {
                        //   Navigator.pushNamed(context, Routes.);
                        // }

                        // Navigator.pushNamedAndRemoveUntil(
                        //     context, await cubit.checkLogin(), (route) => false);
                      },
                      child: Image.asset(
                        "assets/images/splash.jpeg",
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ));
  }
}
