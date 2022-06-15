import 'package:flutter/material.dart';
import 'package:grocery_mobile_app/dto/account_token.dart';
import 'package:grocery_mobile_app/dto/error.dart';
import 'package:grocery_mobile_app/models/businessLayer/baseRoute.dart';
import 'package:grocery_mobile_app/networking/networking.dart';
import 'package:grocery_mobile_app/screens/profileEditScreen.dart';
import 'package:grocery_mobile_app/widgets/bottomNavigationWidget.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:grocery_mobile_app/models/businessLayer/global.dart' as global;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';

class OtpVerificationScreen extends BaseRoute {
  final String phone;

  OtpVerificationScreen(this.phone, {a, o})
      : super(a: a, o: o, r: 'OtpVerificationScreen');

  @override
  _OtpVerificationScreenState createState() =>
      new _OtpVerificationScreenState(this.phone);
}

class _OtpVerificationScreenState extends BaseRouteState {
  String phone;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  String _errorMessage;

  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      color: Theme.of(context).inputDecorationTheme.fillColor,
      border: Border.all(color: Colors.grey),
      borderRadius: BorderRadius.circular(5.0),
    );
  }

  final FocusNode _pinPutFocusNode = FocusNode();
  final TextEditingController _pinPutController = TextEditingController();

  _OtpVerificationScreenState(String phone) : super() {
    this.phone = phone;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
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
                  Navigator.of(context).pop();
                },
                icon: Icon(MdiIcons.arrowLeft, color: Colors.white),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.07,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.50,
                width: MediaQuery.of(context).size.width,
                child: Text(
                  '${AppLocalizations.of(context).tle_verify_number}',
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
              child: Column(
                children: [
                  Text(
                    '${AppLocalizations.of(context).txt_otp_sent_desc}',
                    style: Theme.of(context).primaryTextTheme.bodyText1,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 2),
                    child: Text(
                      '${AppLocalizations.of(context).txt_otp_verify_desc}',
                      style: Theme.of(context).primaryTextTheme.bodyText1,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 12),
                    child: Text(
                      '${AppLocalizations.of(context).txt_enter_otp}',
                      style: Theme.of(context)
                          .primaryTextTheme
                          .bodyText1
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20, left: 80, right: 80),
                    color: Colors.transparent,
                    child: PinPut(
                      textStyle: Theme.of(context).primaryTextTheme.bodyText1,
                      inputDecoration: InputDecoration(
                        counterText: '',
                        filled: true,
                        fillColor: Colors.transparent,
                      ),
                      autofocus: false,
                      focusNode: _pinPutFocusNode,
                      fieldsCount: 4,
                      controller: _pinPutController,
                      submittedFieldDecoration: _pinPutDecoration.copyWith(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      selectedFieldDecoration: _pinPutDecoration,
                      followingFieldDecoration: _pinPutDecoration.copyWith(
                        borderRadius: BorderRadius.circular(5.0),
                        border: Border.all(color: Colors.transparent),
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
                        ],
                      ),
                    ),
                    margin: EdgeInsets.only(top: 5),
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    child: TextButton(
                        onPressed: () {
                          int code = int.parse(_pinPutController.text);
                          Networking.instance
                              .getAccountToken(phone, code, global.deviceToken)
                              .then((value) async {
                            SmsResponse data;

                            if (value != null)
                              data = SmsResponse.fromJson(
                                  value.data as Map<String, dynamic>);
                            else
                              return;

                            global.accountToken = data.result.accountToken;

                            if (global.accountToken != null) {
                              final SharedPreferences prefs = await _prefs;
                              prefs.setString(
                                  'accountToken', global.accountToken);

                              await Networking.instance
                                  .getGuestData()
                                  .then((value) {
                                global.currentUser = value.result;
                              });

                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => BottomNavigationWidget(
                                      a: widget.analytics,
                                      o: widget.observer)));
                            } else {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => ProfileEditScreen(
                                      a: widget.analytics,
                                      o: widget.observer,
                                      phone: phone,
                                      code: code)));
                            }
                          }).catchError((err) {
                            switch (err.runtimeType) {
                              case DioError:
                                final res = (err as DioError).response;

                                setState(() {
                                  _errorMessage =
                                      ErrorEntity.fromJson(res.data['error'])
                                          .message;
                                });

                                break;
                              default:
                                break;
                            }
                          });
                        },
                        child: Text(
                            '${AppLocalizations.of(context).btn_submit_login}')),
                  ),
                  if (_errorMessage != null && _errorMessage.isNotEmpty)
                    Padding(
                      padding: EdgeInsets.only(top: 30),
                      child: Text(
                        _errorMessage,
                        style: Theme.of(context)
                            .primaryTextTheme
                            .headline1
                            .copyWith(
                                fontWeight: FontWeight.w600, color: Colors.red),
                      ),
                    ),
                  Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: Text(
                      "${AppLocalizations.of(context).txt_didnt_receive_otp}",
                      style: Theme.of(context).primaryTextTheme.headline2,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: Text(
                      '${AppLocalizations.of(context).btn_resend_otp}',
                      style: Theme.of(context)
                          .primaryTextTheme
                          .headline1
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ));
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
