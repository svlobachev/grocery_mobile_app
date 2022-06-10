import 'package:fdottedline/fdottedline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:grocery_mobile_app/models/businessLayer/baseRoute.dart';
import 'package:grocery_mobile_app/models/businessLayer/global.dart' as global;
import 'package:grocery_mobile_app/widgets/bottomNavigationWidget.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class TrackOrderScreen extends BaseRoute {
  TrackOrderScreen({a, o}) : super(a: a, o: o, r: 'TrackOrderScreen');
  @override
  _TrackOrderScreenState createState() => new _TrackOrderScreenState();
}

class _TrackOrderScreenState extends BaseRouteState {
  _TrackOrderScreenState() : super();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => BottomNavigationWidget(
                  a: widget.analytics, o: widget.observer)));
          return null;
        },
        child: Scaffold(
          backgroundColor: Color(0xFF5c7de0),
          appBar: AppBar(
            leading: InkWell(
              customBorder: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => BottomNavigationWidget(
                        a: widget.analytics, o: widget.observer)));
              },
              child: Align(
                alignment: Alignment.center,
                child: Icon(MdiIcons.arrowLeft),
              ),
            ),
            backgroundColor: global.isDarkModeEnable
                ? Color(0xFF2A2D3F)
                : Theme.of(context).scaffoldBackgroundColor,
            centerTitle: true,
            title: Text("${AppLocalizations.of(context).tle_track_order}"),
          ),
          body: Stack(
            clipBehavior: Clip.none,
            children: [
              // Container(
              //   height: MediaQuery.of(context).size.height,
              //   width: MediaQuery.of(context).size.width,
              // ),
              Container(
                height: MediaQuery.of(context).size.height - 180,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(30)),
                    image: DecorationImage(
                      image: AssetImage('assets/mapScreen.png'),
                      colorFilter: const ColorFilter.mode(
                        Colors.black54,
                        BlendMode.saturation,
                      ),
                      fit: BoxFit.fill,
                    )),
                alignment: Alignment.centerRight,
                child: Icon(Icons.navigate_next),
              ),
              Container(
                height: MediaQuery.of(context).size.height - 280,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(8),
                decoration: global.isDarkModeEnable
                    ? BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(40),
                        ),
                        gradient: LinearGradient(
                          stops: [0, 0.65],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Color(0xFF2A2D3F), Color(0xFF111127)],
                        ),
                      )
                    : BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(40),
                        ),
                      ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${AppLocalizations.of(context).txt_estimate_time}",
                        style: Theme.of(context).primaryTextTheme.bodyText1,
                      ),
                      Divider(
                        color: global.isDarkModeEnable
                            ? Theme.of(context).dividerTheme.color
                            : Color(0xFFDFE8EF),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 4.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "${AppLocalizations.of(context).lbl_order_id}",
                              style:
                                  Theme.of(context).primaryTextTheme.headline2,
                            ),
                            Text(
                              "#301241",
                              style:
                                  Theme.of(context).primaryTextTheme.bodyText1,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 4.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "${AppLocalizations.of(context).lbl_order_place_on}",
                              style:
                                  Theme.of(context).primaryTextTheme.headline2,
                            ),
                            Text(
                              "23.03.2021, 10.49 AM",
                              style:
                                  Theme.of(context).primaryTextTheme.bodyText1,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 4.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "${AppLocalizations.of(context).txt_date_of_delivery}",
                              style:
                                  Theme.of(context).primaryTextTheme.headline2,
                            ),
                            Text(
                              "23.03.2021, 12 - 4 PM",
                              style:
                                  Theme.of(context).primaryTextTheme.bodyText1,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 4.0, bottom: 4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "${AppLocalizations.of(context).lbl_total_amount}",
                              style:
                                  Theme.of(context).primaryTextTheme.headline2,
                            ),
                            Text(
                              "\$62.27",
                              style:
                                  Theme.of(context).primaryTextTheme.bodyText1,
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        color: global.isDarkModeEnable
                            ? Theme.of(context).dividerTheme.color
                            : Color(0xFFDFE8EF),
                      ),
                      Stack(
                        children: [
                          ListTile(
                            contentPadding: EdgeInsets.symmetric(horizontal: 8),
                            leading: global.isDarkModeEnable
                                ? Container(
                                    height: 12,
                                    width: 12,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(12),
                                        ),
                                        color: Colors.black,
                                        border: Border.all(
                                            color: Theme.of(context)
                                                .primaryTextTheme
                                                .headline2
                                                .color)),
                                  )
                                : CircleAvatar(
                                    backgroundColor: Colors.black,
                                    foregroundColor: Colors.white,
                                    radius: 6,
                                  ),
                            minLeadingWidth: 12,
                            title: Text("Ordered Deliver to you",
                                style: Theme.of(context)
                                    .primaryTextTheme
                                    .headline2),
                            subtitle: Text(
                                "Thanks for choosing us, Browse More.",
                                style: Theme.of(context)
                                    .primaryTextTheme
                                    .headline2),
                          ),
                          Positioned(
                            left: global.isRTL ? null : 14,
                            right: global.isRTL ? 14 : null,
                            top: 25,
                            child: FDottedLine(
                              color: global.isDarkModeEnable
                                  ? Colors.white30
                                  : Colors.black38,
                              height: 80,
                              child: Container(
                                height: 80,
                                color: global.isDarkModeEnable
                                    ? Colors.white30
                                    : Colors.black38,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          Container(
                            child: ListTile(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 6),
                              leading: global.isDarkModeEnable
                                  ? Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                        boxShadow: [
                                          BoxShadow(
                                              blurRadius: 5,
                                              color: Colors.green,
                                              spreadRadius: 2)
                                        ],
                                      ),
                                      child: CircleAvatar(
                                        backgroundColor:
                                            Colors.greenAccent[100],
                                        radius: 8,
                                        child: Icon(
                                          Icons.check,
                                          size: 9,
                                          color: Colors.white,
                                        ),
                                      ),
                                    )
                                  : Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                        boxShadow: [
                                          BoxShadow(
                                              blurRadius: 5,
                                              color: Colors.green,
                                              spreadRadius: 2)
                                        ],
                                      ),
                                      child: CircleAvatar(
                                        backgroundColor: Colors.green,
                                        radius: 8,
                                        child: Icon(
                                          Icons.check,
                                          size: 9,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                              minLeadingWidth: 12,
                              title: Text("Out of Delivery",
                                  style: Theme.of(context)
                                      .primaryTextTheme
                                      .bodyText1),
                              subtitle: Text(
                                  "Our delivery partner is on your way",
                                  style: Theme.of(context)
                                      .primaryTextTheme
                                      .headline2),
                              trailing: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text("12.25 PM",
                                      style: Theme.of(context)
                                          .primaryTextTheme
                                          .bodyText1),
                                  Text("25.03.2021",
                                      style: Theme.of(context)
                                          .primaryTextTheme
                                          .headline2),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            left: global.isRTL ? null : 14,
                            right: global.isRTL ? 14 : null,
                            top: 0,
                            child: FDottedLine(
                              color: global.isDarkModeEnable
                                  ? Colors.white30
                                  : Colors.black38,
                              height: 50,
                              width: 50,
                              child: Container(
                                height: 50,
                                color: global.isDarkModeEnable
                                    ? Colors.white30
                                    : Colors.black38,
                              ),
                            ),
                          ),
                          Positioned(
                            left: global.isRTL ? null : 14,
                            right: global.isRTL ? 14 : null,
                            top: 23,
                            child: FDottedLine(
                              color: global.isDarkModeEnable
                                  ? Colors.white30
                                  : Colors.black38,
                              height: 80,
                              child: Container(
                                height: 80,
                                color: global.isDarkModeEnable
                                    ? Colors.white30
                                    : Colors.black38,
                              ),
                            ),
                          )
                        ],
                      ),
                      Stack(
                        children: [
                          Container(
                            child: ListTile(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 8),
                              leading: global.isDarkModeEnable
                                  ? Container(
                                      height: 12,
                                      width: 12,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(12),
                                          ),
                                          color: Colors.black,
                                          border: Border.all(
                                              color: Theme.of(context)
                                                  .primaryTextTheme
                                                  .headline2
                                                  .color)),
                                    )
                                  : CircleAvatar(
                                      backgroundColor: Colors.black,
                                      radius: 6,
                                    ),
                              minLeadingWidth: 12,
                              title: Text("Order Packed & Processed",
                                  style: Theme.of(context)
                                      .primaryTextTheme
                                      .headline2),
                              subtitle: Text(
                                  "Thanks for choosing us, have patience.",
                                  style: Theme.of(context)
                                      .primaryTextTheme
                                      .headline2),
                              trailing: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text("12.25 PM",
                                      style: Theme.of(context)
                                          .primaryTextTheme
                                          .headline2),
                                  Text("25.03.2021",
                                      style: Theme.of(context)
                                          .primaryTextTheme
                                          .headline2),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            left: global.isRTL ? null : 14,
                            right: global.isRTL ? 14 : null,
                            top: 0,
                            child: FDottedLine(
                              color: global.isDarkModeEnable
                                  ? Colors.white30
                                  : Colors.black38,
                              height: 50,
                              width: 50,
                              child: Container(
                                height: 50,
                                color: global.isDarkModeEnable
                                    ? Colors.white30
                                    : Colors.black38,
                              ),
                            ),
                          ),
                          Positioned(
                            left: global.isRTL ? null : 14,
                            right: global.isRTL ? 14 : null,
                            top: 23,
                            child: FDottedLine(
                              color: global.isDarkModeEnable
                                  ? Colors.white30
                                  : Colors.black38,
                              height: 80,
                              child: Container(
                                height: 80,
                              ),
                            ),
                          )
                        ],
                      ),
                      Stack(
                        children: [
                          Container(
                            child: ListTile(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 8),
                              leading: global.isDarkModeEnable
                                  ? Container(
                                      height: 12,
                                      width: 12,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(12),
                                          ),
                                          color: Colors.black,
                                          border: Border.all(
                                              color: Theme.of(context)
                                                  .primaryTextTheme
                                                  .headline2
                                                  .color)),
                                    )
                                  : CircleAvatar(
                                      backgroundColor: Colors.black,
                                      radius: 6,
                                    ),
                              minLeadingWidth: 12,
                              title: Text("Payment Received",
                                  style: Theme.of(context)
                                      .primaryTextTheme
                                      .headline2),
                              subtitle: Text(
                                  "We value our customers, please stay tunes",
                                  style: Theme.of(context)
                                      .primaryTextTheme
                                      .headline2),
                              trailing: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text("12.25 PM",
                                      style: Theme.of(context)
                                          .primaryTextTheme
                                          .headline2),
                                  Text("25.03.2021",
                                      style: Theme.of(context)
                                          .primaryTextTheme
                                          .headline2),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            left: global.isRTL ? null : 14,
                            right: global.isRTL ? 14 : null,
                            top: 0,
                            child: FDottedLine(
                              color: global.isDarkModeEnable
                                  ? Colors.white30
                                  : Colors.black38,
                              height: 50,
                              width: 50,
                              child: Container(
                                height: 50,
                                color: global.isDarkModeEnable
                                    ? Colors.white30
                                    : Colors.black38,
                              ),
                            ),
                          ),
                          Positioned(
                            left: global.isRTL ? null : 14,
                            right: global.isRTL ? 14 : null,
                            top: 23,
                            child: FDottedLine(
                              color: global.isDarkModeEnable
                                  ? Colors.white30
                                  : Colors.black38,
                              height: 80,
                              child: Container(
                                height: 80,
                              ),
                            ),
                          )
                        ],
                      ),
                      Stack(
                        children: [
                          Container(
                            child: ListTile(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 8),
                              leading: global.isDarkModeEnable
                                  ? Container(
                                      height: 12,
                                      width: 12,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(12),
                                          ),
                                          color: Colors.black,
                                          border: Border.all(
                                              color: Theme.of(context)
                                                  .primaryTextTheme
                                                  .headline2
                                                  .color)),
                                      child: Icon(
                                        Icons.check,
                                        size: 6,
                                        color: Theme.of(context)
                                            .primaryTextTheme
                                            .headline2
                                            .color,
                                      ),
                                    )
                                  : CircleAvatar(
                                      backgroundColor: Colors.black,
                                      radius: 6,
                                    ),
                              minLeadingWidth: 12,
                              title: Text("Order Added to cart & Placed",
                                  style: Theme.of(context)
                                      .primaryTextTheme
                                      .headline2),
                              subtitle: Text(
                                  "Thanks for choosing us, Browse More.",
                                  style: Theme.of(context)
                                      .primaryTextTheme
                                      .headline2),
                              trailing: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text("12.25 PM",
                                      style: Theme.of(context)
                                          .primaryTextTheme
                                          .headline2),
                                  Text("25.03.2021",
                                      style: Theme.of(context)
                                          .primaryTextTheme
                                          .headline2),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            left: global.isRTL ? null : 14,
                            right: global.isRTL ? 14 : null,
                            top: 0,
                            bottom: 35,
                            child: FDottedLine(
                              color: global.isDarkModeEnable
                                  ? Colors.white30
                                  : Colors.black38,
                              height: 50,
                              width: 50,
                              child: Container(
                                height: 50,
                                color: global.isDarkModeEnable
                                    ? Colors.white30
                                    : Colors.black38,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: (MediaQuery.of(context).size.height -
                        180 -
                        30 -
                        (MediaQuery.of(context).size.height - 280)) *
                    0.5,
                right: 20,
                child: Container(
                  height: 28,
                  width: 28,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                      color: Theme.of(context).primaryColor),
                  child: Icon(
                    FontAwesomeIcons.locationArrow,
                    color: Colors.white,
                    size: 12,
                  ),
                ),
              ),
            ],
          ),
          //floatingActionButton:,
          bottomNavigationBar: Container(
            height: 85,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      bottom: 25,
                      left: 5,
                      child: CircleAvatar(
                        radius: 41,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 35,
                          backgroundImage: AssetImage('assets/person.jpg'),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: EdgeInsets.only(left: 80.0, bottom: 10),
                        child: ListTile(
                          minLeadingWidth: 2,
                          title: Text(
                            "Daniela James",
                            style: Theme.of(context)
                                .primaryTextTheme
                                .bodyText1
                                .copyWith(color: Colors.white),
                          ),
                          subtitle: Text(
                            "Body temperature 98.5",
                            style: Theme.of(context)
                                .primaryTextTheme
                                .headline2
                                .copyWith(color: Colors.white),
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.call, color: Colors.white)),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.message_outlined,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
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
