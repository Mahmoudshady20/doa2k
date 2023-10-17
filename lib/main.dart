import 'package:doa2k/model.dart';
import 'package:doa2k/modeltypr.dart';
//import 'package:doa2k/testscreen.dart';
import 'package:doa2k/ui/home_screen/home_screen.dart';
import 'package:doa2k/ui/spalsh_screen/spalsh_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async{
  WidgetsFlutterBinding();
  await Hive.initFlutter();
  Hive.registerAdapter(ModelTypeAdaptor());
  await Hive.openBox<Model>('model');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: {
        HomeScreen.routeName : (context) => const HomeScreen(),
        SplashScreen.routeName : (context) => const SplashScreen(),
      },
      initialRoute: SplashScreen.routeName,
    );
  }
}

