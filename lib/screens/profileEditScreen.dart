import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:grocery_mobile_app/models/businessLayer/baseRoute.dart';
import 'package:grocery_mobile_app/models/businessLayer/global.dart' as global;
import 'package:grocery_mobile_app/networking/networking.dart';
import 'package:grocery_mobile_app/provider/gender_provider.dart';
import 'package:grocery_mobile_app/services/save_values_to_local_base.dart';
import 'package:grocery_mobile_app/widgets/bottomNavigationWidget.dart';
import 'package:grocery_mobile_app/widgets/custom_snackBar.dart';
import 'package:intl/src/intl/date_format.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileEditScreen extends BaseRoute {
  final String phone;
  final int code;

  ProfileEditScreen({a, o, this.phone, this.code})
      : super(a: a, o: o, r: 'ProfileEditScreen');

  @override
  _ProfileEditScreenState createState() =>
      new _ProfileEditScreenState(phone: phone, code: code);
}

class _ProfileEditScreenState extends BaseRouteState {
  String phone;
  int code;

  var _cName = new TextEditingController();
  var _cNameOnCard = new TextEditingController();
  var _cEmail = new TextEditingController();
  var _cGender = new TextEditingController();
  var _cBirthday = new TextEditingController();

  var _fName = new FocusNode();

  // var _fNameOnCard = new FocusNode();
  var _fEmail = new FocusNode();
  var _fGender = new FocusNode();
  var _fBirthday = new FocusNode();

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  _ProfileEditScreenState({this.phone, this.code}) : super() {
    _cNameOnCard.text = phone;
  }

  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    // String genderValue = 'One';
    // String genderValue = Provider.of<GenderProvider>(context).genderValue;

