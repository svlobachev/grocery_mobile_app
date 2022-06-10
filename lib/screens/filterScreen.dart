import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:grocery_mobile_app/models/businessLayer/baseRoute.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:grocery_mobile_app/models/businessLayer/global.dart' as global;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FilterScreen extends BaseRoute {
  FilterScreen({a, o}) : super(a: a, o: o, r: 'FilterScreen');
  @override
  _FilterScreenState createState() => new _FilterScreenState();
}

class _FilterScreenState extends BaseRouteState {
  _FilterScreenState() : super();
  int _selectedName = 0;
  int _selectedRating = 5;
  int _selectedPrice = 7;
  int _selectedDiscount = 10;
  bool _inStock = true;
  bool _inOutOfStock = false;
  bool _isGassured = true;
  bool _includeAll = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("${AppLocalizations.of(context).tle_filter_option}"),
          leading: InkWell(
            customBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Align(
              alignment: Alignment.center, child: Icon(FontAwesomeIcons.windowClose),

            ),
          ),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(MdiIcons.syncIcon)),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 12.0, top: 10),
                    child: Text(
                      '${AppLocalizations.of(context).lbl_sort_by_name}',
                      style: Theme.of(context).primaryTextTheme.bodyText1,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Radio(
                      value: 1,
                      groupValue: _selectedName,
                      onChanged: (val) {
                        _selectedName = val;
                        setState(() {});
                      },
                    ),
                    Text(
                      "${AppLocalizations.of(context).txt_A_Z}",
                      style: _selectedName == 1
                          ? Theme.of(context).primaryTextTheme.headline2.copyWith(
                                fontWeight: FontWeight.w600,
                                fontFamily: 'PoppinsMedium',
                                color: Theme.of(context).primaryTextTheme.bodyText1.color,
                              )
                          : Theme.of(context).primaryTextTheme.headline2,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 16.0),
                      child: Radio(
                          value: 2,
                          groupValue: _selectedName,
                          onChanged: (val) {
                            _selectedName = val;
                            setState(() {});
                          }),
                    ),
                    Text(
                      "${AppLocalizations.of(context).txt_Z_A}",
                      style: _selectedName == 2
                          ? Theme.of(context).primaryTextTheme.headline2.copyWith(
                                fontWeight: FontWeight.w600,
                                fontFamily: 'PoppinsMedium',
                                color: Theme.of(context).primaryTextTheme.bodyText1.color,
                              )
                          : Theme.of(context).primaryTextTheme.headline2,
                    ),
                  ],
                ),
                Divider(),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 12.0, top: 10),
                    child: Text(
                      '${AppLocalizations.of(context).lbl_sort_by_rating}',
                      style: Theme.of(context).primaryTextTheme.bodyText1,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Radio(
                      value: 3,
                      groupValue: _selectedRating,
                      onChanged: (val) {
                        _selectedRating = val;
                        setState(() {});
                      },
                    ),
                    Text(
                      "${AppLocalizations.of(context).txt_1_2_stars}",
                      style: _selectedRating == 3
                          ? Theme.of(context).primaryTextTheme.headline2.copyWith(
                                fontWeight: FontWeight.w600,
                                fontFamily: 'PoppinsMedium',
                                color: Theme.of(context).primaryTextTheme.bodyText1.color,
                              )
                          : Theme.of(context).primaryTextTheme.headline2,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Radio(
                          value: 4,
                          groupValue: _selectedRating,
                          onChanged: (val) {
                            _selectedRating = val;
                            setState(() {});
                          }),
                    ),
                    Text(
                      "${AppLocalizations.of(context).txt_2_3_stars}",
                      style: _selectedRating == 4
                          ? Theme.of(context).primaryTextTheme.headline2.copyWith(
                                fontWeight: FontWeight.w600,
                                fontFamily: 'PoppinsMedium',
                                color: Theme.of(context).primaryTextTheme.bodyText1.color,
                              )
                          : Theme.of(context).primaryTextTheme.headline2,
                    ),
                  
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Radio(
                        value: 5,
                        groupValue: _selectedRating,
                        onChanged: (val) {
                          _selectedRating = val;
                          setState(() {});
                        }),
                    Text(
                      "${AppLocalizations.of(context).txt_3_4_stars}",
                      style: _selectedRating == 5
                          ? Theme.of(context).primaryTextTheme.headline2.copyWith(
                                fontWeight: FontWeight.w600,
                                fontFamily: 'PoppinsMedium',
                                color: Theme.of(context).primaryTextTheme.bodyText1.color,
                              )
                          : Theme.of(context).primaryTextTheme.headline2,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Radio(
                          value: 6,
                          groupValue: _selectedRating,
                          onChanged: (val) {
                            _selectedRating = val;
                            setState(() {});
                          }),
                    ),
                    Text(
                      "${AppLocalizations.of(context).txt_4_5_stars}",
                      style: _selectedRating == 6
                          ? Theme.of(context).primaryTextTheme.headline2.copyWith(
                                fontWeight: FontWeight.w600,
                                fontFamily: 'PoppinsMedium',
                                color: Theme.of(context).primaryTextTheme.bodyText1.color,
                              )
                          : Theme.of(context).primaryTextTheme.headline2,
                    ),
                  ],
                ),
                Divider(),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 12.0),
                    child: Text(
                      '${AppLocalizations.of(context).lbl_sort_by_price}',
                      style: Theme.of(context).primaryTextTheme.bodyText1,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Radio(
                      value: 7,
                      groupValue: _selectedPrice,
                      onChanged: (val) {
                        _selectedPrice = val;
                        setState(() {});
                      },
                    ),
                    Text(
                      "${AppLocalizations.of(context).txt_low_to_high}",
                      style: _selectedPrice == 7
                          ? Theme.of(context).primaryTextTheme.headline2.copyWith(
                                fontWeight: FontWeight.w600,
                                fontFamily: 'PoppinsMedium',
                                color: Theme.of(context).primaryTextTheme.bodyText1.color,
                              )
                          : Theme.of(context).primaryTextTheme.headline2,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Radio(
                          value: 8,
                          groupValue: _selectedPrice,
                          onChanged: (val) {
                            _selectedPrice = val;
                            setState(() {});
                          }),
                    ),
                    Text(
                      "${AppLocalizations.of(context).txt_high_to_low}",
                      style: _selectedPrice == 8
                          ? Theme.of(context).primaryTextTheme.headline2.copyWith(
                                fontWeight: FontWeight.w600,
                                fontFamily: 'PoppinsMedium',
                                color: Theme.of(context).primaryTextTheme.bodyText1.color,
                              )
                          : Theme.of(context).primaryTextTheme.headline2,
                    ),
                  ],
                ),
                Divider(),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 12.0),
                    child: Text(
                      '${AppLocalizations.of(context).lbl_sort_by_discount}',
                      style: Theme.of(context).primaryTextTheme.bodyText1,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Radio(
                      value: 9,
                      groupValue: _selectedDiscount,
                      onChanged: (val) {
                        _selectedDiscount = val;
                        setState(() {});
                      },
                    ),
                    Text(
                      "${AppLocalizations.of(context).lbl_10_25_percent}",
                      style: _selectedDiscount == 9
                          ? Theme.of(context).primaryTextTheme.headline2.copyWith(
                                fontWeight: FontWeight.w600,
                                fontFamily: 'PoppinsMedium',
                                color: Theme.of(context).primaryTextTheme.bodyText1.color,
                              )
                          : Theme.of(context).primaryTextTheme.headline2,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Radio(
                          value: 10,
                          groupValue: _selectedDiscount,
                          onChanged: (val) {
                            _selectedDiscount = val;
                            setState(() {});
                          }),
                    ),
                    Text(
                      "${AppLocalizations.of(context).lbl_25_50_percent}",
                      style: _selectedDiscount == 10
                          ? Theme.of(context).primaryTextTheme.headline2.copyWith(
                                fontWeight: FontWeight.w600,
                                fontFamily: 'PoppinsMedium',
                                color: Theme.of(context).primaryTextTheme.bodyText1.color,
                              )
                          : Theme.of(context).primaryTextTheme.headline2,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Radio(
                      value: 11,
                      groupValue: _selectedDiscount,
                      onChanged: (val) {
                        _selectedDiscount = val;
                        setState(() {});
                      },
                    ),
                    Text(
                      "${AppLocalizations.of(context).lbl_50_75_percent}",
                      style: _selectedDiscount == 11
                          ? Theme.of(context).primaryTextTheme.headline2.copyWith(
                                fontWeight: FontWeight.w600,
                                fontFamily: 'PoppinsMedium',
                                color: Theme.of(context).primaryTextTheme.bodyText1.color,
                              )
                          : Theme.of(context).primaryTextTheme.headline2,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Radio(
                          value: 12,
                          groupValue: _selectedDiscount,
                          onChanged: (val) {
                            _selectedDiscount = val;
                            setState(() {});
                          }),
                    ),
                    Text(
                      "${AppLocalizations.of(context).lbl_above_70_percent}",
                      style: _selectedDiscount == 12
                          ? Theme.of(context).primaryTextTheme.headline2.copyWith(
                                fontWeight: FontWeight.w600,
                                fontFamily: 'PoppinsMedium',
                                color: Theme.of(context).primaryTextTheme.bodyText1.color,
                              )
                          : Theme.of(context).primaryTextTheme.headline2,
                    ),
                  ],
                ),
                Divider(),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 12.0),
                    child: Text(
                      '${AppLocalizations.of(context).lbl_sort_by_availability}',
                      style: Theme.of(context).primaryTextTheme.bodyText1,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Checkbox(
                        value: _inStock,
                        onChanged: (val) {
                          _inStock = val;
                          setState(() {});
                        }),
                    Text(
                      "${AppLocalizations.of(context).txt_in_stock}",
                      style: _inStock
                          ? Theme.of(context).primaryTextTheme.headline2.copyWith(
                                fontWeight: FontWeight.w600,
                                fontFamily: 'PoppinsMedium',
                                color: Theme.of(context).primaryTextTheme.bodyText1.color,
                              )
                          : Theme.of(context).primaryTextTheme.headline2,
                    ),
                    Checkbox(
                        value: _inOutOfStock,
                        onChanged: (val) {
                          _inOutOfStock = val;
                          setState(() {});
                        }),
                    Text(
                      "${AppLocalizations.of(context).txt_out_of_stock}",
                      style: _inOutOfStock
                          ? Theme.of(context).primaryTextTheme.headline2.copyWith(
                                fontWeight: FontWeight.w600,
                                fontFamily: 'PoppinsMedium',
                                color: Theme.of(context).primaryTextTheme.bodyText1.color,
                              )
                          : Theme.of(context).primaryTextTheme.headline2,
                    ),
                  ],
                ),
                Divider(),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 12.0),
                    child: Text(
                      '${AppLocalizations.of(context).lbl_sort_by_gmart}',
                      style: Theme.of(context).primaryTextTheme.bodyText1,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Checkbox(
                        value: _isGassured,
                        onChanged: (val) {
                          _isGassured = val;
                          setState(() {});
                        }),
                    Text(
                      "${AppLocalizations.of(context).txt_g_assured}",
                      style: _isGassured
                          ? Theme.of(context).primaryTextTheme.headline2.copyWith(
                                fontWeight: FontWeight.w600,
                                fontFamily: 'PoppinsMedium',
                                color: Theme.of(context).primaryTextTheme.bodyText1.color,
                              )
                          : Theme.of(context).primaryTextTheme.headline2,
                    ),
                    Checkbox(
                        value: _includeAll,
                        onChanged: (val) {
                          _includeAll = val;
                          setState(() {});
                        }),
                    Text(
                      "${AppLocalizations.of(context).txt_includeall}",
                      style: _includeAll
                          ? Theme.of(context).primaryTextTheme.headline2.copyWith(
                                fontWeight: FontWeight.w600,
                                fontFamily: 'PoppinsMedium',
                                color: Theme.of(context).primaryTextTheme.bodyText1.color,
                              )
                          : Theme.of(context).primaryTextTheme.headline2,
                    ),
                    Divider(),
                    SizedBox(
                      height: 70,
                    ),
                  ],
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
                decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)), gradient: LinearGradient(stops: [0, .90], begin: Alignment.centerLeft, end: Alignment.centerRight, colors: [Theme.of(context).primaryColorLight, Theme.of(context).primaryColor])),
                margin: EdgeInsets.all(15.0),
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('${AppLocalizations.of(context).btn_apply_filter}')),
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
