import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:grocery_mobile_app/models/businessLayer/baseRoute.dart';
import 'package:grocery_mobile_app/models/businessLayer/global.dart' as global;
import 'package:grocery_mobile_app/models/productModel.dart';
import 'package:grocery_mobile_app/screens/checkOutScreen.dart';
import 'package:grocery_mobile_app/screens/filterScreen.dart';
import 'package:grocery_mobile_app/screens/productDetailScreen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class WishListScreen extends BaseRoute {
  WishListScreen({a, o}) : super(a: a, o: o, r: 'WishListScreen');
  @override
  _WishListScreenState createState() => new _WishListScreenState();
}

class _WishListScreenState extends BaseRouteState {
  List<Product> _productList = [
    new Product(
        name: "Fresh Chicken",
        amount: "11.08",
        description: "Fresh Chicken, ready to eat",
        discount: "20%",
        isFavourite: true,
        unitName: "kg",
        rating: "4.5",
        ratingCount: "98",
        imagePath: "assets/wheat.png",
        qty: 2),
    new Product(
        name: "Fresh Lamb",
        amount: "12.08",
        description: "Fresh lamb, ready to eat",
        isFavourite: true,
        unitName: "kg",
        rating: "4.5",
        ratingCount: "12",
        imagePath: "assets/cheese.png",
        qty: 3),
    new Product(
        name: "Fresh Mutton",
        amount: "15.08",
        description: "Fresh meat, ready to eat",
        discount: "20%",
        isFavourite: true,
        unitName: "kg",
        rating: "2",
        ratingCount: "102",
        imagePath: "assets/lamb.png",
        qty: 1),
    new Product(
        name: "Fresh Chicken",
        amount: "11.08",
        description: "Fresh Chicken, ready to eat",
        discount: "20%",
        isFavourite: true,
        unitName: "kg",
        rating: "4.5",
        ratingCount: "12",
        imagePath: "assets/wheat.png",
        qty: 0),
    new Product(
        name: "Fresh Lamb",
        amount: "12.08",
        description: "Fresh lamb, ready to eat",
        isFavourite: true,
        unitName: "kg",
        rating: "3",
        ratingCount: "65",
        imagePath: "assets/bakery.png",
        qty: 2),
    new Product(
        name: "Fresh Mutton",
        amount: "15.08",
        description: "Fresh meat, ready to eat",
        discount: "20%",
        isFavourite: true,
        unitName: "kg",
        rating: "4.5",
        ratingCount: "98",
        imagePath: "assets/lamb.png",
        qty: 0),
    new Product(
        name: "Fresh Lamb",
        amount: "12.08",
        description: "Fresh lamb, ready to eat",
        isFavourite: true,
        unitName: "kg",
        rating: "3",
        ratingCount: "65",
        imagePath: "assets/bakery.png",
        qty: 2),
    new Product(
        name: "Fresh Lamb",
        amount: "12.08",
        description: "Fresh lamb, ready to eat",
        isFavourite: true,
        unitName: "kg",
        rating: "4.5",
        ratingCount: "12",
        imagePath: "assets/cheese.png",
        qty: 3),
    new Product(
        name: "Fresh Mutton",
        amount: "15.08",
        description: "Fresh meat, ready to eat",
        discount: "20%",
        isFavourite: true,
        unitName: "kg",
        rating: "2",
        ratingCount: "102",
        imagePath: "assets/lamb.png",
        qty: 1),
    new Product(
        name: "Fresh Chicken",
        amount: "11.08",
        description: "Fresh Chicken, ready to eat",
        discount: "20%",
        isFavourite: true,
        unitName: "kg",
        rating: "4.5",
        ratingCount: "12",
        imagePath: "assets/wheat.png",
        qty: 0),
  ];
  _WishListScreenState() : super();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
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
          title: Text("${AppLocalizations.of(context).btn_wishlist}"),
          actions: [
            FloatingActionButton(
              elevation: 0,
              backgroundColor: Colors.transparent,
              heroTag: null,
              child: Badge(
                  badgeContent: Text(
                    "3",
                    style: TextStyle(color: Colors.white, fontSize: 08),
                  ),
                  padding: EdgeInsets.all(6),
                  badgeColor: Colors.red,
                  child: Icon(
                    MdiIcons.shoppingOutline,
                  )),
              mini: true,
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>
                        CheckoutScreen(a: widget.analytics, o: widget.observer),
                  ),
                );
              },
            ),
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) =>
                          FilterScreen(a: widget.analytics, o: widget.observer),
                    ),
                  );
                },
                icon: global.isDarkModeEnable
                    ? Image.asset('assets/filter_white.png')
                    : Image.asset('assets/filter_black.png')),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(10.0),
          child: ListView.builder(
            itemCount: _productList.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(top: 10, bottom: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ProductDetailScreen(
                            a: widget.analytics, o: widget.observer),
                      ),
                    );
                  },
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  child: Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 110,
                        width: MediaQuery.of(context).size.width,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).cardTheme.color,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10, left: 120),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: global.isRTL
                                  ? CrossAxisAlignment.end
                                  : CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${_productList[index].name}',
                                  style: Theme.of(context)
                                      .primaryTextTheme
                                      .bodyText1,
                                ),
                                Text(
                                  '${_productList[index].description}',
                                  style: Theme.of(context)
                                      .primaryTextTheme
                                      .headline2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                RichText(
                                    text: TextSpan(
                                        text: "\$",
                                        style: Theme.of(context)
                                            .primaryTextTheme
                                            .headline2,
                                        children: [
                                      TextSpan(
                                        text: '${_productList[index].amount}',
                                        style: Theme.of(context)
                                            .primaryTextTheme
                                            .bodyText1,
                                      ),
                                      TextSpan(
                                        text:
                                            ' / ${_productList[index].unitName}',
                                        style: Theme.of(context)
                                            .primaryTextTheme
                                            .headline2,
                                      )
                                    ])),
                                Padding(
                                  padding: EdgeInsets.only(top: 4.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.star,
                                        size: 18,
                                        color:
                                            Theme.of(context).primaryColorLight,
                                      ),
                                      RichText(
                                        text: TextSpan(
                                          text:
                                              "${_productList[index].rating} ",
                                          style: Theme.of(context)
                                              .primaryTextTheme
                                              .bodyText1,
                                          children: [
                                            TextSpan(
                                              text: '|',
                                              style: Theme.of(context)
                                                  .primaryTextTheme
                                                  .headline2,
                                            ),
                                            TextSpan(
                                              text:
                                                  ' ${_productList[index].ratingCount} ${AppLocalizations.of(context).txt_ratings}',
                                              style: Theme.of(context)
                                                  .primaryTextTheme
                                                  .headline1,
                                            )
                                          ],
                                        ),
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
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            _productList[index].discount != null
                                ? Container(
                                    height: 20,
                                    width: 60,
                                    decoration: BoxDecoration(
                                      color: Colors.lightBlue,
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(10),
                                        bottomLeft: Radius.circular(10),
                                      ),
                                    ),
                                    child: Text(
                                      "${_productList[index].discount} ${AppLocalizations.of(context).txt_off}",
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context)
                                          .primaryTextTheme
                                          .caption,
                                    ),
                                  )
                                : SizedBox(
                                    height: 20,
                                    width: 60,
                                  ),
                            IconButton(
                              onPressed: () {
                                // _productList[index].isFavourite = !_productList[index].isFavourite;
                                //setState(() {});
                              },
                              icon: _productList[index].isFavourite
                                  ? Image.asset('assets/fav_red.png')
                                  : Image.asset('assets/fav_grey.png'),
                            )
                          ],
                        ),
                      ),
                      _productList[index].qty == null ||
                              (_productList[index].qty != null &&
                                  _productList[index].qty == 0)
                          ? Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).iconTheme.color,
                                  borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(10),
                                    topLeft: Radius.circular(10),
                                  ),
                                ),
                                child: IconButton(
                                  padding: EdgeInsets.all(0),
                                  visualDensity: VisualDensity(
                                      vertical: -4, horizontal: -4),
                                  onPressed: () {
                                    _productList[index].qty =
                                        _productList[index].qty + 1;
                                    setState(() {});
                                  },
                                  icon: Icon(
                                    Icons.add,
                                    color: Theme.of(context)
                                        .primaryTextTheme
                                        .caption
                                        .color,
                                  ),
                                ),
                              ),
                            )
                          : Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                height: 28,
                                width: 80,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    stops: [0, .90],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                      Theme.of(context).primaryColor,
                                      Theme.of(context).primaryColorLight
                                    ],
                                  ),
                                  borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(10),
                                    topLeft: Radius.circular(10),
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    IconButton(
                                        padding: EdgeInsets.all(0),
                                        visualDensity: VisualDensity(
                                            vertical: -4, horizontal: -4),
                                        onPressed: () {
                                          _productList[index].qty =
                                              _productList[index].qty - 1;
                                          setState(() {});
                                        },
                                        icon: Icon(
                                          FontAwesomeIcons.minus,
                                          size: 11,
                                          color: Theme.of(context)
                                              .primaryTextTheme
                                              .caption
                                              .color,
                                        )),
                                    Text(
                                      "${_productList[index].qty}",
                                      style: Theme.of(context)
                                          .primaryTextTheme
                                          .bodyText1
                                          .copyWith(
                                              color: Theme.of(context)
                                                  .primaryTextTheme
                                                  .caption
                                                  .color),
                                    ),
                                    IconButton(
                                        padding: EdgeInsets.all(0),
                                        visualDensity: VisualDensity(
                                            vertical: -4, horizontal: -4),
                                        onPressed: () {
                                          _productList[index].qty =
                                              _productList[index].qty + 1;
                                          setState(() {});
                                        },
                                        icon: Icon(
                                          FontAwesomeIcons.plus,
                                          size: 11,
                                          color: Theme.of(context)
                                              .primaryTextTheme
                                              .caption
                                              .color,
                                        )),
                                  ],
                                ),
                              ),
                            ),
                      Positioned(
                        left: 0,
                        top: -20,
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                  '${_productList[index].imagePath}'),
                            ),
                          ),
                          height: 100,
                          width: 120,
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
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
                    colors: [
                      Theme.of(context).primaryColorLight,
                      Theme.of(context).primaryColor
                    ],
                  ),
                ),
                margin: EdgeInsets.all(8.0),
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: TextButton(
                    onPressed: () {},
                    child: Text(
                        '${AppLocalizations.of(context).btn_add_all_to_cart}')),
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
