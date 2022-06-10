import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:grocery_mobile_app/models/addressModel.dart';
import 'package:grocery_mobile_app/models/businessLayer/baseRoute.dart';
import 'package:grocery_mobile_app/models/businessLayer/global.dart' as global;
import 'package:grocery_mobile_app/models/productModel.dart';
import 'package:grocery_mobile_app/screens/addAddressScreen.dart';
import 'package:grocery_mobile_app/screens/addPaymentScreen.dart';
import 'package:grocery_mobile_app/screens/offerScreen.dart';
import 'package:grocery_mobile_app/screens/orderSucessScreen.dart';
import 'package:grocery_mobile_app/screens/productDetailScreen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CheckoutScreen extends BaseRoute {
  CheckoutScreen({a, o}) : super(a: a, o: o, r: 'CheckoutScreen');
  @override
  _CheckoutScreenState createState() => new _CheckoutScreenState();
}

class _CheckoutScreenState extends BaseRouteState {
  GlobalKey<ScaffoldState> _scaffoldKey;

  String selectedCouponCode;
  int vendorId;
  String selectedTimeSlot = '';
  String barberName;
  int _selectedAddress = 0;
  int _currentIndex = 0;
  int selectedCoupon;
  DateTime _focusedDay = DateTime.now();
  PageController _pageController;
  ScrollController _scrollController;
  int _selectedPaymentOption = 3;
  DateTime selectedDate;
  bool step1Done = false;
  bool step2Done = false;
  bool step3Done = false;
  bool step4Done = false;
  TextEditingController textController1 = TextEditingController();
  TextEditingController textController2 = TextEditingController();
  List<Address> addressList = [
    new Address(
        title: "Home",
        address:
            "Dn 53 Madison Building, Roy Enclave, lane 02 Nearest Landmark - Water park New York, USA"),
    new Address(
        title: "Office",
        address:
            "STP 02 Building sector 05, Module 02, Nearest landmark- New york , USA"),
    new Address(
        title: "Home 02",
        address:
            "STP 02 Building sector 05, Module 02, Nearest landmark- New york , USA"),
  ];
  _CheckoutScreenState() : super();
  @override
  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    _scrollController =
        new ScrollController(initialScrollOffset: _currentIndex.toDouble());
    _pageController = new PageController(initialPage: _currentIndex);
    _pageController.addListener(() {});
  }

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
        qty: 3),
  ];
  @override
  Widget build(BuildContext context) {
    List<String> _orderProcess = [
      '${AppLocalizations.of(context).txt_cart}',
      '${AppLocalizations.of(context).txt_address}',
      '${AppLocalizations.of(context).txt_time}',
      '${AppLocalizations.of(context).txt_payment}'
    ];
    List<String> _orderProcessText = [
      '${AppLocalizations.of(context).txt_shopping_cart}',
      '${AppLocalizations.of(context).txt_address}',
      '${AppLocalizations.of(context).txt_time}',
      '${AppLocalizations.of(context).txt_payment}'
    ];

    return WillPopScope(
      onWillPop: () {
        Navigator.of(context).pop();
        return null;
      },
      child: SafeArea(
        child: Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              _orderProcessText[_currentIndex],
            ),
            leading: IconButton(
                onPressed: () {
                  if (_currentIndex == 0) {
                    Navigator.of(context).pop();
                  } else {
                    _pageController.animateToPage(_currentIndex - 1,
                        duration: Duration(seconds: 1),
                        curve: Curves.fastOutSlowIn);
                    if (_currentIndex == 0) {
                      step1Done = false;
                    } else if (_currentIndex == 1) {
                      step2Done = false;
                    } else if (_currentIndex == 2) {
                      step3Done = false;
                    } else {}

                    setState(() {});
                  }
                },
                icon: Icon(MdiIcons.arrowLeft)),
            automaticallyImplyLeading: _currentIndex == 0 ? true : false,
          ),
          body: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 20,
                margin: EdgeInsets.only(left: 8, right: 8, bottom: 0, top: 10),
                child: Center(
                  child: ListView.builder(
                      controller: _scrollController,
                      itemCount: _orderProcess.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int i) {
                        return global.isDarkModeEnable
                            ? Row(
                                children: [
                                  Stack(
                                    alignment: Alignment.centerLeft,
                                    children: [
                                      Container(
                                          decoration: BoxDecoration(
                                            color: _currentIndex >= i
                                                ? Colors.black
                                                : Color(0xFF505266),
                                            border: Border.all(
                                              color: Colors.black,
                                              width: 1.5,
                                            ),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(10.0),
                                            ),
                                          ),
                                          alignment: Alignment.center,
                                          padding: EdgeInsets.only(
                                              left: 25, right: 10),
                                          child: Text(
                                            _orderProcess[i],
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 10,
                                            ),
                                          )),
                                      Container(
                                        height: 20,
                                        width: 20,
                                        decoration: BoxDecoration(
                                          color: _currentIndex >= i
                                              ? Colors.white
                                              : Colors.black,
                                          border: Border.all(
                                              color: _currentIndex == i
                                                  ? Colors.black
                                                  : Color(0xFF505266),
                                              width: 1.5),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(20.0),
                                          ),
                                        ),
                                        alignment: Alignment.center,
                                        child: Icon(
                                          Icons.circle,
                                          size: 8,
                                          color: _currentIndex >= i
                                              ? Colors.black
                                              : Color(0xFF505266),
                                        ),
                                      ),
                                    ],
                                  ),
                                  i == 3
                                      ? SizedBox()
                                      : Container(
                                          height: 2,
                                          color: _currentIndex >= i
                                              ? Colors.black
                                              : Color(0xFF505266),
                                          width: 20,
                                          margin: EdgeInsets.all(0),
                                        ),
                                ],
                              )
                            : Row(
                                children: [
                                  Stack(
                                    alignment: Alignment.centerLeft,
                                    children: [
                                      Container(
                                          decoration: BoxDecoration(
                                            color: _currentIndex >= i
                                                ? Color(0xFF4A4352)
                                                : Color(0xFFBcc8d2),
                                            border: Border.all(
                                              color: _currentIndex >= i
                                                  ? Color(0xFF4A4352)
                                                  : Color(0xFFBcc8d2),
                                              width: 1.5,
                                            ),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(10.0),
                                            ),
                                          ),
                                          alignment: Alignment.center,
                                          padding: EdgeInsets.only(
                                              left: 25, right: 10),
                                          child: Text(
                                            _orderProcess[i],
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 10,
                                            ),
                                          )),
                                      Container(
                                        height: 20,
                                        width: 20,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(
                                              color: _currentIndex >= i
                                                  ? Color(0xFF4A4352)
                                                  : Color(0xFFBcc8d2),
                                              width: 1.5),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(20.0),
                                          ),
                                        ),
                                        alignment: Alignment.center,
                                        child: Icon(
                                          Icons.circle,
                                          size: 8,
                                          color: _currentIndex >= i
                                              ? Color(0xFF4A4352)
                                              : Color(0xFFBcc8d2),
                                        ),
                                      ),
                                    ],
                                  ),
                                  i == 3
                                      ? SizedBox()
                                      : Container(
                                          height: 2,
                                          color: _currentIndex >= i
                                              ? Color(0xFF4A4352)
                                              : Color(0xFFBcc8d2),
                                          width: 20,
                                          margin: EdgeInsets.all(0),
                                        ),
                                ],
                              );
                      }),
                ),
              ),
              Expanded(
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (index) {
                    _currentIndex = index;
                    double currentIndex = _currentIndex.toDouble();
                    _scrollController.animateTo(currentIndex,
                        duration: Duration(seconds: 1),
                        curve: Curves.fastOutSlowIn);
                    setState(() {});
                  },
                  children: [
                    _cartWidget(),
                    _addressWidget(),
                    _timeWidget(),
                    _payment(),
                  ],
                ),
              ),
            ],
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
                        if (_currentIndex == 3) {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => OrderSuccessScreen(
                                  a: widget.analytics, o: widget.observer),
                            ),
                          );
                        } else {
                          _pageController.animateToPage(_currentIndex + 1,
                              duration: Duration(seconds: 1),
                              curve: Curves.fastOutSlowIn);
                        }
                      },
                      child: Text(_currentIndex == 0
                          ? '${AppLocalizations.of(context).btn_proceed_to_checkout}'
                          : _currentIndex == 1
                              ? '${AppLocalizations.of(context).btn_proceed_to_select_time}'
                              : _currentIndex == 2
                                  ? '${AppLocalizations.of(context).txt_proceed_to_pay}'
                                  : '${AppLocalizations.of(context).btn_make_payment}')),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _cartWidget() {
    return SingleChildScrollView(
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
                alignment: Alignment.centerLeft,
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
                              '${_productList[0].name}',
                              style:
                                  Theme.of(context).primaryTextTheme.bodyText1,
                            ),
                            Text(
                              '${_productList[0].description}',
                              style:
                                  Theme.of(context).primaryTextTheme.headline2,
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
                                    text: ' / ${_productList[0].unitName}',
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
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.star,
                                    size: 18,
                                    color: Theme.of(context).primaryColorLight,
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
                    left: 0,
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
                              '${_productList[0].name}',
                              style:
                                  Theme.of(context).primaryTextTheme.bodyText1,
                            ),
                            Text(
                              '${_productList[0].description}',
                              style:
                                  Theme.of(context).primaryTextTheme.headline2,
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
                                    text: ' / ${_productList[0].unitName}',
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
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.star,
                                    size: 18,
                                    color: Theme.of(context).primaryColorLight,
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
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IconButton(
                              padding: EdgeInsets.all(0),
                              visualDensity:
                                  VisualDensity(vertical: -4, horizontal: -4),
                              onPressed: () {},
                              icon: Icon(
                                FontAwesomeIcons.minus,
                                size: 11,
                                color: Theme.of(context)
                                    .primaryTextTheme
                                    .caption
                                    .color,
                              )),
                          Text(
                            "${_productList[0].qty}",
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
                              visualDensity:
                                  VisualDensity(vertical: -4, horizontal: -4),
                              onPressed: () {},
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
                          image: AssetImage('${_productList[0].imagePath}'),
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
                        padding: const EdgeInsets.only(top: 10, left: 120),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: global.isRTL
                              ? CrossAxisAlignment.end
                              : CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${_productList[1].name}',
                              style:
                                  Theme.of(context).primaryTextTheme.bodyText1,
                            ),
                            Text(
                              '${_productList[1].description}',
                              style:
                                  Theme.of(context).primaryTextTheme.headline2,
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
                                    text: ' / ${_productList[1].unitName}',
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
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.star,
                                    size: 18,
                                    color: Theme.of(context).primaryColorLight,
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
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IconButton(
                              padding: EdgeInsets.all(0),
                              visualDensity:
                                  VisualDensity(vertical: -4, horizontal: -4),
                              onPressed: () {},
                              icon: Icon(
                                FontAwesomeIcons.minus,
                                size: 11,
                                color: Theme.of(context)
                                    .primaryTextTheme
                                    .caption
                                    .color,
                              )),
                          Text(
                            "${_productList[1].qty}",
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
                              visualDensity:
                                  VisualDensity(vertical: -4, horizontal: -4),
                              onPressed: () {},
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
                          image: AssetImage('${_productList[1].imagePath}'),
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
                      .copyWith(color: Theme.of(context).primaryColorLight),
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
          global.isDarkModeEnable
              ? Container(
                  height: 120,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/checkout_cart_dark.png',
                      ),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                )
              : Container(
                  height: 120,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/checkout_cart_light.png',
                      ),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                )
        ],
      ),
    ));
  }

  Widget _addressWidget() {
    return SingleChildScrollView(
        child: Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) =>
                      AddAddressScreen(a: widget.analytics, o: widget.observer),
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
                    color:
                        global.isDarkModeEnable ? Colors.black : Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  alignment: Alignment.center,
                  child: Text(
                    "${AppLocalizations.of(context).btn_add_new_address}",
                    style: TextStyle(
                        fontSize: 16,
                        color: global.isDarkModeEnable
                            ? Theme.of(context).primaryColorLight
                            : Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w400),
                  )),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: RadioListTile(
              contentPadding: EdgeInsets.zero,
              value: 0,
              groupValue: _selectedAddress,
              onChanged: (val) {
                _selectedAddress = val;
                setState(() {});
              },
              title: Text(
                addressList[0].title,
                style: _selectedAddress == 0
                    ? Theme.of(context).primaryTextTheme.bodyText1
                    : Theme.of(context).primaryTextTheme.bodyText1.copyWith(
                        color:
                            Theme.of(context).primaryTextTheme.headline2.color),
              ),
              subtitle: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${addressList[0].address}",
                    style: _selectedAddress == 0
                        ? Theme.of(context).primaryTextTheme.headline2.copyWith(
                            color: Theme.of(context)
                                .primaryTextTheme
                                .bodyText1
                                .color)
                        : Theme.of(context).primaryTextTheme.headline2,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => AddAddressScreen(
                                    a: widget.analytics, o: widget.observer),
                              ),
                            );
                          },
                          icon: Image.asset('assets/edit.png')),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.delete,
                            color: Theme.of(context).primaryColor,
                          )),
                    ],
                  )
                ],
              ),
            ),
          ),
          Divider(),
          Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: RadioListTile(
              contentPadding: EdgeInsets.zero,
              value: 1,
              groupValue: _selectedAddress,
              onChanged: (val) {
                _selectedAddress = val;
                setState(() {});
              },
              title: Text(
                addressList[1].title,
                style: _selectedAddress == 1
                    ? Theme.of(context).primaryTextTheme.bodyText1
                    : Theme.of(context).primaryTextTheme.bodyText1.copyWith(
                        color:
                            Theme.of(context).primaryTextTheme.headline2.color),
              ),
              subtitle: Text(
                "${addressList[1].address}",
                style: _selectedAddress == 1
                    ? Theme.of(context).primaryTextTheme.headline2.copyWith(
                        color:
                            Theme.of(context).primaryTextTheme.bodyText1.color)
                    : Theme.of(context).primaryTextTheme.headline2,
              ),
            ),
          ),
          Divider(),
          Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: RadioListTile(
              contentPadding: EdgeInsets.zero,
              value: 2,
              groupValue: _selectedAddress,
              onChanged: (val) {
                _selectedAddress = val;
                setState(() {});
              },
              title: Text(
                addressList[2].title,
                style: _selectedAddress == 2
                    ? Theme.of(context).primaryTextTheme.bodyText1
                    : Theme.of(context).primaryTextTheme.bodyText1.copyWith(
                        color:
                            Theme.of(context).primaryTextTheme.headline2.color),
              ),
              subtitle: Text(
                "${addressList[2].address}",
                style: _selectedAddress == 2
                    ? Theme.of(context).primaryTextTheme.headline2.copyWith(
                        color:
                            Theme.of(context).primaryTextTheme.bodyText1.color)
                    : Theme.of(context).primaryTextTheme.headline2,
              ),
            ),
          ),
        ],
      ),
    ));
  }

  Widget _timeWidget() {
    return SingleChildScrollView(
        child: Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: 5,
              bottom: 7,
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '${AppLocalizations.of(context).lbl_select_date}',
                style: Theme.of(context).primaryTextTheme.headline5,
              ),
            ),
          ),
          global.isDarkModeEnable
              ? Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardTheme.color,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: TableCalendar(
                    firstDay: DateTime.now(),
                    lastDay: DateTime.now().add(Duration(days: 365)),
                    focusedDay: _focusedDay,
                    calendarFormat: CalendarFormat.month,
                    availableCalendarFormats: {CalendarFormat.month: 'Month'},
                    daysOfWeekHeight: 40,
                    daysOfWeekStyle: DaysOfWeekStyle(
                      weekdayStyle: TextStyle(color: Colors.white60),
                      weekendStyle: TextStyle(color: Colors.white60),
                    ),
                    rowHeight: 35,
                    calendarStyle: CalendarStyle(
                        todayTextStyle: TextStyle(color: Colors.white),
                        todayDecoration: BoxDecoration(
                          color: Colors.transparent,
                        ),
                        selectedTextStyle: TextStyle(color: Colors.white),
                        selectedDecoration: BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,
                        ),
                        rangeStartTextStyle: TextStyle(color: Colors.white60),
                        rangeEndTextStyle: TextStyle(color: Colors.white60),
                        disabledTextStyle: TextStyle(color: Colors.white60),
                        defaultTextStyle: TextStyle(color: Colors.white60),
                        outsideTextStyle: TextStyle(color: Colors.white60),
                        holidayTextStyle: TextStyle(color: Colors.white60),
                        withinRangeTextStyle: TextStyle(color: Colors.white60),
                        weekendTextStyle: TextStyle(color: Colors.white60)),
                    headerStyle: HeaderStyle(
                      formatButtonTextStyle: TextStyle(color: Colors.white60),
                      titleCentered: true,
                      titleTextStyle: TextStyle(
                        color: Colors.white,
                      ),
                      headerPadding: EdgeInsets.all(0),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                      ),
                    ),
                    selectedDayPredicate: (day) {
                      return isSameDay(selectedDate, day);
                    },
                    onDaySelected: (selectedDay, focusedDay) {
                      if (!isSameDay(selectedDate, selectedDay)) {
                        setState(() {
                          selectedDate = selectedDay;
                          _focusedDay = focusedDay;
                        });
                      }
                    },
                    onFormatChanged: (format) {},
                    onPageChanged: (focusedDay) {
                      _focusedDay = focusedDay;
                    },
                  ),
                )
              : Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardTheme.color,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: TableCalendar(
                    firstDay: DateTime.now(),
                    lastDay: DateTime.now().add(Duration(days: 365)),
                    focusedDay: _focusedDay,
                    calendarFormat: CalendarFormat.month,
                    availableCalendarFormats: {CalendarFormat.month: 'Month'},
                    daysOfWeekHeight: 40,
                    daysOfWeekStyle: DaysOfWeekStyle(
                      weekdayStyle: TextStyle(color: Colors.black87),
                      weekendStyle: TextStyle(color: Colors.black87),
                    ),
                    rowHeight: 50,
                    calendarStyle: CalendarStyle(
                        todayTextStyle: TextStyle(color: Colors.blue),
                        todayDecoration: BoxDecoration(
                          color: Colors.transparent,
                        ),
                        selectedTextStyle: TextStyle(color: Colors.white),
                        selectedDecoration: BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,
                        ),
                        rangeStartTextStyle: TextStyle(color: Colors.black87),
                        rangeEndTextStyle: TextStyle(color: Colors.black87),
                        disabledTextStyle: TextStyle(color: Colors.black87),
                        defaultTextStyle: TextStyle(color: Colors.black87),
                        outsideTextStyle: TextStyle(color: Colors.black87),
                        holidayTextStyle: TextStyle(color: Colors.black87),
                        withinRangeTextStyle: TextStyle(color: Colors.black87),
                        weekendTextStyle: TextStyle(color: Colors.black87)),
                    headerStyle: HeaderStyle(
                      formatButtonTextStyle: TextStyle(color: Colors.black87),
                      titleCentered: true,
                      titleTextStyle: TextStyle(
                        color: Colors.white,
                      ),
                      leftChevronIcon: Icon(
                        Icons.chevron_left,
                        color: Colors.white,
                      ),
                      rightChevronIcon: Icon(
                        Icons.chevron_right,
                        color: Colors.white,
                      ),
                      headerPadding: EdgeInsets.all(0),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                      ),
                    ),
                    selectedDayPredicate: (day) {
                      return isSameDay(selectedDate, day);
                    },
                    onDaySelected: (selectedDay, focusedDay) {
                      if (!isSameDay(selectedDate, selectedDay)) {
                        setState(() {
                          selectedDate = selectedDay;
                          _focusedDay = focusedDay;
                        });
                      }
                    },
                    onFormatChanged: (format) {},
                    onPageChanged: (focusedDay) {
                      _focusedDay = focusedDay;
                    },
                  ),
                ),
          Padding(
            padding: EdgeInsets.only(
              top: 5,
              bottom: 7,
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '${AppLocalizations.of(context).lbl_select_time_slot}',
                style: Theme.of(context).primaryTextTheme.headline5,
              ),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardTheme.color,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(4),
                  child: Text(
                    "8 AM - 12 PM",
                    style: Theme.of(context).primaryTextTheme.headline2,
                  ),
                ),
              ),
              Expanded(
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: global.isDarkModeEnable
                            ? Colors.black
                            : Colors.white,
                        border: Border.all(
                            color: global.isDarkModeEnable
                                ? Colors.transparent
                                : Colors.blue),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      alignment: Alignment.center,
                      margin: EdgeInsets.all(4),
                      child: Text(
                        "12 PM - 4 PM",
                        style: Theme.of(context)
                            .primaryTextTheme
                            .headline2
                            .copyWith(fontWeight: FontWeight.w600),
                      ),
                    ),
                    Container(
                        height: 15,
                        width: 22,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                          ),
                        ),
                        alignment: Alignment.center,
                        margin: EdgeInsets.all(4),
                        child: Icon(
                          Icons.check,
                          size: 10,
                          color: Colors.white,
                        )),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardTheme.color,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(4),
                  child: Text(
                    "8 AM - 12 PM",
                    style: Theme.of(context).primaryTextTheme.headline2,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 5,
              bottom: 7,
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '${AppLocalizations.of(context).txt_mention_time}',
                style: Theme.of(context).primaryTextTheme.headline5,
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.only(top: 0),
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
                    color:
                        global.isDarkModeEnable ? Colors.black : Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  alignment: Alignment.center,
                  child: Text(
                    "${AppLocalizations.of(context).btn_instant_delivery}",
                    style: TextStyle(
                        fontSize: 14,
                        color: global.isDarkModeEnable
                            ? Theme.of(context).primaryColorLight
                            : Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold),
                  )),
            ),
          ),
        ],
      ),
    ));
  }

  Widget _payment() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: 5,
                bottom: 7,
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '${AppLocalizations.of(context).lbl_offer_discount}',
                  style: Theme.of(context).primaryTextTheme.headline5,
                ),
              ),
            ),
            ListTile(
              visualDensity: VisualDensity(horizontal: -4, vertical: -4),
              minLeadingWidth: 30,
              contentPadding: EdgeInsets.all(0),
              leading: Icon(
                MdiIcons.brightnessPercent,
                size: 20,
                color: Theme.of(context).primaryColorLight,
              ),
              title: Text(
                "${AppLocalizations.of(context).txt_offer_desc}",
                style: Theme.of(context).primaryTextTheme.overline,
              ),
              subtitle: InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => OfferListScreen(
                          a: widget.analytics, o: widget.observer),
                    ),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.only(top: 6.0),
                  child: Text(
                    "${AppLocalizations.of(context).txt_show_offers}",
                    style: Theme.of(context).primaryTextTheme.headline1,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 10,
                bottom: 7,
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '${AppLocalizations.of(context).lbl_saved_payment_option}',
                  style: Theme.of(context).primaryTextTheme.headline5,
                ),
              ),
            ),
            RadioListTile(
                contentPadding: EdgeInsets.zero,
                value: 3,
                groupValue: _selectedPaymentOption,
                onChanged: (val) {
                  _selectedPaymentOption = val;
                  setState(() {});
                },
                title: Text(
                  "HDFC Credit Card",
                  style: Theme.of(context).primaryTextTheme.bodyText1,
                ),
                subtitle: Text(
                  "•••• •••• •••• 5229",
                  style: Theme.of(context).primaryTextTheme.headline2,
                ),
                secondary: Image.asset('assets/master_card.png')),
            RadioListTile(
                contentPadding: EdgeInsets.zero,
                value: 4,
                groupValue: _selectedPaymentOption,
                onChanged: (val) {
                  _selectedPaymentOption = val;
                  setState(() {});
                },
                title: Text(
                  "ICICI Credit Card",
                  style: Theme.of(context).primaryTextTheme.bodyText1,
                ),
                subtitle: Text(
                  "•••• •••• •••• 4421",
                  style: Theme.of(context).primaryTextTheme.headline2,
                ),
                secondary: global.isDarkModeEnable
                    ? Image.asset('assets/visa_card_dark.png')
                    : Image.asset('assets/visa_card_light.png')),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => AddPaymentScreen(
                        a: widget.analytics, o: widget.observer),
                  ),
                );
              },
              child: Container(
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
                      color:
                          global.isDarkModeEnable ? Colors.black : Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    alignment: Alignment.center,
                    child: Text(
                      "${AppLocalizations.of(context).btn_add_new_payment_option}",
                      style: TextStyle(
                          fontSize: 14,
                          color: global.isDarkModeEnable
                              ? Theme.of(context).primaryColorLight
                              : Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold),
                    )),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "${AppLocalizations.of(context).txt_date_of_delivery}",
                    style: Theme.of(context).primaryTextTheme.overline,
                  ),
                  Text(
                    "26.03.2021, 12 - 4PM",
                    style: Theme.of(context).primaryTextTheme.overline,
                  ),
                ],
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
                  InkWell(
                    onTap: () {},
                    child: Text(
                      "${AppLocalizations.of(context).txt_apply_coupon}",
                      style: Theme.of(context)
                          .primaryTextTheme
                          .overline
                          .copyWith(color: Theme.of(context).primaryColorLight),
                    ),
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
          ],
        ),
      ),
    );
  }
}
