import 'package:flutter/material.dart';
import 'package:grocery_mobile_app/models/businessLayer/baseRoute.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class RewardScreen extends BaseRoute {
  RewardScreen({a, o}) : super(a: a, o: o, r: 'RewardScreen');
  @override
  _RewardScreenState createState() => new _RewardScreenState();
}

class _RewardScreenState extends BaseRouteState {
  _RewardScreenState() : super();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.of(context).pop();
        return null;
      },
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.transparent,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/orderSuccessScreen.png'),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 15.0, top: 30),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      customBorder: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Align(
                        alignment: Alignment.center,
                        child: Icon(MdiIcons.arrowLeft, color: Colors.white),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "${AppLocalizations.of(context).tle_reward_points}",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).primaryTextTheme.headline3.copyWith(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.45,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20, top: 5),
                child: Text(
                  "${AppLocalizations.of(context).lbl_reward_points}",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).primaryTextTheme.overline.copyWith(color: Colors.white, letterSpacing: 0.0),
                ),
              ),
              Text(
                "100 ",
                style: Theme.of(context).primaryTextTheme.headline3.copyWith(color: Colors.white),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.23),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.white,
                ),
                margin: EdgeInsets.only(top: 40, left: 20, right: 20),
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('${AppLocalizations.of(context).btn_redeem_points}', style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold))),
              ),
            ],
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
