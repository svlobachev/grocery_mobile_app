import 'package:flutter/material.dart';
import 'package:grocery_mobile_app/models/businessLayer/baseRoute.dart';
import 'package:grocery_mobile_app/models/businessLayer/global.dart' as global;
import 'package:grocery_mobile_app/models/productModel.dart';
import 'package:grocery_mobile_app/screens/categoryListScreen.dart';
import 'package:grocery_mobile_app/screens/productDetailScreen.dart';
import 'package:grocery_mobile_app/screens/productListScreen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class SearchScreen extends BaseRoute {
  SearchScreen({a, o}) : super(a: a, o: o, r: 'SearchScreen');
  @override
  _SearchScreenState createState() => new _SearchScreenState();
}

class _SearchScreenState extends BaseRouteState {
  _SearchScreenState() : super();
  List<Product> _allCategoryList = [
    new Product(
        name: "Basmati Rice",
        amount: "7.01",
        description: "120+ backery items",
        discount: "20%",
        isFavourite: true,
        unitName: "kg",
        rating: "2",
        ratingCount: "102",
        imagePath: "assets/bakery.png",
        qty: 1),
    new Product(
        name: "Fresh Chicken",
        amount: "11.0",
        description: "120+ chicken items",
        discount: "20%",
        isFavourite: true,
        unitName: "kg",
        rating: "4.5",
        ratingCount: "12",
        imagePath: "assets/lamb.png",
        qty: 0),
    new Product(
        name: "Fresh wheat",
        amount: "9.25",
        description: "120+ meet items",
        isFavourite: false,
        unitName: "kg",
        rating: "3",
        ratingCount: "65",
        imagePath: "assets/wheat.png",
        qty: 2),
    new Product(
        name: "Fresh Mutton",
        amount: "0.5",
        description: "120+ mutton items",
        discount: "20%",
        isFavourite: true,
        unitName: "kg",
        rating: "4.5",
        ratingCount: "98",
        imagePath: "assets/cheese.png",
        qty: 0),
    new Product(
        name: "Fresh Lamb",
        amount: "6.5",
        description: "120+ lamb items",
        isFavourite: false,
        unitName: "kg",
        rating: "4.5",
        ratingCount: "12",
        imagePath: "assets/bakery.png",
        qty: 3),
  ];

  List<Product> _topSellingProduct = [
    new Product(
        name: "Bakery",
        amount: "7.01",
        description: "Multiple Products",
        discount: "20%",
        isFavourite: true,
        unitName: "Packet",
        rating: "2",
        ratingCount: "102",
        imagePath: "assets/bakery.png",
        qty: 1),
    new Product(
        name: "Milk,",
        amount: "11.0",
        description: "Multiple Products",
        discount: "20%",
        isFavourite: true,
        unitName: "Packet",
        rating: "4.5",
        ratingCount: "12",
        imagePath: "assets/cheese.png",
        qty: 0),
    new Product(
        name: "Breads",
        amount: "9.25",
        description: "Multiple Products",
        isFavourite: false,
        unitName: "Packet",
        rating: "3",
        ratingCount: "65",
        imagePath: "assets/lamb.png",
        qty: 2),
    new Product(
        name: "Bakery",
        amount: "0.55",
        description: "Multiple Products",
        discount: "20%",
        isFavourite: true,
        unitName: "Packet",
        rating: "4.5",
        ratingCount: "98",
        imagePath: "assets/bakery.png",
        qty: 0),
    new Product(
        name: "Cheese",
        amount: "6.55",
        description: "Multiple Products",
        isFavourite: false,
        unitName: "Packet",
        rating: "4.5",
        ratingCount: "12",
        imagePath: "assets/wheat.png",
        qty: 3),
  ];

