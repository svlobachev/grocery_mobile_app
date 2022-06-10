import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:grocery_mobile_app/models/businessLayer/baseRoute.dart';
import 'package:grocery_mobile_app/models/businessLayer/global.dart' as global;
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ContactUsScreen extends BaseRoute {
  ContactUsScreen({a, o}) : super(a: a, o: o, r: 'ContactUsScreen');
  @override
  _ContactUsScreenState createState() => new _ContactUsScreenState();
}

class _ContactUsScreenState extends BaseRouteState {
  var _cName = new TextEditingController();
  var _cNameOnCard = new TextEditingController();
  var _cEmail = new TextEditingController();
  var _fName = new FocusNode();

  var _fNameOnCard = new FocusNode();
  var _fEmail = new FocusNode();
  _ContactUsScreenState() : super();
  String _selectedStrore;
  List<String> _storeName = ['Delhi Store', 'Punjab Store'];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: global.isDarkModeEnable ? Theme.of(context).scaffoldBackgroundColor : Theme.of(context).inputDecorationTheme.fillColor,
        appBar: AppBar(
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
          centerTitle: true,
          title: Text("${AppLocalizations.of(context).tle_contact_us}"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/appicon_180x180.png',
                    fit: BoxFit.cover,
                  ),
                ),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    fillColor: global.isDarkModeEnable ? Theme.of(context).inputDecorationTheme.fillColor : Theme.of(context).scaffoldBackgroundColor,
                    contentPadding: EdgeInsets.only(top: 10, left: 10, right: 10),
                  ),
                  dropdownColor: global.isDarkModeEnable ? Color(0xFF03000C) : Theme.of(context).scaffoldBackgroundColor,
                  icon: Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Icon(
                      Icons.expand_more,
                      color: Theme.of(context).iconTheme.color,
                    ),
                  ),
                  value: _selectedStrore,
                  items: _storeName
                      .map((label) => DropdownMenuItem(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Text(
                                label.toString(),
                                style: Theme.of(context).primaryTextTheme.subtitle2,
                              ),
                            ),
                            value: label,
                          ))
                      .toList(),
                  hint: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      'Select store',
                      style: Theme.of(context).primaryTextTheme.subtitle2,
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _selectedStrore = value;
                    });
                  },
                ),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      "${AppLocalizations.of(context).lbl_callback_desc}",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).primaryTextTheme.bodyText1,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
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
                    padding: EdgeInsets.all(8.0),
                    height: 50,
                    alignment: Alignment.center,
                    //  width: MediaQuery.of(context).size.width,
                    child: TextButton(onPressed: () {}, child: Text('${AppLocalizations.of(context).btn_callback_request}')),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "${AppLocalizations.of(context).lbl_contact_desc}",
                    style: Theme.of(context).primaryTextTheme.bodyText1,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "${AppLocalizations.of(context).lbl_name}",
                  style: Theme.of(context).primaryTextTheme.headline2,
                ),
                Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(0.0))),
                  margin: EdgeInsets.only(top: 5, bottom: 15),
                  padding: EdgeInsets.only(),
                  child: TextFormField(
                    controller: _cName,
                    focusNode: _fName,
                    style: Theme.of(context).primaryTextTheme.bodyText1,
                    decoration: InputDecoration(
                      fillColor: global.isDarkModeEnable ? Theme.of(context).inputDecorationTheme.fillColor : Theme.of(context).scaffoldBackgroundColor,
                      hintText: 'Daniala Escobe',
                      contentPadding: EdgeInsets.only(top: 10, left: 10, right: 10),
                    ),
                  ),
                ),
                Text(
                  "${AppLocalizations.of(context).lbl_phone_number}",
                  style: Theme.of(context).primaryTextTheme.headline2,
                ),
                Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(0.0))),
                  margin: EdgeInsets.only(top: 5, bottom: 15),
                  padding: EdgeInsets.only(),
                  child: TextFormField(
                    controller: _cNameOnCard,
                    focusNode: _fNameOnCard,
                    style: Theme.of(context).primaryTextTheme.bodyText1,
                    decoration: InputDecoration(
                      fillColor: global.isDarkModeEnable ? Theme.of(context).inputDecorationTheme.fillColor : Theme.of(context).scaffoldBackgroundColor,
                      hintText: '+91 9007210595',
                      contentPadding: EdgeInsets.only(top: 10, left: 10, right: 10),
                    ),
                  ),
                ),
                Text(
                  "${AppLocalizations.of(context).lbl_email}",
                  style: Theme.of(context).primaryTextTheme.headline2,
                ),
                Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(0.0))),
                  margin: EdgeInsets.only(top: 5, bottom: 15),
                  padding: EdgeInsets.only(),
                  child: TextFormField(
                    controller: _cEmail,
                    focusNode: _fEmail,
                    style: Theme.of(context).primaryTextTheme.bodyText1,
                    decoration: InputDecoration(
                      fillColor: global.isDarkModeEnable ? Theme.of(context).inputDecorationTheme.fillColor : Theme.of(context).scaffoldBackgroundColor,
                      hintText: 'd.escober@gmail.com',
                      contentPadding: EdgeInsets.only(top: 10, left: 10, right: 10),
                    ),
                  ),
                ),
                Text(
                  "${AppLocalizations.of(context).lbl_your_feedback}",
                  style: Theme.of(context).primaryTextTheme.headline2,
                ),
                Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(0.0))),
                  margin: EdgeInsets.only(top: 5, bottom: 15),
                  padding: EdgeInsets.only(),
                  child: TextFormField(
                    controller: _cEmail,
                    focusNode: _fEmail,
                    maxLines: 3,
                    style: Theme.of(context).primaryTextTheme.bodyText1,
                    decoration: InputDecoration(
                      fillColor: global.isDarkModeEnable ? Theme.of(context).inputDecorationTheme.fillColor : Theme.of(context).scaffoldBackgroundColor,
                      hintText: '${AppLocalizations.of(context).hnt_enter_msg}',
                      contentPadding: EdgeInsets.only(top: 10, left: 10, right: 10),
                    ),
                  ),
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
                    colors: [Theme.of(context).primaryColorLight, Theme.of(context).primaryColor],
                  ),
                ),
                margin: EdgeInsets.all(8.0),
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('${AppLocalizations.of(context).btn_submit}')),
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
