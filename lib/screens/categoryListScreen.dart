import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:grocery_mobile_app/models/businessLayer/baseRoute.dart';
import 'package:grocery_mobile_app/models/productModel.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CategoryListScreen extends BaseRoute {
  CategoryListScreen({a, o}) : super(a: a, o: o, r: 'CategoryListScreen');
  @override
  _CategoryListScreenState createState() => new _CategoryListScreenState();
}

class _CategoryListScreenState extends BaseRouteState {
  List<Product> _allCategoryList = [
    new Product(
        name: "Завтрак “Этажи”",
        amount: "7.01",
        description: "540 руб. 400 г.",
        discount: "20%",
        isFavourite: true,
        unitName: "kg",
        rating: "2",
        ratingCount: "102",
        imagePath: "assets/zavtrak-etazhi.jpg",
        qty: 1),
    new Product(
        name: "Сырный сет",
        amount: "11.0",
        description: "650 руб. 610 г.",
        discount: "20%",
        isFavourite: true,
        unitName: "kg",
        rating: "4.5",
        ratingCount: "12",
        imagePath: "assets/sirniy-set.jpg",
        qty: 0),
    new Product(
        name: "Рябчик свиной",
        amount: "9.25",
        description: "460 руб. 350 г.",
        isFavourite: false,
        unitName: "kg",
        rating: "3",
        ratingCount: "65",
        imagePath: "assets/ryabchik.jpg",
        qty: 2),
    new Product(
        name: "Утиная ножка",
        amount: "0.5",
        description: "599 руб. 320 г.",
        discount: "20%",
        isFavourite: true,
        unitName: "kg",
        rating: "4.5",
        ratingCount: "98",
        imagePath: "assets/utinaya-nozhka.jpg",
        qty: 0),
    new Product(
        name: "Рамен",
        amount: "6.5",
        description: "380 руб. 350 г.",
        isFavourite: false,
        unitName: "kg",
        rating: "4.5",
        ratingCount: "12",
        imagePath: "assets/ramen.jpg",
        qty: 3),
    new Product(
        name: "Сет “Хот”",
        amount: "7.01",
        description: "1250 руб. 1080 г.",
        discount: "20%",
        isFavourite: true,
        unitName: "kg",
        rating: "2",
        ratingCount: "102",
        imagePath: "assets/set-hot.jpg",
        qty: 1),
  ];

  _CategoryListScreenState() : super();

  @override
  Widget build(BuildContext context) {
    print(
        "width  ${MediaQuery.of(context).size.width} - height ${MediaQuery.of(context).size.height}");
    return SafeArea(
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
            title: Text("${AppLocalizations.of(context).tle_all_category}"),
            //  actions: [
            // IconButton(
            //     onPressed: () {
            //       Navigator.of(context).push(
            //         MaterialPageRoute(
            //           builder: (context) => FilterScreen(a: widget.analytics, o: widget.observer),
            //         ),
            //       );
            //     },
            //     icon: global.isDarkModeEnable ? Image.asset('assets/filter_white.png') : Image.asset('assets/filter_black.png')),
            // ],
          ),
          body: _productListWidget()),
    );
  }

  _productListWidget() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10, left: 4, right: 4, top: 10),
        child: Wrap(spacing: 0, runSpacing: 10, children: _productList()),
      ),
    );
  }

  List<Widget> _productList() {
    List<Widget> productList = [];

    for (int i = 0; i < _allCategoryList.length; i++) {
      productList.add(
        Container(
          height: 160,
          margin: EdgeInsets.only(top: 30, left: 4, right: 4),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 130,
                width: (MediaQuery.of(context).size.width / 3) - 11,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardTheme.color,
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 78, left: 7, right: 7),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${_allCategoryList[i].name}',
                          style: Theme.of(context).primaryTextTheme.bodyText1,
                        ),
                        Text(
                          '${_allCategoryList[i].description}',
                          style: Theme.of(context).primaryTextTheme.headline2,
                        ),
                        // Row(
                        //   crossAxisAlignment: CrossAxisAlignment.center,
                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //   children: [
                        //     RichText(
                        //         text: TextSpan(
                        //             text: "${AppLocalizations.of(context).txt_from} \$",
                        //             style: Theme.of(context).primaryTextTheme.headline2,
                        //             children: [
                        //           TextSpan(
                        //             text: '${_allCategoryList[i].amount}',
                        //             style: Theme.of(context).primaryTextTheme.bodyText1,
                        //           ),
                        //         ])),
                        //     InkWell(
                        //         customBorder: RoundedRectangleBorder(
                        //           borderRadius: BorderRadius.circular(30),
                        //         ),
                        //         onTap: () {
                        //           Navigator.of(context).push(
                        //             MaterialPageRoute(
                        //               builder: (context) => ProductListScreen(a: widget.analytics, o: widget.observer),
                        //             ),
                        //           );
                        //         },
                        //         child: Image.asset('assets/orange_next.png')),
                        //   ],
                        // )
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 0,
                top: -30,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('${_allCategoryList[i].imagePath}'),
                    ),
                  ),
                  height: 90,
                  width: 110,
                ),
              )
            ],
          ),
        ),
      );
    }
    return productList;
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