  List<Product> _spotLightProduct = [
    new Product(
        name: "Drinks",
        amount: "7.01",
        description: "Pack of 3",
        discount: "20%",
        isFavourite: true,
        unitName: "Packet",
        rating: "2",
        ratingCount: "102",
        imagePath: "assets/cheese.png",
        qty: 1),
    new Product(
        name: "Drinks",
        amount: "11.0",
        description: "Pack of 3",
        discount: "15%",
        isFavourite: true,
        unitName: "Packet",
        rating: "4.5",
        ratingCount: "12",
        imagePath: "assets/wheat.png",
        qty: 0),
    new Product(
        name: "Drinks",
        amount: "9.25",
        description: "Pack of 3",
        discount: "10%",
        isFavourite: false,
        unitName: "Packet",
        rating: "3",
        ratingCount: "65",
        imagePath: "assets/bakery.png",
        qty: 2),
    new Product(
        name: "Drinks",
        amount: "0.55",
        description: "Pack of 3",
        discount: "20%",
        isFavourite: true,
        unitName: "Packet",
        rating: "4.5",
        ratingCount: "98",
        imagePath: "assets/cheese.png",
        qty: 0),
    new Product(
        name: "Drinks",
        amount: "6.55",
        description: "Pack of 3",
        discount: "10%",
        isFavourite: false,
        unitName: "Packet",
        rating: "4.5",
        ratingCount: "12",
        imagePath: "assets/wheat.png",
        qty: 3),
  ];
  List<Widget> _topSellingWidgetList() {
    List<Widget> _widgetList = [];
    try {
      for (int i = 0; i < _topSellingProduct.length; i++) {
        _widgetList.add(
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ProductDetailScreen(
                      a: widget.analytics, o: widget.observer),
                ),
              );
            },
            child: Container(
              height: 210,
              margin: EdgeInsets.only(top: 10, left: 5, right: 5),
              child: Stack(
                children: [
                  Container(
                    height: 160,
                    width: 140,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: i % 3 == 1
                            ? LinearGradient(
                                stops: [0, .90],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [Color(0XFF9EEEFF), Color(0XFFC0F4FF)],
                              )
                            : i % 3 == 2
                                ? LinearGradient(
                                    stops: [0, .90],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Color(0XFFFFF1C0),
                                      Color(0XFFFFF1C0)
                                    ],
                                  )
                                : LinearGradient(
                                    stops: [0, .90],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Color(0XFFFFD4D7),
                                      Color(0XFFFFD4D7)
                                    ],
                                  ),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(17),
                          bottomLeft: Radius.circular(17),
                          bottomRight: Radius.circular(17),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 18, left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              '${_topSellingProduct[i].name}',
                              style:
                                  Theme.of(context).primaryTextTheme.subtitle1,
                            ),
                            Text(
                              '${_topSellingProduct[i].description}',
                              style:
                                  Theme.of(context).primaryTextTheme.subtitle2,
                            ),
                            Container(
                              width: 130,
                              padding: const EdgeInsets.only(top: 2),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "\$",
                                        style: Theme.of(context)
                                            .primaryTextTheme
                                            .subtitle2,
                                      ),
                                      Text(
                                        '${_topSellingProduct[i].amount} ',
                                        style: Theme.of(context)
                                            .primaryTextTheme
                                            .subtitle1,
                                      ),
                                      Text(
                                        '/ ${_topSellingProduct[i].unitName}',
                                        style: Theme.of(context)
                                            .primaryTextTheme
                                            .subtitle2,
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: Colors.white60,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                        ),
                      ),
                      child: Icon(
                        Icons.add,
                        color: global.isDarkModeEnable
                            ? Theme.of(context).scaffoldBackgroundColor
                            : i % 3 == 1
                                ? Color(0XFF9EEEFF)
                                : i % 3 == 2
                                    ? Color(0XFFFFF1C0)
                                    : Color(0XFFFFD4D7),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage('${_topSellingProduct[i].imagePath}'),
                        fit: BoxFit.cover,
                      )),
                      height: 100,
                      width: 140,
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      }
      return _widgetList;
    } catch (e) {
      _widgetList.add(SizedBox());
      print("Exception - homeScreen.dart - _topSellingWidgetList():" +
          e.toString());
      return _widgetList;
    }
  }

  List<Widget> _allCategoryWidgetList() {
    List<Widget> _widgetList = [];
    try {
      for (int i = 0; i < _allCategoryList.length; i++) {
        _widgetList.add(
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ProductDetailScreen(
                      a: widget.analytics, o: widget.observer),
                ),
              );
            },
            child: Container(
              height: 170,
              margin: EdgeInsets.only(top: 40, left: 5, right: 5),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: 170,
                    width: 140,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardTheme.color,
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(top: 78, left: 10, right: 5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${_allCategoryList[i].name}',
                              style:
                                  Theme.of(context).primaryTextTheme.bodyText1,
                            ),
                            Text(
                              '${_allCategoryList[i].description}',
                              style:
                                  Theme.of(context).primaryTextTheme.headline2,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      '${AppLocalizations.of(context).txt_from} ',
                                      style: Theme.of(context)
                                          .primaryTextTheme
                                          .headline2,
                                    ),
                                    Text(
                                      '\$ ',
                                      style: TextStyle(
                                          fontSize: 10,
                                          color: Theme.of(context)
                                              .primaryTextTheme
                                              .headline2
                                              .color),
                                    ),
                                    Text(
                                      '${_allCategoryList[i].amount}',
                                      style: Theme.of(context)
                                          .primaryTextTheme
                                          .bodyText1,
                                    )
                                  ],
                                ),
                                InkWell(
                                    customBorder: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    onTap: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              ProductListScreen(
                                                  a: widget.analytics,
                                                  o: widget.observer),
                                        ),
                                      );
                                    },
                                    child:
                                        Image.asset('assets/orange_next.png')),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: -30,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                              '${_allCategoryList[i].imagePath}',
                            ),
                            fit: BoxFit.cover),
                      ),
                      height: 100,
                      width: 140,
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      }
      return _widgetList;
    } catch (e) {
      _widgetList.add(SizedBox());
      print("Exception - homeScreen.dart - _allCategoryWidgetList():" +
          e.toString());
      return _widgetList;
    }
  }

  List<Widget> _spotLightWidgetList() {
    List<Widget> _widgetList = [];
    try {
      for (int i = 0; i < _spotLightProduct.length; i++) {
        _widgetList.add(
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ProductDetailScreen(
                      a: widget.analytics, o: widget.observer),
                ),
              );
            },
            child: Container(
              margin: EdgeInsets.only(top: 10, left: 10),
              child: Stack(
                children: [
                  Container(
                    height: 105,
                    width: 180,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardTheme.color,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(17),
                          bottomLeft: Radius.circular(17),
                          bottomRight: Radius.circular(17),
                        ),
                      ),
                      child: Padding(
                        padding:
                            const EdgeInsets.only(top: 28, left: 10, right: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              '${_spotLightProduct[i].name}',
                              style:
                                  Theme.of(context).primaryTextTheme.bodyText1,
                            ),
                            Container(
                              width: 130,
                              padding: const EdgeInsets.only(top: 2),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "\$",
                                        style: Theme.of(context)
                                            .primaryTextTheme
                                            .headline2,
                                      ),
                                      Text(
                                        '${_spotLightProduct[i].amount} ',
                                        style: Theme.of(context)
                                            .primaryTextTheme
                                            .headline5,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              '${_spotLightProduct[i].description}',
                              style:
                                  Theme.of(context).primaryTextTheme.headline2,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Container(
                      height: 20,
                      width: 60,
                      decoration: BoxDecoration(
                        color: Colors.lightBlue,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                      ),
                      child: Text(
                        "${_spotLightProduct[i].discount} ${AppLocalizations.of(context).txt_off}",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).primaryTextTheme.caption,
                      ),
                    ),
                  ),
                  Positioned(
                    right: global.isRTL ? null : 0,
                    left: global.isRTL ? 0 : null,
                    top: 30,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image:
                              AssetImage('${_spotLightProduct[i].imagePath}'),
                        ),
                      ),
                      height: 100,
                      width: 98,
                    ),
                  ),
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: Theme.of(context)
                            .bottomNavigationBarTheme
                            .backgroundColor,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                        ),
                      ),
                      child: Icon(
                        Icons.add,
                        color: Theme.of(context).primaryColorLight,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }
      return _widgetList;
    } catch (e) {
      _widgetList.add(SizedBox());
      print("Exception - homeScreen.dart - _spotLightWidgetList():" +
          e.toString());
      return _widgetList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(0.0))),
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.only(),
            child: TextFormField(
              style: Theme.of(context).primaryTextTheme.bodyText1,
              decoration: InputDecoration(
                hintText:
                    '${AppLocalizations.of(context).hnt_search_for_products}',
                prefixIcon: Icon(
                  MdiIcons.magnify,
                ),
                contentPadding: EdgeInsets.only(top: 10),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 5, bottom: 5),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '${AppLocalizations.of(context).lbl_recent_search}',
                          style: Theme.of(context).primaryTextTheme.headline5,
                        ),
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
                            'Healthy Snacks',
                            style: Theme.of(context).primaryTextTheme.overline,
                          ),
                          Icon(
                            MdiIcons.arrowTopRight,
                            color: Theme.of(context)
                                .primaryIconTheme
                                .color
                                .withOpacity(0.7),
                            size: 20,
                          ),
                        ],
                      ),
                    ),
                    Divider(),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 5,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Cakes & Pastries',
                            style: Theme.of(context).primaryTextTheme.overline,
                          ),
                          Icon(
                            MdiIcons.arrowTopRight,
                            color: Theme.of(context)
                                .primaryIconTheme
                                .color
                                .withOpacity(0.7),
                            size: 20,
                          ),
                        ],
                      ),
                    ),
                    Divider(),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 5,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Kitchen Essentials',
                            style: Theme.of(context).primaryTextTheme.overline,
                          ),
                          Icon(
                            MdiIcons.arrowTopRight,
                            color: Theme.of(context)
                                .primaryIconTheme
                                .color
                                .withOpacity(0.7),
                            size: 20,
                          ),
                        ],
                      ),
                    ),
                    Divider(),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 5,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Fresh Meats',
                            style: Theme.of(context).primaryTextTheme.overline,
                          ),
                          Icon(
                            MdiIcons.arrowTopRight,
                            color: Theme.of(context)
                                .primaryIconTheme
                                .color
                                .withOpacity(0.7),
                            size: 20,
                          ),
                        ],
                      ),
                    ),
                    Divider(),
                    InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          "${AppLocalizations.of(context).btn_load_more}",
                          style: Theme.of(context).primaryTextTheme.headline1,
                        ),
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
                            '${AppLocalizations.of(context).tle_all_category}',
                            style: Theme.of(context).primaryTextTheme.headline5,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => CategoryListScreen(
                                      a: widget.analytics, o: widget.observer),
                                ),
                              );
                            },
                            child: Text(
                              '${AppLocalizations.of(context).btn_explore_all}',
                              style:
                                  Theme.of(context).primaryTextTheme.headline1,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 200,
                      child: ListView(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        children: _allCategoryWidgetList(),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 15,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${AppLocalizations.of(context).tle_search_by_top_selling}',
                            style: Theme.of(context).primaryTextTheme.headline5,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => ProductListScreen(
                                      a: widget.analytics, o: widget.observer),
                                ),
                              );
                            },
                            child: Text(
                              '${AppLocalizations.of(context).btn_explore_all}',
                              style:
                                  Theme.of(context).primaryTextTheme.headline1,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 210,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: _topSellingWidgetList(),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 15,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${AppLocalizations.of(context).lbl_in_spotlight}',
                            style: Theme.of(context).primaryTextTheme.headline5,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => ProductListScreen(
                                      a: widget.analytics, o: widget.observer),
                                ),
                              );
                            },
                            child: Text(
                              '${AppLocalizations.of(context).btn_explore_all}',
                              style:
                                  Theme.of(context).primaryTextTheme.headline1,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 135,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: _spotLightWidgetList(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
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
