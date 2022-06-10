import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:grocery_mobile_app/models/businessLayer/baseRoute.dart';
import 'package:grocery_mobile_app/models/businessLayer/global.dart' as global;
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class SubscriptionDetailScreen extends BaseRoute {
  SubscriptionDetailScreen({a, o}) : super(a: a, o: o, r: 'SubscriptionDetailScreen');
  @override
  _SubscriptionDetailScreenState createState() => new _SubscriptionDetailScreenState();
}

class _SubscriptionDetailScreenState extends BaseRouteState {
  bool isloading = true;

  _SubscriptionDetailScreenState() : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xFF4179dd),
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
                  image: AssetImage('assets/subscription_detail.png'),
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
                  '${AppLocalizations.of(context).tle_platinum_pro}',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).primaryTextTheme.headline3,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(40))),
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height - (MediaQuery.of(context).size.height * 0.50 + 50)),
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10, right: 10, bottom: 20),
                    child: Text('${AppLocalizations.of(context).lbl_subscription_plan}',
                        style: Theme.of(context).primaryTextTheme.bodyText1),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Здесь будет отображаться текст подписки",
                          style: Theme.of(context).primaryTextTheme.headline2,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
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
