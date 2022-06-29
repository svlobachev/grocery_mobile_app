import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:grocery_mobile_app/Theme/nativeTheme.dart';
import 'package:grocery_mobile_app/Theme/themeChanger.dart';
import 'package:grocery_mobile_app/l10n/l10n.dart';
import 'package:grocery_mobile_app/provider/gender_provider.dart';
import 'package:grocery_mobile_app/models/businessLayer/global.dart' as global;
import 'package:grocery_mobile_app/provider/local_provider.dart';
import 'package:grocery_mobile_app/screens/splashScreen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final SharedPreferences prefs = await _prefs;

  // removeLocalBaseValues();

  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );

  global.deviceToken = prefs.getString('device_token');
  var phone = prefs.getString('phone');
  global.appToken = '9fc45c34-a8cf-4504-8f3f-293ebff26013';
  print('deviceToken: --> ${global.deviceToken}');
  print('phoneNumber: --> ${phone}');

  try {
    runApp(Phoenix(child: MyApp()));
  } catch (e) {
    print(e);
  }
}

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => new MyAppState();
}

class MyAppState extends State<MyApp> {
  static dynamic analytics;
  static dynamic observer;
  final String routeName = "main";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => LocaleProvider()),
          ChangeNotifierProvider<GenderProvider>(
            create: (final BuildContext context) {
              return GenderProvider();
            },
          ),
          ChangeNotifierProvider(
              create: (_) => ThemeChanger(
                  nativeTheme(isDarkModeEnable: global.isDarkModeEnable))),
        ],
        child: MaterialAppWithTheme(analytics, observer),
      );
}

class MaterialAppWithTheme extends StatelessWidget {
  final dynamic analytics;
  final dynamic observer;

  MaterialAppWithTheme(this.analytics, this.observer);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LocaleProvider>(context);
    global.isDarkModeEnable = true;

    final theme = Provider.of<ThemeChanger>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Grocery App',
      //  navigatorObservers: <NavigatorObserver>[observer],
      theme: theme.getTheme,
      //ThemeData.dark(), //

      locale: provider.locale,
      supportedLocales: L10n.all,
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      home: SplashScreen(
        a: analytics,
        o: observer,
      ),
    );
  }
}