    return SafeArea(
      child: Scaffold(
        backgroundColor: global.isDarkModeEnable
            ? Theme.of(context).scaffoldBackgroundColor
            : Theme.of(context).inputDecorationTheme.fillColor,
        appBar: AppBar(
          centerTitle: true,
          title: Text("${AppLocalizations.of(context).tle_edit_profile}"),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              height: 200,
              color: Colors.transparent,
              alignment: Alignment.topCenter,
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    height: 240,
                    alignment: Alignment.topCenter,
                    child: Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/profile_edit.png'),
                        ),
                      ),
                      alignment: Alignment.topCenter,
                      // child: Center(
                      //   child: CircleAvatar(
                      //     radius: 60,
                      //     backgroundColor: Colors.white,
                      //     child: CircleAvatar(
                      //       radius: 53,
                      //       backgroundImage: AssetImage('assets/person.jpg'),
                      //     ),
                      //   ),
                      // ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(left: 16, right: 16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${AppLocalizations.of(context).lbl_edit_name}",
                        style: Theme.of(context).primaryTextTheme.headline2,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(0.0))),
                        margin: EdgeInsets.only(top: 5, bottom: 15),
                        padding: EdgeInsets.only(),
                        child: TextFormField(
                          controller: _cName,
                          focusNode: _fName,
                          style: Theme.of(context).primaryTextTheme.bodyText1,
                          decoration: InputDecoration(
                            fillColor: global.isDarkModeEnable
                                ? Theme.of(context)
                                    .inputDecorationTheme
                                    .fillColor
                                : Theme.of(context).scaffoldBackgroundColor,
                            contentPadding:
                                EdgeInsets.only(top: 10, left: 10, right: 10),
                          ),
                        ),
                      ),
                      // Text(
                      //   "${AppLocalizations.of(context).lbl_edit_phone_number}",
                      //   style: Theme.of(context).primaryTextTheme.headline2,
                      // ),
                      // Container(
                      //   decoration: BoxDecoration(
                      //       borderRadius:
                      //           BorderRadius.all(Radius.circular(0.0))),
                      //   margin: EdgeInsets.only(top: 5, bottom: 15),
                      //   padding: EdgeInsets.only(),
                      //   child: TextFormField(
                      //     controller: _cNameOnCard,
                      //     focusNode: _fNameOnCard,
                      //     style: Theme.of(context).primaryTextTheme.bodyText1,
                      //     decoration: InputDecoration(
                      //       fillColor: global.isDarkModeEnable
                      //           ? Theme.of(context)
                      //               .inputDecorationTheme
                      //               .fillColor
                      //           : Theme.of(context).scaffoldBackgroundColor,
                      //       contentPadding:
                      //           EdgeInsets.only(top: 10, left: 10, right: 10),
                      //     ),
                      //   ),
                      // ),
                      Text(
                        "${AppLocalizations.of(context).lbl_edit_email}",
                        style: Theme.of(context).primaryTextTheme.headline2,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(0.0))),
                        margin: EdgeInsets.only(top: 5, bottom: 15),
                        padding: EdgeInsets.only(),
                        child: TextFormField(
                          controller: _cEmail,
                          focusNode: _fEmail,
                          style: Theme.of(context).primaryTextTheme.bodyText1,
                          decoration: InputDecoration(
                            fillColor: global.isDarkModeEnable
                                ? Theme.of(context)
                                    .inputDecorationTheme
                                    .fillColor
                                : Theme.of(context).scaffoldBackgroundColor,
                            contentPadding:
                                EdgeInsets.only(top: 10, left: 10, right: 10),
                          ),
                        ),
                      ),
                      Text(
                        "${AppLocalizations.of(context).lbl_edit_gender}",
                        style: Theme.of(context).primaryTextTheme.headline2,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(0.0))),
                        margin: EdgeInsets.only(top: 5, bottom: 15),
                        padding: EdgeInsets.only(),
                        child: Consumer<GenderProvider>(
                          builder: (
                            final BuildContext context,
                            GenderProvider genderProvider,
                            final Widget child,
                          ) {
                            return Container(
                              decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .inputDecorationTheme
                                      .fillColor,
                                  // color: Color(0xFF4B4F68),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0))),
                              margin: EdgeInsets.only(top: 5, bottom: 15),
                              padding: EdgeInsets.only(),
                              child: DropdownButton<String>(
                                focusNode: _fGender,
                                iconEnabledColor:
                                    Theme.of(context).indicatorColor,
                                underline: SizedBox(),
                                iconSize: 35.0,
                                dropdownColor: Theme.of(context)
                                    .inputDecorationTheme
                                    .fillColor,
                                style: Theme.of(context)
                                    .primaryTextTheme
                                    .bodyText1,
                                hint: Text(
                                    "    ${AppLocalizations.of(context).gender_select_not_selected}",
                                    style: Theme.of(context)
                                        .primaryTextTheme
                                        .bodyText1),
                                icon: const Icon(Icons.arrow_drop_down),
                                value: genderProvider.selected,
                                onChanged: (final String newValue) {
                                  genderProvider.selected = newValue;
                                  _cGender.text = newValue;
                                  if (kDebugMode) {
                                    print("selected --> ${newValue.trim()}");
                                  }
                                },
                                items: <String>[
                                  "    ${AppLocalizations.of(context).gender_select_male}",
                                  "    ${AppLocalizations.of(context).gender_select_female}",
                                ].map<DropdownMenuItem<String>>(
                                  (final String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  },
                                ).toList(),
                              ),
                            );
                          },
                        ),
                      ),
                      Text(
                        "${AppLocalizations.of(context).lbl_edit_birthday}",
                        style: Theme.of(context).primaryTextTheme.headline2,
                      ),
                      GestureDetector(
                        onTap: () async {
                          print("tap tap");
                          final DateTime date = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(DateTime.now().year - 100),
                            lastDate: DateTime(DateTime.now().year + 1),
                            initialDatePickerMode: DatePickerMode.year,
                            builder: (BuildContext context, Widget child) {
                              return Theme(
                                data: ThemeData.light().copyWith(
                                  primaryColor: const Color(0xFF8CE7F1),
                                  colorScheme: ColorScheme.light(
                                      primary: const Color(0xFF8CE7F1)),
                                  buttonTheme: ButtonThemeData(
                                      textTheme: ButtonTextTheme.primary),
                                ),
                                child: child,
                              );
                            },
                          );
                          if (date != null) {
                            setState(() {
                              _cBirthday.text = DateFormat("yyyy-MM-dd")
                                  .format(date)
                                  .toString();
                            });
                          }

                          print("tap tap2");
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(0.0))),
                          margin: EdgeInsets.only(top: 5, bottom: 15),
                          padding: EdgeInsets.only(),
                          child: IgnorePointer(
                            child: TextFormField(
                              readOnly: true,
                              controller: _cBirthday,
                              focusNode: _fBirthday,
                              keyboardType: TextInputType.datetime,
                              maxLength: 1,
                              style:
                                  Theme.of(context).primaryTextTheme.bodyText1,
                              decoration: InputDecoration(
                                fillColor: global.isDarkModeEnable
                                    ? Theme.of(context)
                                        .inputDecorationTheme
                                        .fillColor
                                    : Theme.of(context).scaffoldBackgroundColor,
                                counterText: '',
                                contentPadding: EdgeInsets.only(
                                    top: 10, left: 10, right: 10),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Container(
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
                margin: EdgeInsets.all(8.0),
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: TextButton(
                    onPressed: () async {
                      final SharedPreferences prefs = await _prefs;
                      phone = prefs.getString('phone');

                      saveRegistrationDataToLocalBase(_cName.text, _cEmail.text,
                          _cGender.text.trim(), _cBirthday.text);

                      Networking.instance
                          .registerAccount(phone, _cName.text, _cEmail.text,
                              _cGender.text.trim(), _cBirthday.text)
                          .then((value) {
                        if (value.result.guest_id != null &&
                            value.result.guest_id > 0) {
                          CustomSnackBar(
                              context,
                              Text(AppLocalizations.of(context)
                                  .registration_result_txt),
                              Colors.lightGreen);
                          if (kDebugMode) {
                            print("Регистрация прошла успешно.");
                          }
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => BottomNavigationWidget(
                                  a: widget.analytics, o: widget.observer)));
                        }
                        // global.accountToken = value.result.accountToken;

                        // if (global.accountToken != null) {
                        //   final SharedPreferences prefs = await _prefs;
                        //   prefs.setString('accountToken', global.accountToken);
                        //
                        //   Navigator.of(context).push(MaterialPageRoute(
                        //       builder: (context) => BottomNavigationWidget(
                        //           a: widget.analytics, o: widget.observer)));
                        // }
                      });
                    },
                    child: Text(
                        '${AppLocalizations.of(context).btn_save_update}')),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }
}
