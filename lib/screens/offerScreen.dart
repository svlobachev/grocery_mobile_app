import 'package:flutter/material.dart';
import 'package:grocery_mobile_app/models/businessLayer/baseRoute.dart';
import 'package:grocery_mobile_app/models/offerModel.dart';
import 'package:grocery_mobile_app/networking/api_data/get_data_from_load.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

GetDataFromLoad getDataFromLoad = GetDataFromLoad();

class OfferListScreen extends BaseRoute {
  OfferListScreen({a, o, this.isFromHomeScreen = false})
      : super(a: a, o: o, r: 'OfferListScreen');
  final bool isFromHomeScreen;

  @override
  _OfferListScreenState createState() =>
      new _OfferListScreenState(isFromHomeScreen: isFromHomeScreen);
}

class _OfferListScreenState extends BaseRouteState {
  bool isFromHomeScreen;
  _OfferListScreenState({this.isFromHomeScreen = false}) : super();
  List<Offer> offerList = getDataFromLoad.getOfferListFromApi;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: isFromHomeScreen
            ? AppBar(
                centerTitle: true,
                title: Text("Акции"),
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
              )
            : null,
        body: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 30),
          child: ListView.builder(
            itemCount: offerList.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Image.asset(
                  Image.network(
                    offerList[index].img_url,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 15, bottom: 8),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        offerList[index].name,
                        textAlign: TextAlign.start,
                        style: Theme.of(context)
                            .primaryTextTheme
                            .bodyText2
                            .copyWith(fontSize: 15),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 36),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        offerList[index].description,
                        textAlign: TextAlign.left,
                        style: Theme.of(context).primaryTextTheme.bodyText1,
                      ),
                    ),
                  ),
                ],
              );
            },
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
}
