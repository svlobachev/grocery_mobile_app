import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:grocery_mobile_app/dto/guest.dart';
import 'package:grocery_mobile_app/models/businessLayer/baseRoute.dart';
import 'package:grocery_mobile_app/models/businessLayer/global.dart' as global;
import 'package:grocery_mobile_app/models/orderModel.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class WalletScreen extends BaseRoute {
  WalletScreen({a, o}) : super(a: a, o: o, r: 'WalletScreen');
  @override
  _WalletScreenState createState() => new _WalletScreenState();
}

class _WalletScreenState extends BaseRouteState {
  Guest guest = global.currentUser;

  List<Order> _wallet = [
    new Order(
        name: "Fresh Mutton",
        amount: "15.08",
        datetime: "12:03 PM | 24.02.2021",
        orderId: "#51602",
        orderOption: "Re - order",
        orderStatus: "Delivered"),
    new Order(
        name: "Fresh Chicken",
        amount: "11.08",
        datetime: "10:57 AM | 25.02.2021",
        orderId: "#202145",
        orderOption: "Cancel",
        orderStatus: "Scheduled"),
    new Order(
        name: "Fresh Lamb",
        amount: "12.08",
        datetime: "12:03 PM | 24.02.2021",
        orderId: "#202145",
        orderOption: "Track Order",
        orderStatus: "Ongoing"),
    new Order(
        name: "Fresh Mutton",
        amount: "15.08",
        datetime: "11:36 AM | 27.02.2021",
        orderId: "#412563",
        orderOption: "Re - order",
        orderStatus: "Cancelled"),
    new Order(
        name: "Fresh Chicken",
        amount: "11.08",
        datetime: "12:03 PM | 26.02.2021",
        orderId: "#202145",
        orderOption: "Cancel",
        orderStatus: "Scheduled"),
    new Order(
        name: "Fresh Lamb",
        amount: "12.08",
        datetime: "12:03 PM | 28.02.2021",
        orderId: "#412563",
        orderOption: "Re - order",
        orderStatus: "Ongoing"),
    new Order(
        name: "Fresh Mutton",
        amount: "15.08",
        datetime: "12:03 PM | 24.02.2021",
        orderId: "#51602",
        orderOption: "Re - order",
        orderStatus: "Delivered"),
    new Order(
        name: "Fresh Chicken",
        amount: "11.08",
        datetime: "10:57 AM | 25.02.2021",
        orderId: "#202145",
        orderOption: "Cancel",
        orderStatus: "Scheduled"),
    new Order(
        name: "Fresh Lamb",
        amount: "12.08",
        datetime: "12:03 PM | 24.02.2021",
        orderId: "#202145",
        orderOption: "Track Order",
        orderStatus: "Ongoing"),
    new Order(
        name: "Fresh Mutton",
        amount: "15.08",
        datetime: "11:36 AM | 27.02.2021",
        orderId: "#412563",
        orderOption: "Re - order",
        orderStatus: "Cancelled"),
    new Order(
        name: "Fresh Chicken",
        amount: "11.08",
        datetime: "12:03 PM | 26.02.2021",
        orderId: "#202145",
        orderOption: "Cancel",
        orderStatus: "Scheduled"),
    new Order(
        name: "Fresh Lamb",
        amount: "12.08",
        datetime: "12:03 PM | 28.02.2021",
        orderId: "#412563",
        orderOption: "Re - order",
        orderStatus: "Ongoing"),
  ];
  _WalletScreenState() : super();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
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
            centerTitle: true,
            title: Text("${AppLocalizations.of(context).btn_my_wallet}"),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white30,
                  ),
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25)),
                        child: Image.asset('assets/banner_wallet.png'),
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
                                style: Theme.of(context).primaryTextTheme.bodyText1,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: Column(
                                children: [
                                  Text(
                                    'Скидка',
                                    style: Theme.of(context).primaryTextTheme.bodyText1,
                                  ),
                                  Text(
                                    '${guest.discountPercent != null ? guest.discountPercent : 0}%',
                                    style: Theme.of(context).primaryTextTheme.bodyText1,
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
                                    'Уровень',
                                    style: Theme.of(context).primaryTextTheme.bodyText1,
                                  ),
                                  Text(
                                    guest.category,
                                    style: Theme.of(context).primaryTextTheme.bodyText1,
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
                            Image.asset(
                              'assets/barcode.png',
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
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Text(
                    'Cashback до 10% с каждого заказа в любом из наших заведений! Оплата бонусами до 50% от стоимости заказа.',
                    //offerList[index].title,
                    textAlign: TextAlign.left,
                    style: Theme.of(context).primaryTextTheme.bodyText1,
                  ),
                ),
                Expanded(
                  child: _rechargeHistoryWidget(),
                ),
                // Container(
                //   child: Padding(
                //     padding: const EdgeInsets.all(10.0),
                //     child: SizedBox(
                //       height: 80,
                //       child: AppBar(
                //         shape: RoundedRectangleBorder(
                //           borderRadius: BorderRadius.all(
                //             Radius.circular(10.0),
                //           ),
                //         ),
                //         backgroundColor: global.isDarkModeEnable ? Color(0xFF435276) : Color(0xFFEDF2F6),
                //         bottom: TabBar(
                //           indicator: UnderlineTabIndicator(
                //             borderSide: BorderSide(
                //               width: 3.0,
                //               color: global.isDarkModeEnable ? Theme.of(context).primaryColor : Color(0xFFEF5656),
                //             ),
                //             insets: EdgeInsets.symmetric(horizontal: 8.0),
                //           ),
                //           labelColor: global.isDarkModeEnable ? Colors.white : Colors.black,
                //           indicatorWeight: 4,
                //           unselectedLabelStyle: TextStyle(
                //               fontSize: 13,
                //               color: global.isDarkModeEnable ? Colors.white : Colors.black,
                //               fontWeight: FontWeight.w400),
                //           labelStyle: TextStyle(
                //               fontSize: 13,
                //               color: global.isDarkModeEnable ? Colors.white : Colors.black,
                //               fontWeight: FontWeight.bold),
                //           indicatorSize: TabBarIndicatorSize.label,
                //           indicatorColor: global.isDarkModeEnable ? Theme.of(context).primaryColor : Color(0xFFEF5656),
                //           tabs: [
                //             Tab(
                //                 icon: Icon(
                //                   MdiIcons.wallet,
                //                   size: 18,
                //                 ),
                //                 child: Text(
                //                   '${AppLocalizations.of(context).lbl_recharge_history}',
                //                 )),
                //             Tab(
                //                 icon: Icon(
                //                   MdiIcons.walletPlus,
                //                   size: 18,
                //                 ),
                //                 child: Text(
                //                   '${AppLocalizations.of(context).lbl_recharge_history}',
                //                 )),
                //             Tab(
                //                 icon: Icon(
                //                   MdiIcons.currencyUsdOff,
                //                   size: 18,
                //                 ),
                //                 child: Text(
                //                   '${AppLocalizations.of(context).lbl_spent_analysis}',
                //                 )),
                //           ],
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
                // Expanded(
                //   child: Padding(
                //     padding: EdgeInsets.all(10.0),
                //     child: TabBarView(
                //       children: [
                //         _rechargeHistoryWidget(),
                //         _rechargeWallet(),
                //         _spentAnalysis(),
                //       ],
                //     ),
                //   ),
                // ),
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

  Widget _rechargeHistoryWidget() {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: _wallet.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {},
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 6.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                          color: global.isDarkModeEnable ? Color(0xFF373C58) : Color(0xFFF2F5F8),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                        child: Text(
                          '${AppLocalizations.of(context).lbl_razoypay}',
                          style: Theme.of(context).primaryTextTheme.headline2,
                        ),
                      ),
                      Expanded(child: SizedBox()),
                      Icon(
                        MdiIcons.checkDecagram,
                        size: 20,
                        color: Colors.greenAccent,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text(
                          'Успешно',
                          style: Theme.of(context).primaryTextTheme.headline2,
                        ),
                      )
                    ],
                  ),
                ),
                ListTile(
                  visualDensity: VisualDensity(vertical: -4, horizontal: -4),
                  contentPadding: EdgeInsets.all(0),
                  minLeadingWidth: 0,
                  title: Text(
                    '15.11.2021',
                    style: Theme.of(context).primaryTextTheme.bodyText1,
                  ),
                  trailing: Text(
                    "1050₽",
                    style: Theme.of(context).primaryTextTheme.bodyText1,
                  ),
                ),
                Divider(
                  color: global.isDarkModeEnable
                      ? Theme.of(context).dividerTheme.color.withOpacity(0.05)
                      : Theme.of(context).dividerTheme.color,
                ),
              ],
            ),
          );
        });
  }

  Widget _rechargeWallet() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(0.0))),
            child: TextFormField(
              style: Theme.of(context).primaryTextTheme.bodyText1,
              decoration: InputDecoration(
                hintText: '${AppLocalizations.of(context).hnt_enter_amount}',
                prefixIcon: Icon(
                  MdiIcons.currencyUsd,
                  color: Theme.of(context).inputDecorationTheme.hintStyle.color,
                ),
                contentPadding: EdgeInsets.only(top: 10),
              ),
            ),
          ),
          Divider(
            color: global.isDarkModeEnable
                ? Theme.of(context).dividerTheme.color.withOpacity(0.05)
                : Theme.of(context).dividerTheme.color,
          ),
          ListTile(
            visualDensity: VisualDensity(horizontal: -4, vertical: -4),
            contentPadding: EdgeInsets.all(0),
            title: Text(
              "${AppLocalizations.of(context).lbl_other_methods}",
              style: Theme.of(context).primaryTextTheme.headline5,
            ),
          ),
          ListTile(
            visualDensity: VisualDensity(horizontal: -4, vertical: -4),
            contentPadding: EdgeInsets.all(0),
            leading: Image.asset('assets/razorpay.png'),
            title: Text(
              "${AppLocalizations.of(context).lbl_razoypay}",
              style: Theme.of(context).primaryTextTheme.headline5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _spentAnalysis() {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: _wallet.length,
        itemBuilder: (context, index) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                      color: global.isDarkModeEnable ? Color(0xFF373C58) : Color(0xFFF2F5F8),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    child: Text(
                      _wallet[index].orderId,
                      style: Theme.of(context).primaryTextTheme.bodyText1,
                    ),
                  ),
                  Expanded(child: SizedBox()),
                  Text(
                    "\$${_wallet[index].amount}",
                    style: Theme.of(context).primaryTextTheme.bodyText1,
                  )
                ],
              ),
              Divider(
                color: global.isDarkModeEnable
                    ? Theme.of(context).dividerTheme.color.withOpacity(0.05)
                    : Theme.of(context).dividerTheme.color,
              ),
            ],
          );
        });
  }
}
