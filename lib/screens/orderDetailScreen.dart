import 'package:flutter/material.dart';
import 'package:grocery_mobile_app/models/businessLayer/baseRoute.dart';
import 'package:grocery_mobile_app/models/businessLayer/global.dart' as global;
import 'package:grocery_mobile_app/models/productModel.dart';
import 'package:grocery_mobile_app/screens/checkOutScreen.dart';
import 'package:grocery_mobile_app/screens/productDetailScreen.dart';
import 'package:grocery_mobile_app/screens/rateOrderScreen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OrderDetailScreen extends BaseRoute {
  OrderDetailScreen({a, o}) : super(a: a, o: o, r: 'OrderDetailScreen');
  @override
  _OrderDetailScreenState createState() => new _OrderDetailScreenState();
}

class _OrderDetailScreenState extends BaseRouteState {
  _OrderDetailScreenState() : super();
  List<Product> _productList = [
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
        isFavourite: false,
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
        isFavourite: false,
        unitName: "kg",
        rating: "4.5",
        ratingCount: "12",
        imagePath: "assets/cheese.png",
        qty: 3),
  ];
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
          title: Text(
              "#578192 - ${AppLocalizations.of(context).tle_order_details}"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
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
                              padding:
                                  const EdgeInsets.only(top: 10, left: 120),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: global.isRTL
                                    ? CrossAxisAlignment.end
                                    : CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${_productList[0].name}',
                                    style: Theme.of(context)
                                        .primaryTextTheme
                                        .bodyText1,
                                  ),
                                  Text(
                                    '${_productList[0].description}',
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
                                          text: '${_productList[0].amount}',
                                          style: Theme.of(context)
                                              .primaryTextTheme
                                              .bodyText1,
                                        ),
                                        TextSpan(
                                          text:
                                              ' / ${_productList[0].unitName}',
                                          style: Theme.of(context)
                                              .primaryTextTheme
                                              .headline2,
                                        )
                                      ])),
                                  Padding(
                                    padding: EdgeInsets.only(top: 4.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.star,
                                          size: 18,
                                          color: Theme.of(context)
                                              .primaryColorLight,
                                        ),
                                        RichText(
                                          text: TextSpan(
                                            text: "${_productList[0].rating} ",
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
                                                    ' ${_productList[0].ratingCount} ${AppLocalizations.of(context).txt_ratings}',
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
                              _productList[0].discount != null
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
                                        "${_productList[0].discount} ${AppLocalizations.of(context).txt_off}",
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
                                  _productList[0].isFavourite =
                                      !_productList[0].isFavourite;
                                  setState(() {});
                                },
                                icon: _productList[0].isFavourite
                                    ? Image.asset('assets/fav_red.png')
                                    : Image.asset('assets/fav_grey.png'),
                              )
                            ],
                          ),
                        ),
                        Positioned(
                          left: 0,
                          top: -20,
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image:
                                    AssetImage('${_productList[0].imagePath}'),
                              ),
                            ),
                            height: 100,
                            width: 120,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
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
                              padding:
                                  const EdgeInsets.only(top: 10, left: 120),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: global.isRTL
                                    ? CrossAxisAlignment.end
                                    : CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${_productList[1].name}',
                                    style: Theme.of(context)
                                        .primaryTextTheme
                                        .bodyText1,
                                  ),
                                  Text(
                                    '${_productList[1].description}',
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
                                          text: '${_productList[1].amount}',
                                          style: Theme.of(context)
                                              .primaryTextTheme
                                              .bodyText1,
                                        ),
                                        TextSpan(
                                          text:
                                              ' / ${_productList[1].unitName}',
                                          style: Theme.of(context)
                                              .primaryTextTheme
                                              .headline2,
                                        )
                                      ])),
                                  Padding(
                                    padding: EdgeInsets.only(top: 4.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.star,
                                          size: 18,
                                          color: Theme.of(context)
                                              .primaryColorLight,
                                        ),
                                        RichText(
                                          text: TextSpan(
                                            text: "${_productList[1].rating} ",
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
                                                    ' ${_productList[1].ratingCount} ${AppLocalizations.of(context).txt_ratings}',
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
                              _productList[1].discount != null
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
                                        "${_productList[1].discount} ${AppLocalizations.of(context).txt_off}",
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
                                  _productList[1].isFavourite =
                                      !_productList[1].isFavourite;
                                  setState(() {});
                                },
                                icon: _productList[1].isFavourite
                                    ? Image.asset('assets/fav_red.png')
                                    : Image.asset('assets/fav_grey.png'),
                              )
                            ],
                          ),
                        ),
                        Positioned(
                          left: 0,
                          top: -20,
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image:
                                    AssetImage('${_productList[1].imagePath}'),
                              ),
                            ),
                            height: 100,
                            width: 120,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                ListTile(
                  visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                  contentPadding: EdgeInsets.all(0),
                  title: Text(
                    "${AppLocalizations.of(context).lbl_price_details}",
                    style: Theme.of(context).primaryTextTheme.headline5,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "${AppLocalizations.of(context).txt_total_price}",
                      style: Theme.of(context).primaryTextTheme.overline,
                    ),
                    Text(
                      "\$80.62",
                      style: Theme.of(context).primaryTextTheme.overline,
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "${AppLocalizations.of(context).txt_discount_price}",
                        style: Theme.of(context).primaryTextTheme.overline,
                      ),
                      Text(
                        " - \$20.02",
                        style: Theme.of(context)
                            .primaryTextTheme
                            .headline2
                            .copyWith(color: Colors.blue),
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
                        "${AppLocalizations.of(context).txt_coupon_discount}",
                        style: Theme.of(context).primaryTextTheme.overline,
                      ),
                      Text(
                        "${AppLocalizations.of(context).txt_apply_coupon}",
                        style: Theme.of(context)
                            .primaryTextTheme
                            .overline
                            .copyWith(
                                color: Theme.of(context).primaryColorLight),
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
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "${AppLocalizations.of(context).txt_delivery_charges}",
                            style: Theme.of(context).primaryTextTheme.overline,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 4.0),
                            child: Icon(
                              Icons.error_outline,
                              color: Theme.of(context).primaryColor,
                            ),
                          )
                        ],
                      ),
                      Text(
                        " - \$20.02",
                        style: Theme.of(context)
                            .primaryTextTheme
                            .overline
                            .copyWith(color: Colors.blue),
                      )
                    ],
                  ),
                ),
                Divider(),
                ListTile(
                  minVerticalPadding: 0,
                  visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                  minLeadingWidth: 30,
                  contentPadding: EdgeInsets.all(0),
                  leading: Text(
                    "${AppLocalizations.of(context).lbl_total_amount}",
                    style: Theme.of(context)
                        .primaryTextTheme
                        .bodyText1
                        .copyWith(fontWeight: FontWeight.w700),
                  ),
                  trailing: Text(
                    "\$61.27",
                    style: Theme.of(context)
                        .primaryTextTheme
                        .bodyText1
                        .copyWith(fontWeight: FontWeight.w700),
                  ),
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "${AppLocalizations.of(context).txt_status}",
                      style: Theme.of(context).primaryTextTheme.overline,
                    ),
                    Expanded(child: SizedBox()),
                    Icon(MdiIcons.checkCircle,
                        size: 20, color: Colors.greenAccent),
                    Text(
                      "${AppLocalizations.of(context).txt_delivered}",
                      style: Theme.of(context).primaryTextTheme.overline,
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => RateOrderScreen(
                            a: widget.analytics, o: widget.observer),
                      ),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 20),
                    padding: EdgeInsets.all(2),
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Theme.of(context).primaryColorLight,
                          Theme.of(context).primaryColor
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                        decoration: BoxDecoration(
                          color: global.isDarkModeEnable
                              ? Colors.black
                              : Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        alignment: Alignment.center,
                        child: Text(
                          "${AppLocalizations.of(context).btn_add_rating}",
                          style: TextStyle(
                              fontSize: 16,
                              color: global.isDarkModeEnable
                                  ? Theme.of(context).primaryColorLight
                                  : Theme.of(context).primaryColor,
                              fontWeight: FontWeight.w400),
                        )),
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
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => CheckoutScreen(
                              a: widget.analytics, o: widget.observer),
                        ),
                      );
                    },
                    child: Text(
                      '${AppLocalizations.of(context).btn_re_order}',
                    )),
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
