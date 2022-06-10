import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:grocery_mobile_app/models/businessLayer/baseRoute.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class SettingScreen extends BaseRoute {
  SettingScreen({a, o}) : super(a: a, o: o, r: 'SettingScreen');
  @override
  _SettingScreenState createState() => new _SettingScreenState();
}

class _SettingScreenState extends BaseRouteState {
  _SettingScreenState() : super();
  bool isFavourite = false;
  bool isSmsEnable = true;
  bool isInAppEnable = true;
  bool isEmailEnable = true;

  int selectedLanguage = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("${AppLocalizations.of(context).btn_app_setting}"),
          leading: InkWell(
            customBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Align(
              alignment: Alignment.center,
              child: Icon(MdiIcons.arrowLeft),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                Card(
                  child: SwitchListTile(
                    value: isSmsEnable,
                    onChanged: (val) {
                      isSmsEnable = val;
                      setState(() {});
                    },
                    title: Text(
                      "SMS",
                      style: Theme.of(context).primaryTextTheme.bodyText1,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Card(
                    child: SwitchListTile(
                      value: isInAppEnable,
                      onChanged: (val) {
                        isInAppEnable = val;
                        setState(() {});
                      },
                      title: Text(
                        "In App",
                        style: Theme.of(context).primaryTextTheme.bodyText1,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Card(
                    child: SwitchListTile(
                      value: isEmailEnable,
                      onChanged: (val) {
                        isEmailEnable = val;
                        setState(() {});
                      },
                      title: Text(
                        "Email",
                        style: Theme.of(context).primaryTextTheme.bodyText1,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
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
