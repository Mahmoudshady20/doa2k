import 'package:doa2k/pages/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
// ignore: depend_on_referenced_packages
import 'package:page_transition/page_transition.dart';


class SplashScreen extends StatelessWidget {
  static const String routeName = 'splashScreen';

  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: AnimatedSplashScreen(
          backgroundColor: const Color(0xFFFFFDF4),
          centered: true,
          pageTransitionType: PageTransitionType.fade,
          splash: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/images/logo.png',
              ),
            ],
          ),
          nextScreen: const HomeScreen(),
          duration: 1500,
          animationDuration: const Duration(seconds: 1),
          curve: Curves.easeInOutCubic,
        ),
      ),
    );
  }
}
