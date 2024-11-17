import 'package:doa2k/core/local_db/hive/drug_modeltype.dart';
import 'package:doa2k/core/local_db/shared_pref/shared_preferences.dart';
import 'package:doa2k/core/services/notification_local.dart';
import 'package:doa2k/feature/home_screen/domain/entity/drug_entity.dart';
import 'package:doa2k/feature/home_screen/presentation/manager/drug_provider.dart';
import 'package:doa2k/feature/home_screen/presentation/views/list_screen.dart';
import 'package:doa2k/feature/how_to_use/presentation/view/how_to_use.dart';
import 'package:doa2k/feature/setting_screen/presentation/manager/settings_provider.dart';
import 'package:doa2k/feature/splash_screen/splash_screen.dart';
import 'package:doa2k/shared/my_theme/themedata.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workmanager/workmanager.dart';

import 'feature/setting_screen/presentation/views/setting_view.dart';

void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    const platform = MethodChannel('com.example.doa2k/wakelock');
    try {
      await platform.invokeMethod('wakeUpScreen');
      await LocalNotificationRevision.showDoa2kNotification(
        year: inputData!['year'],
        id: inputData['id'],
        drugName: inputData['drugName'],
        drugDesc: inputData['drugDesc'],
        month: inputData['month'],
        day: inputData['day'],
        hour: inputData['hour'],
        minutes: inputData['minutes'],
      );
    } on PlatformException {
      debugPrint('Failed to wake up screen');
    }
    return Future.value(true);
  });
}

void main() async {
  WidgetsFlutterBinding();
  await MobileAds.instance.initialize();
  await LocalNotificationRevision.init();
  SharedPrefs.prefs = await SharedPreferences.getInstance();
  await Hive.initFlutter();
  Hive.registerAdapter(DrugTypeAdaptor());
  await Hive.openBox<Drug>('models');
  await Workmanager().initialize(
    callbackDispatcher,
    isInDebugMode: false, // Set to false in production
  );
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<SettingsProvider>(
      create: (context) => SettingsProvider()..init(),
    ),
    // Provider<SettingsProvider>(
    //   create: (context) => getIt.get<SettingsProvider>(),
    // ),
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
    SettingsProvider settingProvider = Provider.of<SettingsProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
      themeMode: settingProvider.themeMode,
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
        SettingView.routeName: (context) => const SettingView(),
        SplashScreen.routeName: (context) => const SplashScreen(),
        HowToUse.routeName: (context) => const HowToUse(),
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
        Locale('ar'), // arabic
      ],
      locale: settingProvider.myLocal,
    );
  }
}
