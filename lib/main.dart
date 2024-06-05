import 'package:doa2k/models/drug_model.dart';
import 'package:doa2k/pages/home_screen/view/list_screen.dart';
import 'package:doa2k/pages/setting_screen/view/setting_screen.dart';
import 'package:doa2k/services/notification_local.dart';
import 'package:doa2k/provider/drug_provider.dart';
import 'package:doa2k/provider/settings_provider.dart';
import 'package:doa2k/common/themedata.dart';
import 'package:doa2k/pages/splash_screen/splash_screen.dart';
import 'package:doa2k/services/local_db/hive/drug_modeltype.dart';
import 'package:doa2k/services/local_db/shared_prefrences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


void main() async {
  WidgetsFlutterBinding();
  await LocalNotificationRevision.init();
  SharedPrefs.prefs = await SharedPreferences.getInstance();
  await Hive.initFlutter();
  Hive.registerAdapter(DrugTypeAdaptor());
  await Hive.openBox<Drug>('models');

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<SettingsProvider>(
      create: (context) => SettingsProvider()..init(),
    ),
    ChangeNotifierProvider<DrugProvider>(
      create: (context) => DrugProvider(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var settingProvider = Provider.of<SettingsProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
      themeMode: settingProvider.themeMode,
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
        SettingScreen.routeName: (context) => const SettingScreen(),
        SplashScreen.routeName: (context) => const SplashScreen(),
      },
      initialRoute: SplashScreen.routeName,
      localizationsDelegates: const [
        AppLocalizations.delegate, // Add this line
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'), // English
        Locale('ar'), // Spanish
      ],
      locale: settingProvider.myLocal,
    );
  }
}
