import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:grocery_mobile_app/dto/guest.dart';
import 'package:grocery_mobile_app/models/businessLayer/baseRoute.dart';
import 'package:grocery_mobile_app/models/businessLayer/global.dart' as global;
import 'package:grocery_mobile_app/screens/profileEditScreen.dart';
import 'package:grocery_mobile_app/screens/splashScreen.dart';
import 'package:grocery_mobile_app/services/save_values_to_local_base.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ProfileScreen extends BaseRoute {
  ProfileScreen({a, o}) : super(a: a, o: o, r: 'ProfileScreen');

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends BaseRouteState {
  Guest guest;

  _ProfileScreenState() : super();

  @override
  void initState() {
    super.initState();

    guest = global.currentUser;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
          height: 240,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(45),
            ),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Theme.of(context).primaryColorLight,
                Theme.of(context).primaryColor
              ],
            ),
          ),
          alignment: Alignment.topCenter,
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.topCenter,
            children: [
              Container(
                height: 240,
                alignment: Alignment.topCenter,
                child: Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/myprofile.png'),
                    ),
                  ),
                  alignment: Alignment.topCenter,
                  child: const Center(
                    child: CircleAvatar(
                      radius: 60,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 53,
                        backgroundImage: AssetImage('assets/person.jpg'),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 45,
                child: Text(
                  '${guest.surname} ${guest.name} ${guest.patronymic}',
                  style: Theme.of(context)
                      .primaryTextTheme
                      .headline6
                      .copyWith(color: Colors.white),
                ),
              ),
              Positioned(
                bottom: 25,
                child: Text(
                  "${guest.phone} | ${guest.email}",
                  style: Theme.of(context)
                      .primaryTextTheme
                      .headline2
                      .copyWith(color: Colors.white),
                ),
              ),
              Positioned(
                bottom: -10,
                child: InkWell(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(40),
                  ),
                  // onTap: () {
                  //   Navigator.of(context).push(
                  //     MaterialPageRoute(
                  //       builder: (context) => ProfileEditScreen(
                  //           a: widget.analytics, o: widget.observer),
                  //     ),
                  //   );
                  // },
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).primaryColor,
                        width: 2,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(40),
                      ),
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                    child: IconButton(
                      icon: Image.asset('assets/edit.png'),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ProfileEditScreen(
                                a: widget.analytics, o: widget.observer),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ListTile(
                    //   onTap: () {
                    //     Navigator.of(context).push(
                    //       MaterialPageRoute(
                    //         builder: (context) => WalletScreen(a: widget.analytics, o: widget.observer),
                    //       ),
                    //     );
                    //   },
                    //   visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                    //   minLeadingWidth: 30,
                    //   contentPadding: EdgeInsets.symmetric(horizontal: 0),
                    //   leading: Icon(
                    //     MdiIcons.walletOutline,
                    //     color: Theme.of(context).primaryIconTheme.color.withOpacity(0.7),
                    //     size: 20,
                    //   ),
                    //   title: Text(
                    //     "${AppLocalizations.of(context).btn_my_wallet}",
                    //     style: Theme.of(context).primaryTextTheme.bodyText1,
                    //   ),
                    // ),
                    // ListTile(
                    //   onTap: () {
                    //     Navigator.of(context).push(
                    //       MaterialPageRoute(
                    //         builder: (context) => NotificationScreen(a: widget.analytics, o: widget.observer),
                    //       ),
                    //     );
                    //   },
                    //   visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                    //   minLeadingWidth: 30,
                    //   contentPadding: EdgeInsets.symmetric(horizontal: 0),
                    //   leading: Icon(
                    //     MdiIcons.bellOutline,
                    //     color: Theme.of(context).primaryIconTheme.color.withOpacity(0.7),
                    //     size: 20,
                    //   ),
                    //   title: Text(
                    //     "${AppLocalizations.of(context).btn_notification}",
                    //     style: Theme.of(context).primaryTextTheme.bodyText1,
                    //   ),
                    // ),
                    // ListTile(
                    //   onTap: () {
                    //     Navigator.of(context).push(
                    //       MaterialPageRoute(
                    //         builder: (context) => SubscriptionDetailScreen(a: widget.analytics, o: widget.observer),
                    //       ),
                    //     );
                    //   },
                    //   visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                    //   minLeadingWidth: 30,
                    //   contentPadding: EdgeInsets.symmetric(horizontal: 0),
                    //   leading: Icon(
                    //     MdiIcons.walletMembership,
                    //     color: Theme.of(context).primaryIconTheme.color.withOpacity(0.7),
                    //     size: 20,
                    //   ),
                    //   title: Text(
                    //     "${AppLocalizations.of(context).btn_membership}",
                    //     style: Theme.of(context).primaryTextTheme.bodyText1,
                    //   ),
                    // ),
                    // ListTile(
                    //   onTap: () {
                    //     Navigator.of(context).push(
                    //       MaterialPageRoute(
                    //         builder: (context) => ChooseLanguageScreen(a: widget.analytics, o: widget.observer),
                    //       ),
                    //     );
                    //   },
                    //   visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                    //   minLeadingWidth: 30,
                    //   contentPadding: EdgeInsets.symmetric(horizontal: 0),
                    //   leading: Icon(
                    //     MdiIcons.translate,
                    //     size: 20,
                    //     color: Theme.of(context).primaryIconTheme.color.withOpacity(0.7),
                    //   ),
                    //   title: Text(
                    //     "${AppLocalizations.of(context).tle_languages}",
                    //     style: Theme.of(context).primaryTextTheme.bodyText1,
                    //   ),
                    // ),
                    // Divider(),
                    // ListTile(
                    //   onTap: () {
                    //     global.isDarkModeEnable = !global.isDarkModeEnable;
                    //     Phoenix.rebirth(context);
                    //   },
                    //   visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                    //   minLeadingWidth: 30,
                    //   contentPadding: EdgeInsets.symmetric(horizontal: 0),
                    //   leading: global.isDarkModeEnable
                    //       ? Icon(
                    //           Icons.dark_mode_outlined,
                    //           color: Theme.of(context).primaryIconTheme.color.withOpacity(0.7),
                    //         )
                    //       : Icon(
                    //           Icons.light_mode,
                    //           color: Theme.of(context).primaryIconTheme.color.withOpacity(0.7),
                    //         ),
                    //   title: Text(
                    //     "${AppLocalizations.of(context).btn_mode}",
                    //     style: Theme.of(context).primaryTextTheme.bodyText1,
                    //   ),
                    // ),
                    // ListTile(
                    //   onTap: () {
                    //     Navigator.of(context).push(
                    //       MaterialPageRoute(
                    //         builder: (context) => ContactUsScreen(a: widget.analytics, o: widget.observer),
                    //       ),
                    //     );
                    //   },
                    //   visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                    //   minLeadingWidth: 30,
                    //   contentPadding: EdgeInsets.symmetric(horizontal: 0),
                    //   leading: Icon(
                    //     Icons.feedback_outlined,
                    //     size: 20,
                    //     color: Theme.of(context).primaryIconTheme.color.withOpacity(0.7),
                    //   ),
                    //   title: Text(
                    //     "${AppLocalizations.of(context).tle_contact_us}",
                    //     style: Theme.of(context).primaryTextTheme.bodyText1,
                    //   ),
                    ),
                ListTile(
                  onTap: () async {
                    global.accountToken = null;

                    removeLocalBaseValues();
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => SplashScreen(
                          a: null,
                          o: null,
                        ),
                      ),
                    );
                  },
                  visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                  minLeadingWidth: 30,
                  contentPadding: EdgeInsets.symmetric(horizontal: 0),
                  leading: Icon(
                    MdiIcons.logout,
                    size: 20,
                    color: Theme.of(context)
                        .primaryIconTheme
                        .color
                        .withOpacity(0.7),
                  ),
                  title: Text(
                    "${AppLocalizations.of(context).btn_logout}",
                    style: Theme.of(context).primaryTextTheme.bodyText1,
                  ),
                ),
                SizedBox(
                  height: 70,
                )
              ],
            ),
          ),
        ))
      ],
    ));
  }

  @override
  void dispose() {
    super.dispose();
  }

  bool isloading = true;
}
