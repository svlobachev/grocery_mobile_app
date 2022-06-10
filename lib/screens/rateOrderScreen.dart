import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:grocery_mobile_app/models/businessLayer/baseRoute.dart';
import 'package:grocery_mobile_app/models/businessLayer/global.dart' as global;
import 'package:grocery_mobile_app/widgets/bottomNavigationWidget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RateOrderScreen extends BaseRoute {
  RateOrderScreen({a, o}) : super(a: a, o: o, r: 'RateOrderScreen');
  @override
  _RateOrderScreenState createState() => new _RateOrderScreenState();
}

class _RateOrderScreenState extends BaseRouteState {
  _RateOrderScreenState() : super();
  var _cComment = new TextEditingController();

  var _fComment = new FocusNode();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: global.isDarkModeEnable ? Theme.of(context).scaffoldBackgroundColor : Theme.of(context).inputDecorationTheme.fillColor,
        appBar: AppBar(
          leadingWidth: 0,
          leading: SizedBox(),
          title: Text("${AppLocalizations.of(context).btn_rate_order}"),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon:  Icon(FontAwesomeIcons.windowClose),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${AppLocalizations.of(context).lbl_order_id}',
                        style: Theme.of(context).primaryTextTheme.headline2,
                      ),
                      Text(
                        '578192',
                        style: Theme.of(context).primaryTextTheme.headline2,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 5,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${AppLocalizations.of(context).lbl_number_of_items}',
                        style: Theme.of(context).primaryTextTheme.headline2,
                      ),
                      Text(
                        '03',
                        style: Theme.of(context).primaryTextTheme.headline2,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 5,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${AppLocalizations.of(context).lbl_delivered_on}',
                        style: Theme.of(context).primaryTextTheme.headline2,
                      ),
                      Text(
                        '25.02.2021',
                        style: Theme.of(context).primaryTextTheme.headline2,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${AppLocalizations.of(context).lbl_total_amount}',
                        style: Theme.of(context).primaryTextTheme.headline2,
                      ),
                      Text(
                        '\$61.27',
                        style: Theme.of(context).primaryTextTheme.headline2,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Divider(
                  color: global.isDarkModeEnable ? Theme.of(context).dividerTheme.color.withOpacity(0.05) : Color(0xFFCCD6DF),
                ),
                SizedBox(
                  height: 30,
                ),
                Text("${AppLocalizations.of(context).lbl_rate_overall_exp}", style: Theme.of(context).primaryTextTheme.bodyText1),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.star,
                      color: Theme.of(context).primaryColorLight,
                    ),
                    Icon(
                      Icons.star,
                      color: Theme.of(context).primaryColorLight,
                    ),
                    Icon(
                      Icons.star,
                      color: Theme.of(context).primaryColorLight,
                    ),
                    Icon(
                      Icons.star,
                      color: Theme.of(context).primaryColorLight,
                    ),
                    Icon(
                      Icons.star,
                      color: Theme.of(context).cardTheme.color,
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
               Divider(
                  color: global.isDarkModeEnable ? Theme.of(context).dividerTheme.color.withOpacity(0.05) : Color(0xFFCCD6DF),
                ),
                SizedBox(
                  height: 30,
                ),
                Text("${AppLocalizations.of(context).lbl_rate_buddy}", style: Theme.of(context).primaryTextTheme.bodyText1),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.star,
                      color: Theme.of(context).primaryColorLight,
                    ),
                    Icon(
                      Icons.star,
                      color: Theme.of(context).primaryColorLight,
                    ),
                    Icon(
                      Icons.star,
                      color: Theme.of(context).primaryColorLight,
                    ),
                    Icon(
                      Icons.star,
                      color: Theme.of(context).primaryColorLight,
                    ),
                    Icon(
                      Icons.star,
                      color: Theme.of(context).cardTheme.color,
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(0.0))),
                  margin: EdgeInsets.only(top: 15),
                  padding: EdgeInsets.only(),
                child: TextFormField(
                    controller: _cComment,
                    focusNode: _fComment,
                    style: Theme.of(context).primaryTextTheme.bodyText1,
                    decoration: InputDecoration(fillColor: global.isDarkModeEnable ? Theme.of(context).inputDecorationTheme.fillColor : Theme.of(context).scaffoldBackgroundColor,
                      hintText: '${AppLocalizations.of(context).hnt_comment}',
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
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => BottomNavigationWidget(a: widget.analytics, o: widget.observer),
                        ),
                      );
                    },
                    child: Text('${AppLocalizations.of(context).btn_submit_rating}')),
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
