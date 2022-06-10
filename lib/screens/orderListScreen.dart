import 'package:flutter/material.dart';
import 'package:grocery_mobile_app/models/businessLayer/baseRoute.dart';
import 'package:grocery_mobile_app/models/orderModel.dart';
import 'package:grocery_mobile_app/screens/orderDetailScreen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:grocery_mobile_app/models/businessLayer/global.dart' as global;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OrderListScreen extends BaseRoute {
  OrderListScreen({a, o}) : super(a: a, o: o, r: 'OrderListScreen');
  @override
  _OrderListScreenState createState() => new _OrderListScreenState();
}

class _OrderListScreenState extends BaseRouteState {
  _OrderListScreenState() : super();
  List<Order> _orderListScreen = [
    new Order(name: "Fresh Mutton", amount: "15.08", datetime: "12:03 PM | 24.02.2021", orderId: "#51602", orderOption: "Re - order", orderStatus: "Delivered"),
    new Order(name: "Fresh Chicken", amount: "11.08", datetime: "10:57 AM | 25.02.2021", orderId: "#202145", orderOption: "Cancel", orderStatus: "Scheduled"),
    new Order(name: "Fresh Lamb", amount: "12.08", datetime: "12:03 PM | 24.02.2021", orderId: "#202145", orderOption: "Track Order", orderStatus: "Ongoing"),
    new Order(name: "Fresh Mutton", amount: "15.08", datetime: "11:36 AM | 27.02.2021", orderId: "#412563", orderOption: "Re - order", orderStatus: "Cancelled"),
    new Order(name: "Fresh Chicken", amount: "11.08", datetime: "12:03 PM | 26.02.2021", orderId: "#202145", orderOption: "Cancel", orderStatus: "Scheduled"),
    new Order(name: "Fresh Lamb", amount: "12.08", datetime: "12:03 PM | 28.02.2021", orderId: "#412563", orderOption: "Re - order", orderStatus: "Ongoing"),
    new Order(name: "Fresh Mutton", amount: "15.08", datetime: "12:03 PM | 24.02.2021", orderId: "#51602", orderOption: "Re - order", orderStatus: "Delivered"),
    new Order(name: "Fresh Chicken", amount: "11.08", datetime: "10:57 AM | 25.02.2021", orderId: "#202145", orderOption: "Cancel", orderStatus: "Scheduled"),
    new Order(name: "Fresh Lamb", amount: "12.08", datetime: "12:03 PM | 24.02.2021", orderId: "#202145", orderOption: "Track Order", orderStatus: "Ongoing"),
    new Order(name: "Fresh Mutton", amount: "15.08", datetime: "11:36 AM | 27.02.2021", orderId: "#412563", orderOption: "Re - order", orderStatus: "Cancelled"),
    new Order(name: "Fresh Chicken", amount: "11.08", datetime: "12:03 PM | 26.02.2021", orderId: "#202145", orderOption: "Cancel", orderStatus: "Scheduled"),
    new Order(name: "Fresh Lamb", amount: "12.08", datetime: "12:03 PM | 28.02.2021", orderId: "#412563", orderOption: "Re - order", orderStatus: "Ongoing"),
  ];
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
            title: Text("${AppLocalizations.of(context).tle_my_order}"),
          ),
          body: Column(
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                    height: 50,
                    child: AppBar(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                      backgroundColor: global.isDarkModeEnable ? Color(0xFF435276) : Color(0xFFEDF2F6),
                      bottom: TabBar(
                        indicator: UnderlineTabIndicator(
                          borderSide: BorderSide(
                            width: 3.0,
                            color: global.isDarkModeEnable ? Theme.of(context).primaryColor : Color(0xFFEF5656),
                          ),
                          insets: EdgeInsets.symmetric(horizontal: 8.0),
                        ),
                        labelColor: global.isDarkModeEnable ? Colors.white : Colors.black,
                        indicatorWeight: 4,
                        unselectedLabelStyle: TextStyle(fontSize: 13, color: global.isDarkModeEnable ? Colors.white : Colors.black, fontWeight: FontWeight.w400),
                        labelStyle: TextStyle(fontSize: 13, color: global.isDarkModeEnable ? Colors.white : Colors.black, fontWeight: FontWeight.bold),
                        indicatorSize: TabBarIndicatorSize.label,
                        indicatorColor: global.isDarkModeEnable ? Theme.of(context).primaryColor : Color(0xFFEF5656),
                        tabs: [
                          Tab(
                              child: Text(
                            '${AppLocalizations.of(context).lbl_all_orders}',
                          )),
                          Tab(
                              child: Text(
                            '${AppLocalizations.of(context).lbl_scheduled}',
                          )),
                          Tab(
                              child: Text(
                            '${AppLocalizations.of(context).lbl_previous}',
                          )),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    _allOrders(),
                    _allOrders(),
                    _allOrders(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _allOrders() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: _orderListScreen.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => OrderDetailScreen(a: widget.analytics, o: widget.observer),
                  ),
                );
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 0.0),
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
                            _orderListScreen[index].orderId,
                            style: Theme.of(context).primaryTextTheme.headline2,
                          ),
                        ),
                        Expanded(child: SizedBox()),
                        Icon(
                          _orderListScreen[index].orderStatus == 'Cancelled' ? MdiIcons.closeOctagon : MdiIcons.checkDecagram,
                          size: 20,
                          color: _orderListScreen[index].orderStatus == 'Cancelled'
                              ? Colors.red
                              : _orderListScreen[index].orderStatus == 'Delivered'
                                  ? Colors.greenAccent
                                  : _orderListScreen[index].orderStatus == 'Ongoing'
                                      ? Colors.blue
                                      : Theme.of(context).primaryColorLight,
                        ),
                        Padding(
                          padding: global.isRTL ? EdgeInsets.only(right: 8) : EdgeInsets.only(left: 8.0),
                          child: Text(
                            _orderListScreen[index].orderStatus,
                            style: Theme.of(context).primaryTextTheme.headline2,
                          ),
                        )
                      ],
                    ),
                  ),
                  ListTile(
                    visualDensity: VisualDensity(vertical: -3, horizontal: -4),
                    contentPadding: EdgeInsets.all(0),
                    minLeadingWidth: 0,
                    title: Text(
                      _orderListScreen[index].name,
                      style: Theme.of(context).primaryTextTheme.bodyText1,
                    ),
                    subtitle: Text(
                      _orderListScreen[index].datetime,
                      style: Theme.of(context).primaryTextTheme.headline2,
                    ),
                    trailing: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "\$${_orderListScreen[index].amount}",
                          style: Theme.of(context).primaryTextTheme.bodyText1,
                        ),
                        Text(
                          "${_orderListScreen[index].orderOption}",
                          style: Theme.of(context).primaryTextTheme.headline2.copyWith(color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: global.isDarkModeEnable ? Theme.of(context).dividerTheme.color.withOpacity(0.05) : Theme.of(context).dividerTheme.color,
                  ),
                ],
              ),
            );
          }),
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
