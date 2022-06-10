import 'package:flutter/material.dart';
import 'package:grocery_mobile_app/models/addressModel.dart';
import 'package:grocery_mobile_app/models/businessLayer/baseRoute.dart';
import 'package:grocery_mobile_app/models/businessLayer/global.dart' as global;
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DeliveryLocationScreen extends BaseRoute {
  DeliveryLocationScreen({a, o}) : super(a: a, o: o, r: 'DeliveryLocationScreen');
  @override
  _DeliveryLocationScreenState createState() => new _DeliveryLocationScreenState();
}

class _DeliveryLocationScreenState extends BaseRouteState {
  _DeliveryLocationScreenState() : super();
  List<Address> addressList = [
    new Address(title: "Home", address: "Dn 53 Madison Building, Roy Enclave, lane 02 Nearest Landmark - Water park New York, USA"),
    new Address(title: "Office", address: "STP 02 Building sector 05, Module 02, Nearest landmark- New york , USA"),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
            title: Text("${AppLocalizations.of(context).tle_delivery_location}"),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    horizontalTitleGap: 2,
                    contentPadding: EdgeInsets.all(0),
                    visualDensity: VisualDensity(vertical: -4),
                    leading: global.isDarkModeEnable
                        ? Image.asset(
                            'assets/google_dark.png',
                            height: 60,
                            width: 30,
                          )
                        : Image.asset(
                            'assets/google_light.png',
                            height: 60,
                            width: 30,
                          ),
                    title: Text('${AppLocalizations.of(context).txt_deliver} @', style: Theme.of(context).primaryTextTheme.bodyText1),
                    subtitle: Text('DN 53 Madison buildig...', style: Theme.of(context).primaryTextTheme.headline2),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(0.0))),
                    child: TextFormField(
                      style: Theme.of(context).primaryTextTheme.bodyText1,
                      decoration: InputDecoration(
                        hintText: '${AppLocalizations.of(context).hnt_search_new_location}',
                        prefixIcon: Icon(
                          MdiIcons.magnify,
                        ), 
                        contentPadding: EdgeInsets.only(top: 10),
                      ),
                    ),
                  ),
                  ListTile(
                    horizontalTitleGap: 2,
                    contentPadding: EdgeInsets.all(0),
                    leading: Icon(
                      Icons.my_location,
                      color: Theme.of(context).primaryColor,
                    ),
                    title: Text('${AppLocalizations.of(context).lbl_use_current_location}', style: Theme.of(context).primaryTextTheme.bodyText1),
                  ),
                  Divider(
                    color: global.isDarkModeEnable ? Theme.of(context).dividerTheme.color.withOpacity(0.05) : Theme.of(context).dividerTheme.color,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '${AppLocalizations.of(context).lbl_use_saved_location}',
                        style: Theme.of(context).primaryTextTheme.headline5,
                      ),
                    ),
                  ),
                  ListTile(
                    horizontalTitleGap: 2,
                    contentPadding: EdgeInsets.symmetric(vertical: 4),
                    trailing: Icon(
                      MdiIcons.arrowTopRight,
                      size: 18,
                      color: Theme.of(context).primaryTextTheme.headline2.color,
                    ),
                    title: Text('${addressList[0].title}', style: Theme.of(context).primaryTextTheme.overline),
                    subtitle: Text('${addressList[0].address}', style: Theme.of(context).primaryTextTheme.headline2),
                  ),
                  Divider(
                    color: global.isDarkModeEnable ? Theme.of(context).dividerTheme.color.withOpacity(0.05) : Theme.of(context).dividerTheme.color,
                  ),
                  ListTile(
                    horizontalTitleGap: 2,
                    contentPadding: EdgeInsets.symmetric(vertical: 4),
                    trailing: Icon(
                      MdiIcons.arrowTopRight,
                      size: 18,
                      color: Theme.of(context).primaryTextTheme.headline2.color,
                    ),
                    title: Text('${addressList[1].title}', style: Theme.of(context).primaryTextTheme.overline),
                    subtitle: Text('${addressList[1].address}', style: Theme.of(context).primaryTextTheme.headline2),
                  ),
                  Divider(
                    color: global.isDarkModeEnable ? Theme.of(context).dividerTheme.color : Color(0xFFDFE8EF),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '${AppLocalizations.of(context).lbl_recent_searched_location}',
                        style: Theme.of(context).primaryTextTheme.headline5,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Madison Street,NY',
                          style: Theme.of(context).primaryTextTheme.headline2,
                        ),
                        Icon(
                          MdiIcons.arrowTopRight,
                          color: Theme.of(context).primaryTextTheme.headline2.color,
                        )
                      ],
                    ),
                  ),
                  Divider(
                    color: global.isDarkModeEnable ? Theme.of(context).dividerTheme.color.withOpacity(0.05) : Theme.of(context).dividerTheme.color,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Thomas Cooking Building, Florida',
                          style: Theme.of(context).primaryTextTheme.headline2,
                        ),
                        Icon(
                          MdiIcons.arrowTopRight,
                          color: Theme.of(context).primaryTextTheme.headline2.color,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )),
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
