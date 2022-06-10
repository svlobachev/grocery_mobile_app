import 'package:flutter/material.dart';
import 'package:grocery_mobile_app/models/businessLayer/baseRoute.dart';
import 'package:grocery_mobile_app/models/businessLayer/global.dart' as global;
import 'package:grocery_mobile_app/screens/subscriptionDetailScreen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class MemberShipScreen extends BaseRoute {
  MemberShipScreen({a, o}) : super(a: a, o: o, r: 'MemberShipScreen');
  @override
  _MemberShipScreenState createState() => new _MemberShipScreenState();
}

class _MemberShipScreenState extends BaseRouteState {
  _MemberShipScreenState() : super();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.of(context).pop();
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
                  colors: [Color(0xFF3E434F), Color(0xFF3E434F)],
                ),
              ),
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(top: 20),
              height: MediaQuery.of(context).size.height * 0.46,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/membership.png'),
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
                height: MediaQuery.of(context).size.height * 0.46,
                width: MediaQuery.of(context).size.width,
                child: Text(
                  '${AppLocalizations.of(context).tle_membership}',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).primaryTextTheme.headline3,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 35),
              decoration: BoxDecoration(color: Theme.of(context).scaffoldBackgroundColor, borderRadius: BorderRadius.only(topLeft: Radius.circular(40))),
              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height - (MediaQuery.of(context).size.height * 0.46 + 50)),
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Text('${AppLocalizations.of(context).lbl_choose_plan}', style: Theme.of(context).primaryTextTheme.bodyText1),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5, left: 35, right: 35, bottom: 5),
                    child: Text(
                      '${AppLocalizations.of(context).txt_membership_desc}',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).primaryTextTheme.headline2,
                    ),
                  ),
                  Expanded(
                      child: SingleChildScrollView(
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => SubscriptionDetailScreen(a: widget.analytics, o: widget.observer),
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                  'assets/membership3.png',
                                ),
                              ),
                            ),
                            margin: EdgeInsets.only(left: 10, bottom: 10),
                            width: MediaQuery.of(context).size.width,
                            height: 100,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => SubscriptionDetailScreen(a: widget.analytics, o: widget.observer),
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                  'assets/membership2.png',
                                ),
                              ),
                            ),
                            margin: EdgeInsets.only(left: 10, bottom: 10),
                            width: MediaQuery.of(context).size.width,
                            height: 100,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => SubscriptionDetailScreen(a: widget.analytics, o: widget.observer),
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                  'assets/membership1.png',
                                ),
                              ),
                            ),
                            margin: EdgeInsets.only(left: 10, bottom: 10),
                            width: MediaQuery.of(context).size.width,
                            height: 100,
                          ),
                        ),
                      ],
                    ),
                  )),
                ],
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
