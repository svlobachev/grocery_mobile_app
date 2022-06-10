import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:grocery_mobile_app/models/businessLayer/baseRoute.dart';
import 'package:grocery_mobile_app/screens/homeScreen.dart';
import 'package:grocery_mobile_app/screens/profileScreen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class BottomNavigationWidget extends BaseRoute {
  BottomNavigationWidget({a, o})
      : super(a: a, o: o, r: 'BottomNavigationWidget');
  @override
  _BottomNavigationWidgetState createState() =>
      new _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends BaseRouteState {
  int _currentIndex = 0;
  _BottomNavigationWidgetState() : super();
  TabController _tabController;
  @override
  void dispose() {
    super.dispose();
  }

  void _tabControllerListener() {
    setState(() {
      _currentIndex = _tabController.index;
    });
  }

  @override
  void initState() {
    super.initState();
    _tabController =
        new TabController(length: 2, vsync: this, initialIndex: _currentIndex);
    _tabController.addListener(_tabControllerListener);
  }

  final darkimageList = <String>[
    'assets/home_white.png',
    'assets/search_white.png',
    'assets/discount_white.png',
    'assets/profile_white.png',
  ];

  final lightImageList = <String>[
    'assets/home_black.png',
    'assets/search_black.png',
    'assets/discount_black.png',
    'assets/profile_dark.png',
  ];
  // List<IconData> _iconDataList = [MdiIcons.homeOutline, Icons.assignment_ind, MdiIcons.brightnessPercent, MdiIcons.accountOutline];
  List<IconData> _iconDataList = [
    MdiIcons.homeOutline,
    MdiIcons.accountOutline
  ];
  var _bottomNavIndex = 0;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return null;
      },
      child: SafeArea(
          child: Scaffold(
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: AnimatedBottomNavigationBar.builder(
          itemCount: _iconDataList
              .length, //global.isDarkModeEnable ? darkimageList.length : lightImageList.length,
          tabBuilder: (int index, bool isActive) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  _iconDataList[index],
                  color: Theme.of(context)
                      .bottomNavigationBarTheme
                      .unselectedIconTheme
                      .color,
                  size: Theme.of(context)
                      .bottomNavigationBarTheme
                      .unselectedIconTheme
                      .size,
                ),
                // global.isDarkModeEnable ? Image.asset(darkimageList[index]) : Image.asset(lightImageList[index]),
                const SizedBox(height: 5),
                isActive
                    ? Container(
                        height: 2,
                        width: 15,
                        color: Theme.of(context).primaryColorLight,
                      )
                    : SizedBox()
              ],
            );
          },
          splashRadius: 0,
          elevation: 0,
          backgroundColor:
              Theme.of(context).bottomNavigationBarTheme.backgroundColor,
          activeIndex: _bottomNavIndex,
          notchSmoothness: NotchSmoothness.softEdge,
          gapLocation: GapLocation.center,
          onTap: (index) => setState(() => _bottomNavIndex = index),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
            elevation: 0,
            backgroundColor: Color(0xFFFA692C),
            onPressed: () {
              // Navigator.of(context).push(
              //   MaterialPageRoute(
              //     builder: (context) => WalletScreen(a: widget.analytics, o: widget.observer),
              //   ),
              // );
            },
            child: Icon(
              MdiIcons.wallet,
              color: Colors.white,
              size: Theme.of(context)
                  .bottomNavigationBarTheme
                  .unselectedIconTheme
                  .size,
            )),
        body: _screens().elementAt(_bottomNavIndex),
      )),
    );
  }

  List<Widget> _screens() => [
        HomeScreen(a: widget.analytics, o: widget.observer),
        // AddressListScreen(a: widget.analytics, o: widget.observer),
        // OfferListScreen(a: widget.analytics, o: widget.observer),
        ProfileScreen(a: widget.analytics, o: widget.observer)
      ];
}
