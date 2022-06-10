import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:grocery_mobile_app/models/businessLayer/baseRoute.dart';
import 'package:grocery_mobile_app/models/businessLayer/global.dart' as global;
import 'package:grocery_mobile_app/screens/addPaymentScreen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddAddressScreen extends BaseRoute {
  final String page;

  AddAddressScreen({a, o, this.page}) : super(a: a, o: o, r: 'AddAddressScreen');
  @override
  _AddAddressScreenState createState() => new _AddAddressScreenState(page: page);
}

class _AddAddressScreenState extends BaseRouteState {
  String page;

  var _cAddress = new TextEditingController();
  var _cLandmark = new TextEditingController();
  var _cPincode = new TextEditingController();
  var _cCountry = new TextEditingController();
  var _cState = new TextEditingController();
  var _cCity = new TextEditingController();
  var _fAddress = new FocusNode();
  var _fLandmark = new FocusNode();
  var _fPincode = new FocusNode();
  var _fCountry = new FocusNode();
  var _fState = new FocusNode();
  var _fCity = new FocusNode();
  bool _setAsDefault = false;

  _AddAddressScreenState({this.page}) : super();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor:
            global.isDarkModeEnable ? Theme.of(context).scaffoldBackgroundColor : Theme.of(context).inputDecorationTheme.fillColor,
        appBar: AppBar(
          leadingWidth: 0,
          leading: SizedBox(),
          title: Text(AppLocalizations.of(context).tle_add_new_address),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(FontAwesomeIcons.windowClose),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(0.0))),
                margin: EdgeInsets.only(top: 15, left: 16, right: 16),
                padding: EdgeInsets.only(),
                child: TextFormField(
                  controller: _cCity,
                  focusNode: _fCity,
                  style: Theme.of(context).primaryTextTheme.bodyText1,
                  decoration: InputDecoration(
                    fillColor: global.isDarkModeEnable
                        ? Theme.of(context).inputDecorationTheme.fillColor
                        : Theme.of(context).scaffoldBackgroundColor,
                    hintText: '${AppLocalizations.of(context).hnt_city_district}',
                    contentPadding: EdgeInsets.only(top: 10, left: 10, right: 10),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(0.0))),
                margin: EdgeInsets.only(top: 15, left: 16, right: 16),
                padding: EdgeInsets.only(),
                child: TextFormField(
                  controller: _cAddress,
                  focusNode: _fAddress,
                  style: Theme.of(context).primaryTextTheme.bodyText1,
                  decoration: InputDecoration(
                    fillColor: global.isDarkModeEnable
                        ? Theme.of(context).inputDecorationTheme.fillColor
                        : Theme.of(context).scaffoldBackgroundColor,
                    hintText: '${AppLocalizations.of(context).hnt_address}',
                    contentPadding: EdgeInsets.only(top: 10, left: 10, right: 10),
                  ),
                ),
              ),
              // Container(
              //   decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(0.0))),
              //   margin: EdgeInsets.only(top: 15, left: 16, right: 16),
              //   padding: EdgeInsets.only(),
              //   child: TextFormField(
              //     controller: _cLandmark,
              //     focusNode: _fLandmark,
              //     style: Theme.of(context).primaryTextTheme.bodyText1,
              //     decoration: InputDecoration(
              //       fillColor: global.isDarkModeEnable ? Theme.of(context).inputDecorationTheme.fillColor : Theme.of(context).scaffoldBackgroundColor,
              //       hintText: '${AppLocalizations.of(context).hnt_near_landmark}',
              //       contentPadding: EdgeInsets.only(top: 10, left: 10, right: 10),
              //     ),
              //   ),
              // ),
              // Container(
              //   decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(0.0))),
              //   margin: EdgeInsets.only(top: 15, left: 16, right: 16),
              //   padding: EdgeInsets.only(),
              //   child: TextFormField(
              //     controller: _cPincode,
              //     focusNode: _fPincode,
              //     style: Theme.of(context).primaryTextTheme.bodyText1,
              //     decoration: InputDecoration(
              //       fillColor: global.isDarkModeEnable ? Theme.of(context).inputDecorationTheme.fillColor : Theme.of(context).scaffoldBackgroundColor,
              //       hintText: '${AppLocalizations.of(context).hnt_pincode}',
              //       contentPadding: EdgeInsets.only(top: 10, left: 10, right: 10),
              //     ),
              //   ),
              // ),
              // Container(
              //   decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(0.0))),
              //   margin: EdgeInsets.only(top: 15, left: 16, right: 16),
              //   padding: EdgeInsets.only(),
              //   child: TextFormField(
              //     controller: _cCountry,
              //     focusNode: _fCountry,
              //     style: Theme.of(context).primaryTextTheme.bodyText1,
              //     decoration: InputDecoration(
              //       fillColor: global.isDarkModeEnable ? Theme.of(context).inputDecorationTheme.fillColor : Theme.of(context).scaffoldBackgroundColor,
              //       hintText: '${AppLocalizations.of(context).hnt_country}',
              //       contentPadding: EdgeInsets.only(top: 10, left: 10, right: 10),
              //     ),
              //   ),
              // ),
              // Row(
              //   mainAxisSize: MainAxisSize.min,
              //   children: [
              //     Expanded(
              //       child: Container(
              //         decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(0.0))),
              //         margin: EdgeInsets.only(top: 15, left: 16, right: 8),
              //         padding: EdgeInsets.only(),
              //         child: TextFormField(
              //           controller: _cState,
              //           focusNode: _fState,
              //           style: Theme.of(context).primaryTextTheme.bodyText1,
              //           decoration: InputDecoration(
              //             fillColor: global.isDarkModeEnable ? Theme.of(context).inputDecorationTheme.fillColor : Theme.of(context).scaffoldBackgroundColor,
              //             hintText: '${AppLocalizations.of(context).hnt_state}',
              //             contentPadding: EdgeInsets.only(top: 10, left: 10, right: 10),
              //           ),
              //         ),
              //       ),
              //     ),
              // Expanded(
              //   child: Container(
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.all(
              //         Radius.circular(0.0),
              //       ),
              //     ),
              //     margin: EdgeInsets.only(top: 15, left: 8, right: 16),
              //     padding: EdgeInsets.only(),
              //     child: TextFormField(
              //       controller: _cCity,
              //       focusNode: _fCity,
              //       style: Theme.of(context).primaryTextTheme.bodyText1,
              //       decoration: InputDecoration(
              //         fillColor: global.isDarkModeEnable ? Theme.of(context).inputDecorationTheme.fillColor : Theme.of(context).scaffoldBackgroundColor,
              //         hintText: '${AppLocalizations.of(context).hnt_city_district}',
              //         contentPadding: EdgeInsets.only(top: 10, left: 10, right: 10),
              //       ),
              //     ),
              //   ),
              // ),
              //   ],
              // ),
              ListTile(
                title: Text(
                  '${AppLocalizations.of(context).lbl_save_address}',
                  style: Theme.of(context).primaryTextTheme.headline6,
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                            color: global.isDarkModeEnable
                                ? Theme.of(context).inputDecorationTheme.fillColor
                                : Theme.of(context).scaffoldBackgroundColor),
                        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                        alignment: Alignment.center,
                        child: Text(
                          "${AppLocalizations.of(context).txt_home}",
                          style: Theme.of(context).inputDecorationTheme.hintStyle,
                        )),
                    Container(
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                            color: global.isDarkModeEnable
                                ? Theme.of(context).inputDecorationTheme.fillColor
                                : Theme.of(context).scaffoldBackgroundColor),
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                        alignment: Alignment.center,
                        child: Text(
                          "${AppLocalizations.of(context).txt_office}",
                          style: Theme.of(context).inputDecorationTheme.hintStyle,
                        )),
                    Container(
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                            color: global.isDarkModeEnable
                                ? Theme.of(context).inputDecorationTheme.fillColor
                                : Theme.of(context).scaffoldBackgroundColor),
                        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                        alignment: Alignment.center,
                        child: Text(
                          "${AppLocalizations.of(context).txt_others}",
                          style: Theme.of(context).inputDecorationTheme.hintStyle,
                        )),
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: global.isDarkModeEnable
                            ? Theme.of(context).inputDecorationTheme.fillColor
                            : Theme.of(context).scaffoldBackgroundColor,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Icon(
                        Icons.add,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Checkbox(
                      value: _setAsDefault,
                      onChanged: (val) {
                        _setAsDefault = val;
                        setState(() {});
                      }),
                  Text(
                    "${AppLocalizations.of(context).txt_default_address}",
                    style: Theme.of(context).primaryTextTheme.headline2,
                  ),
                ],
              ),
            ],
          ),
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
                    colors: [Theme.of(context).primaryColorLight, Theme.of(context).primaryColor],
                  ),
                ),
                margin: EdgeInsets.all(8.0),
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => AddPaymentScreen(a: widget.analytics, o: widget.observer),
                        ),
                      );
                    },
                    child: Text('${AppLocalizations.of(context).btn_save_address}')),
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
