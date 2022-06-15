import 'dart:async';
import 'package:flutter/material.dart';
import 'package:grocery_mobile_app/Theme/nativeTheme.dart';
import 'package:grocery_mobile_app/Theme/themeChanger.dart';
import 'package:grocery_mobile_app/dto/config.dart';
import 'package:grocery_mobile_app/models/businessLayer/baseRoute.dart';
import 'package:grocery_mobile_app/models/businessLayer/global.dart' as global;
import 'package:grocery_mobile_app/networking/networking.dart';
import 'package:grocery_mobile_app/provider/local_provider.dart';
import 'package:grocery_mobile_app/screens/loginScreen.dart';
import 'package:grocery_mobile_app/services/config_service.dart';
import 'package:grocery_mobile_app/services/save_values_to_local_base.dart';
import 'package:grocery_mobile_app/widgets/bottomNavigationWidget.dart';
import 'package:provider/provider.dart';
import 'package:grocery_mobile_app/extensions/string_extensions.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends BaseRoute {
  SplashScreen({a, o}) : super(a: a, o: o, r: 'SplashScreen');

  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends BaseRouteState {
  bool isloading = true;

  ConfigService _configService = ConfigService.instance;

  Future<MainConfig> _configFuture;

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  _SplashScreenState() : super();

  @override
  Widget build(BuildContext context) {
    // Networking.instance.onError = (error) {
    //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //     content: Text(error),
    //   ));
    // };

    return Scaffold(
        body: FutureBuilder(
            future: _configFuture,
            builder: (context, AsyncSnapshot<MainConfig> snapshot) {
              if (snapshot.connectionState != ConnectionState.done ||
                  snapshot.data == null)
                return Center(child: CircularProgressIndicator());
              return Stack(
                children: [
                  if (_configService.config.splashConfig.bgColor != null &&
                      _configService.config.splashConfig.bgColor.isNotEmpty)
                    Container(
                      decoration: BoxDecoration(
                          color: _configService.config.splashConfig.bgColor
                              .hexStringToColor()),
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (_configService
                                .config.splashConfig.logoUrl.isNotEmpty)
                              Image.network(
                                _configService.config.splashConfig.logoUrl,
                                width: MediaQuery.of(context).size.width *
                                    _configService
                                        .config.splashConfig.logoSizePercent /
                                    100,
                                fit: BoxFit.cover,
                              ),
                          ],
                        ),
                      ),
                    ),
                  if (_configService.config.splashConfig.devLogoUrl != null &&
                      _configService.config.splashConfig.devLogoUrl.isNotEmpty)
                    Positioned(
                      bottom: 50,
                      right: 0,
                      left: 0,
                      child: Container(
                        width: 50,
                        height: 30,
                        child: Image.network(
                          _configService.config.splashConfig.devLogoUrl,
                          width: 50,
                        ),
                      ),
                    )
                ],
              );
            }));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    _configFuture = Networking.instance.loadConfig().then((value) {
      print(value.result.data);
      _configService.config = value.result.data;

      _init();
      return value;
    }).catchError((error) {
      print(error);
    });
  }

  void _init() async {
    deviceTokenSaveToLocalBase();
    var duration = Duration(seconds: 2);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<LocaleProvider>(context, listen: false);
      if (global.languageCode == null) {
        var locale = provider.locale ?? Locale('ru');
        global.languageCode = locale.languageCode;
      } else {
        provider.setLocale(Locale(global.languageCode));
      }
      if (global.rtlLanguageCodeLList.contains(global.languageCode)) {
        global.isRTL = true;
      } else {
        global.isRTL = false;
      }

      var themeProvider = Provider.of<ThemeChanger>(context, listen: false);
      themeProvider.setTheme(customizedTheme.copyWith(
          scaffoldBackgroundColor: _configService
              .config.defaultConfig.primaryBgcolor
              .hexStringToColor()));
    });

    SharedPreferences prefs = await _prefs;
    var savedToken = prefs.getString('accountToken');

    global.accountToken = savedToken;
    global.deviceToken = prefs.getString('device_token');
    Timer(duration, () async {
      if (savedToken != null && savedToken.isNotEmpty) {
        await Networking.instance.getGuestData().then((value) {
          global.currentUser = value.result;
        });

        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => BottomNavigationWidget(
                a: widget.analytics, o: widget.observer)));
      } else {
        Navigator.of(context).push(
          MaterialPageRoute(
              builder: (context) =>
                  LogInScreen(a: widget.analytics, o: widget.observer)),
        );
      }
    });
  }
}
