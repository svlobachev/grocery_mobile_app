import 'dart:core';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:grocery_mobile_app/dto/config.dart';
import 'package:grocery_mobile_app/dto/guest.dart';
import 'package:grocery_mobile_app/models/businessLayer/baseRoute.dart';
import 'package:grocery_mobile_app/models/businessLayer/global.dart' as global;
import 'package:grocery_mobile_app/networking/api_data/get_data_from_load.dart';
import 'package:grocery_mobile_app/services/config_service.dart';
import 'package:grocery_mobile_app/services/refresh_service.dart';

import 'notificationScreen.dart';
import 'offerScreen.dart';

GetDataFromLoad getDataFromLoad = GetDataFromLoad();

class HomeScreen extends BaseRoute {
  HomeScreen({a, o}) : super(a: a, o: o, r: 'HomeScreen');

  @override
  _HomeScreenState createState() => new _HomeScreenState();
}

class _HomeScreenState extends BaseRouteState {
  OnRefresh onRefresh = OnRefresh();
  Config config = ConfigService.instance.config;

  Guest guest;

  CarouselController _carouselController;

  List<String> _imagesList = getDataFromLoad.getBannersUrlFromApi;

  int _currentIndex = 0;

  List<Widget> _items() {
    List<Widget> list = [];
    for (int i = 0; i < _imagesList.length; i++) {
      list.add(Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              image: NetworkImage(
                _imagesList[i],
              ),
            )),
      ));
    }

    return list;
  }

  _HomeScreenState() : super();

  @override
  void initState() {
    super.initState();

    guest = global.currentUser;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  horizontalTitleGap: 5,
                  contentPadding: EdgeInsets.all(0),
                  leading: Image.network(
                    config.defaultConfig.logoUrl,
                    width: 100,
                    // width: MediaQuery.of(context).size.width * (config.defaultConfig.logoSizePercent / 100),
                  ),
                  // title: Text('${AppLocalizations.of(context).txt_deliver}',
                  //     textAlign: TextAlign.center, style: Theme.of(context).primaryTextTheme.bodyText1),
                  // subtitle: Text('DN 53 Madison buildig...',
                  //     style: Theme.of(context)
                  //         .primaryTextTheme
                  //         .headline2
                  //         .copyWith(fontWeight: FontWeight.w300, fontFamily: 'PoppinsLight')),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => NotificationScreen(
                                a: widget.analytics, o: widget.observer),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          // child: global.isDarkModeEnable
                          //     ? Icon(
                          //         Icons.notifications_none_outlined,
                          //         color: Colors.white,
                          //       )
                          //     : Icon(
                          //         Icons.notifications_none_outlined,
                          //         color: Colors.black,
                          //       ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Color(0xFFF05656),
                            borderRadius: BorderRadius.all(Radius.circular(6))),
                        margin: EdgeInsets.only(right: 10),
                        padding:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                        width: 73,
                        height: 25,
                        child: Text(
                          '\500₽',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).primaryTextTheme.caption,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.15,
                  child: GestureDetector(
                    onTap:
                        () => //Navigator.popUntil(context, ModalRoute.withName(OfferListScreen().routeName)),
                            Navigator.of(context, rootNavigator: false).push(
                      MaterialPageRoute(
                        builder: (context) => OfferListScreen(
                          a: widget.analytics,
                          o: widget.observer,
                          isFromHomeScreen: true,
                        ),
                      ),
                    ),
                    child: CarouselSlider(
                        items: _items(),
                        carouselController: _carouselController,
                        options: CarouselOptions(
                            viewportFraction: 0.99,
                            initialPage: _currentIndex,
                            enableInfiniteScroll: true,
                            reverse: false,
                            autoPlay: true,
                            autoPlayInterval: Duration(seconds: 5),
                            autoPlayAnimationDuration:
                                Duration(milliseconds: 800),
                            autoPlayCurve: Curves.fastOutSlowIn,
                            enlargeCenterPage: true,
                            scrollDirection: Axis.horizontal,
                            onPageChanged: (index, _) {
                              _currentIndex = index;
                              setState(() {});
                            })),
                  ),
                ),
                DotsIndicator(
                  dotsCount: _imagesList.length,
                  position: _currentIndex.toDouble(),
                  onTap: (i) {
                    _currentIndex = i.toInt();
                    _carouselController.animateToPage(_currentIndex,
                        duration: Duration(microseconds: 1),
                        curve: Curves.easeInOut);
                  },
                  decorator: DotsDecorator(
                    activeSize: const Size(6, 6),
                    size: const Size(6, 6),
                    activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(50.0),
                      ),
                    ),
                    activeColor: Theme.of(context).primaryColor,
                    color: global.isDarkModeEnable ? Colors.white : Colors.grey,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white30,
                  ),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {},
                        // => Navigator.of(context).push(
                        //   MaterialPageRoute(
                        //     builder: (context) => WalletScreen(
                        //         a: widget.analytics, o: widget.observer),
                        //   ),
                        // ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(25),
                              topRight: Radius.circular(25)),
                          child: Image.network(guest.card_banner_url,
                              width: MediaQuery.of(context).size.width * 0.8),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: Text(
                                '${guest.surname} ${guest.name} ${guest.patronymic}',
                                style: Theme.of(context)
                                    .primaryTextTheme
                                    .bodyText1,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: Column(
                                children: [
                                  Text(
                                    guest.card_fields['top']['left']['name'] !=
                                            ''
                                        ? guest.card_fields['top']['left']
                                            ['name']
                                        : '',
                                    style: Theme.of(context)
                                        .primaryTextTheme
                                        .bodyText1,
                                  ),
                                  Text(
                                    '${guest.card_fields['top']['left']['value'] != '' ? guest.card_fields['top']['left']['value'] : ''}',
                                    style: Theme.of(context)
                                        .primaryTextTheme
                                        .bodyText1,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 7),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    guest.card_fields['top']['right']['name'] !=
                                            ''
                                        ? guest.card_fields['top']['right']
                                            ['name']
                                        : '',
                                    style: Theme.of(context)
                                        .primaryTextTheme
                                        .bodyText1,
                                  ),
                                  Text(
                                    '${guest.card_fields['top']['right']['value'] != '' ? guest.card_fields['top']['right']['value'] : ''}',
                                    style: Theme.of(context)
                                        .primaryTextTheme
                                        .bodyText1,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.symmetric(vertical: 15),
                        child: Column(
                          children: [
                            Image.network(
                              guest.card_shortcode_img,
                              height: 50,
                              width: MediaQuery.of(context).size.width * 0.5,
                            ),
                            SizedBox(height: 5),
                            Text(guest.cardNumber),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 15, left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Text(
                      //   '${AppLocalizations.of(context).lbl_top_selling}',
                      //   style: Theme.of(context).primaryTextTheme.headline5,
                      // ),
                    ],
                  ),
                ),
                // Container(
                //   height: 210,
                //   child: ListView(
                //     scrollDirection: Axis.horizontal,
                //     children: _topSellingWidgetList(),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // List<Widget> _topSellingWidgetList() {// мёртвый код
  //   List<Widget> _widgetList = [];
  //   try {
  //     for (int i = 0; i < global.pageBlocks.length; i++) {
  //       _widgetList.add(
  //         InkWell(
  //           onTap: () {
  //             switch (global.pageBlocks[i].key) {
  //               case 'contact':
  //                 Navigator.of(context).push(MaterialPageRoute(
  //                     builder: (context) => AddressListScreen(
  //                         a: widget.analytics, o: widget.observer)));
  //                 break;
  //             }
  //             // Navigator.of(context).push(
  //             //   MaterialPageRoute(builder: (context) => AddAddressScreen(a: widget.analytics, o: widget.observer)
  //             //       //ProductDetailScreen(a: widget.analytics, o: widget.observer),
  //             //       ),
  //             // );
  //           },
  //           child: _buildListItem(i),
  //         ),
  //       );
  //     }
  //     return _widgetList;
  //   } catch (e) {
  //     _widgetList.add(SizedBox());
  //     print("Exception - homeScreen.dart - _topSellingWidgetList():" +
  //         e.toString());
  //     return _widgetList;
  //   }
  // }

  // Widget _buildListItem(int i) {// мёртвый код
  //   return Container(
  //     height: 210,
  //     margin: EdgeInsets.only(top: 10, left: 10),
  //     child: Stack(
  //       children: [
  //         Container(
  //           height: 160,
  //           width: 140,
  //           child: Container(
  //             decoration: BoxDecoration(
  //               color: global.pageBlocks[i].bannerBgColor.hexStringToColor(),
  //               // gradient: i % 3 == 1
  //               //     ? LinearGradient(
  //               //         stops: [0, .90],
  //               //         begin: Alignment.topCenter,
  //               //         end: Alignment.bottomCenter,
  //               //         colors: [Color(0XFF9EEEFF), Color(0XFFC0F4FF)],
  //               //       )
  //               //     : i % 3 == 2
  //               //         ? LinearGradient(
  //               //             stops: [0, .90],
  //               //             begin: Alignment.topCenter,
  //               //             end: Alignment.bottomCenter,
  //               //             colors: [Color(0XFFFFF1C0), Color(0XFFFFF1C0)],
  //               //           )
  //               //         : LinearGradient(
  //               //             stops: [0, .90],
  //               //             begin: Alignment.topCenter,
  //               //             end: Alignment.bottomCenter,
  //               //             colors: [Color(0XFFFFD4D7), Color(0XFFFFD4D7)],
  //               //           ),
  //               borderRadius: BorderRadius.only(
  //                 topLeft: Radius.circular(17),
  //                 bottomLeft: Radius.circular(17),
  //                 bottomRight: Radius.circular(17),
  //               ),
  //             ),
  //             child: Padding(
  //               padding: const EdgeInsets.only(top: 27, left: 10, right: 10),
  //               child: Column(
  //                 crossAxisAlignment: CrossAxisAlignment.center,
  //                 mainAxisAlignment: MainAxisAlignment.start,
  //                 children: [
  //                   Text(
  //                     global.pageBlocks[i].pageName,
  //                     style: Theme.of(context).primaryTextTheme.subtitle1,
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ),
  //         ),
  //         Positioned(
  //           right: 0,
  //           top: 0,
  //           child: Container(
  //             height: 30,
  //             width: 30,
  //             decoration: BoxDecoration(
  //               color: Colors.white60,
  //               borderRadius: BorderRadius.only(
  //                 bottomLeft: Radius.circular(10),
  //               ),
  //             ),
  //             child: Icon(
  //               Icons.add,
  //               color: global.isDarkModeEnable
  //                   ? Theme.of(context).scaffoldBackgroundColor
  //                   : i % 3 == 1
  //                       ? Color(0XFF9EEEFF)
  //                       : i % 3 == 2
  //                           ? Color(0XFFFFF1C0)
  //                           : Color(0XFFFFD4D7),
  //             ),
  //           ),
  //         ),
  //         // Positioned(
  //         //   bottom: 0,
  //         //   child: Container(
  //         //     decoration: BoxDecoration(
  //         //         image: DecorationImage(
  //         //       image: NetworkImage('${global.pageBlocks[i].iconUrl}'),
  //         //       fit: BoxFit.cover,
  //         //     )),
  //         //     height: 100,
  //         //     width: 140,
  //         //   ),
  //         // )
  //       ],
  //     ),
  //   );
  // }

  @override
  void dispose() {
    super.dispose();
  }
}
