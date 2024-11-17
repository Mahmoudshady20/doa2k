import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:doa2k/feature/home_screen/presentation/views/list_screen.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:page_transition/page_transition.dart';


class SplashScreen extends StatelessWidget {
  static const String routeName = 'splashScreen';

  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
        backgroundColor: Colors.transparent,
        centered: true,
        pageTransitionType: PageTransitionType.fade,
        splash: 'assets/images/logo_doaak.png',
        nextScreen: const HomeScreen(),
        duration: 1500,
        splashIconSize: double.infinity,
        animationDuration: const Duration(seconds: 2),
        curve: Curves.easeInOutCubic,
      ),
    );
  }
}