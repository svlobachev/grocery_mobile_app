import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:grocery_mobile_app/dto/config.dart';
import 'package:grocery_mobile_app/dto/restraunt.dart';
import 'package:grocery_mobile_app/models/addressModel.dart';
import 'package:grocery_mobile_app/models/businessLayer/baseRoute.dart';
import 'package:grocery_mobile_app/screens/photo_viewer.dart';
import 'package:grocery_mobile_app/services/config_service.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:webview_flutter/webview_flutter.dart';

class AddressListScreen extends BaseRoute {
  AddressListScreen({a, o}) : super(a: a, o: o, r: 'AddressListScreen');

  @override
  _AddressListScreenState createState() => new _AddressListScreenState();
}

class _AddressListScreenState extends BaseRouteState {
  Config _config = ConfigService.instance.config;

  _AddressListScreenState() : super();

  List<Restaurant> addressList = [];

  // static final CameraPosition _kGooglePlex = CameraPosition(
  //   target: LatLng(37.42796133580664, -122.085749655962),
  //   zoom: 14.4746,
  // );

  @override
  void initState() {
    super.initState();

    addressList = _config.contactsConfig.restaurants;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          // leading: InkWell(
          //   customBorder: RoundedRectangleBorder(
          //     borderRadius: BorderRadius.circular(30),
          //   ),
          //   onTap: () {
          //     Navigator.of(context).pop();
          //   },
          //   child: Align(
          //     alignment: Alignment.center,
          //     child: Icon(MdiIcons.arrowLeft),
          //   ),
          // ),
          centerTitle: true,
          title: Text("${AppLocalizations.of(context).tle_my_address}"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: ListView.builder(
            itemCount: addressList.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    color: Colors.white,
                    height: 150,
                    margin: const EdgeInsets.only(top: 24),
                    width: MediaQuery.of(context).size.width,
                    // child: GoogleMap(
                    //   onMapCreated: (GoogleMapController controller) {},
                    //   initialCameraPosition: _kGooglePlex,
                    // ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: ListTile(
                      contentPadding: EdgeInsets.all(0),
                      title: Text(
                        addressList[index].name,
                        style: Theme.of(context).primaryTextTheme.bodyText1,
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: TextSpan(
                                  text:
                                      "Часы работы: ${addressList[index].openingOurs}\nТелефон: ",
                                  style: Theme.of(context)
                                      .primaryTextTheme
                                      .headline2,
                                  children: [
                                    TextSpan(
                                      text: "${addressList[index].tel}",
                                      style: Theme.of(context)
                                          .primaryTextTheme
                                          .headline2
                                          .copyWith(color: Colors.white),
                                      recognizer: new TapGestureRecognizer()
                                        ..onTap = () async {
                                          final Uri launchUri = Uri(
                                            scheme: 'tel',
                                            path: '${addressList[index].tel}',
                                          );
                                          await launch(launchUri.toString());
                                        },
                                    ),
                                    TextSpan(
                                      text:
                                          "\nАдрес: ${addressList[index].address}\nПочта: ",
                                      style: Theme.of(context)
                                          .primaryTextTheme
                                          .headline2,
                                    ),
                                    TextSpan(
                                      text: "${addressList[index].email}",
                                      style: Theme.of(context)
                                          .primaryTextTheme
                                          .headline2
                                          .copyWith(color: Colors.white),
                                      recognizer: new TapGestureRecognizer()
                                        ..onTap = () async {
                                          String encodeQueryParameters(
                                              Map<String, String> params) {
                                            return params.entries
                                                .map((e) =>
                                                    '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                                                .join('&');
                                          }

                                          final Uri emailLaunchUri = Uri(
                                            scheme: 'mailto',
                                            path: '${addressList[index].email}',
                                            query: encodeQueryParameters(<
                                                String, String>{
                                              'subject':
                                                  'Example Subject & Symbols are allowed!'
                                            }),
                                          );
                                          await launch(
                                              emailLaunchUri.toString());
                                        },
                                    ),
                                  ]),
                              // ,
                            ),
                            SizedBox(height: 10),
                            Text(
                              "${addressList[index].description}",
                              style:
                                  Theme.of(context).primaryTextTheme.headline2,
                            ),
                            SizedBox(height: 10),
                            GridView.count(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              crossAxisCount: 3,
                              mainAxisSpacing: 5,
                              crossAxisSpacing: 5,
                              children: List.generate(
                                  addressList[index].photos.length,
                                  (indexPhoto) {
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            PhotoViewRouteWrapper(
                                          imageProvider: NetworkImage(
                                              addressList[index]
                                                  .photos[indexPhoto]),
                                        ),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    child: Image.network(
                                      addressList[index].photos[indexPhoto],
                                      fit: BoxFit.cover,
                                      loadingBuilder: (_, child, chunk) =>
                                          chunk != null
                                              ? Center(
                                                  child:
                                                      CircularProgressIndicator())
                                              : child,
                                    ),
                                  ),
                                );
                              }),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Divider(),
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
}
