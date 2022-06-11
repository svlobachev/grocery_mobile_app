import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:grocery_mobile_app/models/businessLayer/baseRoute.dart';
import 'package:grocery_mobile_app/models/businessLayer/global.dart' as global;
import 'package:grocery_mobile_app/networking/networking.dart';
import 'package:grocery_mobile_app/screens/otpVerificationScreen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class LogInScreen extends BaseRoute {
  LogInScreen({a, o}) : super(a: a, o: o, r: 'LogInScreen');
  @override
  _LogInScreenState createState() => new _LogInScreenState();
}

class _LogInScreenState extends BaseRouteState {
  _LogInScreenState() : super();

  @override
  Widget build(BuildContext context) {
    final _phoneController = TextEditingController();

    return WillPopScope(
      onWillPop: () {
        exitAppDialog();
        return null;
      },
      child: Scaffold(
          body: Container(
        decoration: global.isDarkModeEnable
            ? BoxDecoration(
                gradient: LinearGradient(
                  stops: [0, 0.65],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFF50546F), Color(0xFF8085A3)],
                ),
              )
            : BoxDecoration(
                gradient: LinearGradient(
                  stops: [0, 0.65],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Theme.of(context).primaryColorLight,
                    Theme.of(context).primaryColor
                  ],
                ),
              ),
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(top: 20),
              height: MediaQuery.of(context).size.height * 0.50,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/login_signup.png'),
                ),
              ),
            ),
            Positioned(
              top: 30,
              left: global.isRTL ? null : 10,
              right: global.isRTL ? 10 : null,
              child: IconButton(
                onPressed: () {
                  exitAppDialog();
                },
                icon: Icon(MdiIcons.arrowLeft, color: Colors.white),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.07,
              // left: MediaQuery.of(context).size.width / 4,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.50,
                width: MediaQuery.of(context).size.width,
                child: Text(
                  '${AppLocalizations.of(context).tle_login_signup}',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).primaryTextTheme.headline3,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10, right: 10, top: 35),
              decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(40))),
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.45 - 20),
              height: MediaQuery.of(context).size.height * 0.60,
              width: MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                        '${AppLocalizations.of(context).txt_provide_number_desc}',
                        style: Theme.of(context).primaryTextTheme.bodyText1),
                    Padding(
                      padding: EdgeInsets.only(top: 2, bottom: 20),
                      child: Text(
                          '${AppLocalizations.of(context).txt_otp_verification_desc}',
                          style: Theme.of(context).primaryTextTheme.bodyText1),
                    ),
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(0.0))),
                      padding: EdgeInsets.only(),
                      child: TextField(
                        onSubmitted: (value) {
                          Networking.instance
                              .sendSmsCode(_phoneController.text)
                              .then((value) {
                            print(value.result.code);
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => OtpVerificationScreen(
                                    '7' + _phoneController.text,
                                    a: widget.analytics,
                                    o: widget.observer)));
                          });
                        },
                        controller: _phoneController,
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.phone,
                        maxLength: 10,
                        style: Theme.of(context).primaryTextTheme.bodyText1,
                        decoration: InputDecoration(
                          hintText:
                              '${AppLocalizations.of(context).lbl_phone_number}',
                          prefixIcon: Icon(
                            Icons.phone,
                            color: Theme.of(context)
                                .inputDecorationTheme
                                .hintStyle
                                .color,
                          ),
                          labelText: '+7',
                          labelStyle: TextStyle(
                            color: Theme.of(context)
                                .inputDecorationTheme
                                .hintStyle
                                .color,
                          ),
                          counterText: '',
                          contentPadding: EdgeInsets.only(top: 10),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          gradient: LinearGradient(
                              stops: [0, .90],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                Theme.of(context).primaryColorLight,
                                Theme.of(context).primaryColor
                              ])),
                      margin: EdgeInsets.only(top: 20),
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      child: TextButton(
                          onPressed: () {
                            Networking.instance
                                .sendSmsCode(_phoneController.text)
                                .then((value) {
                              print(value.result.code);
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => OtpVerificationScreen(
                                      '7' + _phoneController.text,
                                      a: widget.analytics,
                                      o: widget.observer)));
                            });
                          },
                          child: Text(
                              '${AppLocalizations.of(context).btn_send_otp}')),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      )),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  bool isloading = true;

  @override
  void initState() {
    super.initState();
  }
}
