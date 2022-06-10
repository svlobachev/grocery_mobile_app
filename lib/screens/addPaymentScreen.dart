import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:grocery_mobile_app/models/businessLayer/baseRoute.dart';
import 'package:grocery_mobile_app/models/businessLayer/global.dart' as global;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddPaymentScreen extends BaseRoute {
  AddPaymentScreen({a, o}) : super(a: a, o: o, r: 'AddPaymentScreen');
  @override
  _AddPaymentScreenState createState() => new _AddPaymentScreenState();
}

class _AddPaymentScreenState extends BaseRouteState {
  _AddPaymentScreenState() : super();
  var _cCardNumber = new TextEditingController();
  var _cNameOnCard = new TextEditingController();
  var _cValidity = new TextEditingController();
  var _cCVV = new TextEditingController();
  var _fCardNumber = new FocusNode();
  var _fNameOnCard = new FocusNode();
  var _fValidity = new FocusNode();
  var _fCVV = new FocusNode();
  bool _setAsDefault = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: global.isDarkModeEnable
            ? Theme.of(context).scaffoldBackgroundColor
            : Theme.of(context).inputDecorationTheme.fillColor,
        appBar: AppBar(
          leadingWidth: 0,
          leading: SizedBox(),
          title: Text("${AppLocalizations.of(context).tle_add_new_payment}"),
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
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ExpansionTile(
                  iconColor: Theme.of(context).primaryTextTheme.bodyText1.color,
                  collapsedIconColor:
                      Theme.of(context).primaryTextTheme.bodyText1.color,
                  initiallyExpanded: true,
                  title: Text(
                    "${AppLocalizations.of(context).lbl_credit_debit_card}",
                    style: Theme.of(context).primaryTextTheme.bodyText1,
                  ),
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(0.0))),
                      margin: EdgeInsets.only(top: 15),
                      padding: EdgeInsets.only(),
                      child: TextFormField(
                        controller: _cCardNumber,
                        focusNode: _fCardNumber,
                        style: Theme.of(context).primaryTextTheme.bodyText1,
                        decoration: InputDecoration(
                          fillColor: global.isDarkModeEnable
                              ? Theme.of(context).inputDecorationTheme.fillColor
                              : Theme.of(context).scaffoldBackgroundColor,
                          hintText:
                              '${AppLocalizations.of(context).hnt_card_number}',
                          contentPadding:
                              EdgeInsets.only(top: 10, left: 10, right: 10),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(0.0))),
                      margin: EdgeInsets.only(top: 15),
                      padding: EdgeInsets.only(),
                      child: TextFormField(
                        controller: _cNameOnCard,
                        focusNode: _fNameOnCard,
                        style: Theme.of(context).primaryTextTheme.bodyText1,
                        decoration: InputDecoration(
                          fillColor: global.isDarkModeEnable
                              ? Theme.of(context).inputDecorationTheme.fillColor
                              : Theme.of(context).scaffoldBackgroundColor,
                          hintText:
                              '${AppLocalizations.of(context).hnt_name_card}',
                          contentPadding:
                              EdgeInsets.only(top: 10, left: 10, right: 10),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(0.0))),
                            margin: EdgeInsets.only(top: 15, right: 10),
                            padding: EdgeInsets.only(),
                            child: TextFormField(
                              controller: _cValidity,
                              focusNode: _fValidity,
                              style:
                                  Theme.of(context).primaryTextTheme.bodyText1,
                              decoration: InputDecoration(
                                fillColor: global.isDarkModeEnable
                                    ? Theme.of(context)
                                        .inputDecorationTheme
                                        .fillColor
                                    : Theme.of(context).scaffoldBackgroundColor,
                                hintText:
                                    '${AppLocalizations.of(context).hnt_valid_through}',
                                contentPadding: EdgeInsets.only(
                                    top: 10, left: 10, right: 10),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 130,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(0.0))),
                          margin: EdgeInsets.only(top: 15),
                          padding: EdgeInsets.only(),
                          child: TextFormField(
                            controller: _cCVV,
                            focusNode: _fCVV,
                            keyboardType: TextInputType.number,
                            maxLength: 3,
                            style: Theme.of(context).primaryTextTheme.bodyText1,
                            decoration: InputDecoration(
                              fillColor: global.isDarkModeEnable
                                  ? Theme.of(context)
                                      .inputDecorationTheme
                                      .fillColor
                                  : Theme.of(context).scaffoldBackgroundColor,
                              suffixIcon: Icon(
                                Icons.error_outline,
                                color: Colors.red,
                              ),
                              hintText:
                                  '${AppLocalizations.of(context).hnt_cvv}',
                              counterText: '',
                              contentPadding:
                                  EdgeInsets.only(top: 10, left: 10, right: 10),
                            ),
                          ),
                        ),
                      ],
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
                          "${AppLocalizations.of(context).txt_default_payment_option}",
                          style: Theme.of(context).primaryTextTheme.headline2,
                        ),
                      ],
                    ),
                  ],
                ),
                Divider(
                  color: global.isDarkModeEnable
                      ? Theme.of(context).dividerTheme.color.withOpacity(0.05)
                      : Color(0xFFCCD6DF),
                ),
                ExpansionTile(
                  iconColor: Theme.of(context).primaryTextTheme.bodyText1.color,
                  collapsedIconColor:
                      Theme.of(context).primaryTextTheme.bodyText1.color,
                  title: Text(
                    "${AppLocalizations.of(context).lbl_COD}",
                    style: Theme.of(context).primaryTextTheme.bodyText1,
                  ),
                  children: [
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
                          "${AppLocalizations.of(context).txt_default_payment_option}",
                          style: Theme.of(context).primaryTextTheme.headline2,
                        ),
                      ],
                    ),
                  ],
                ),
                Divider(
                  color: global.isDarkModeEnable
                      ? Theme.of(context).dividerTheme.color.withOpacity(0.05)
                      : Color(0xFFCCD6DF),
                ),
                ExpansionTile(
                  iconColor: Theme.of(context).primaryTextTheme.bodyText1.color,
                  collapsedIconColor:
                      Theme.of(context).primaryTextTheme.bodyText1.color,
                  title: Text(
                    "${AppLocalizations.of(context).lbl_upi_option}",
                    style: Theme.of(context).primaryTextTheme.bodyText1,
                  ),
                  children: [
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
                          "${AppLocalizations.of(context).txt_default_payment_option}",
                          style: Theme.of(context).primaryTextTheme.headline2,
                        ),
                      ],
                    ),
                  ],
                ),
                Divider(
                  color: global.isDarkModeEnable
                      ? Theme.of(context).dividerTheme.color.withOpacity(0.05)
                      : Color(0xFFCCD6DF),
                ),
                ExpansionTile(
                  iconColor: Theme.of(context).primaryTextTheme.bodyText1.color,
                  collapsedIconColor:
                      Theme.of(context).primaryTextTheme.bodyText1.color,
                  title: Text(
                    "${AppLocalizations.of(context).lbl_wallet_option}",
                    style: Theme.of(context).primaryTextTheme.bodyText1,
                  ),
                  children: [
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
                          "${AppLocalizations.of(context).txt_default_payment_option}",
                          style: Theme.of(context).primaryTextTheme.headline2,
                        ),
                      ],
                    ),
                  ],
                ),
                Divider(
                  color: global.isDarkModeEnable
                      ? Theme.of(context).dividerTheme.color.withOpacity(0.05)
                      : Color(0xFFCCD6DF),
                ),
                ExpansionTile(
                  iconColor: Theme.of(context).primaryTextTheme.bodyText1.color,
                  collapsedIconColor:
                      Theme.of(context).primaryTextTheme.bodyText1.color,
                  title: Text(
                    "${AppLocalizations.of(context).lbl_netbanking}",
                    style: Theme.of(context).primaryTextTheme.bodyText1,
                  ),
                  children: [
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
                          "${AppLocalizations.of(context).txt_default_payment_option}",
                          style: Theme.of(context).primaryTextTheme.headline2,
                        ),
                      ],
                    ),
                  ],
                ),
                Divider(
                  color: global.isDarkModeEnable
                      ? Theme.of(context).dividerTheme.color.withOpacity(0.05)
                      : Color(0xFFCCD6DF),
                ),
              ],
            ),
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
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                        '${AppLocalizations.of(context).btn_payment_option}')),
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
