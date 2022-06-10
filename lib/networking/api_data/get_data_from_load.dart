import 'package:grocery_mobile_app/models/offerModel.dart';

class GetDataFromLoad {
  static var _value;

  set setValue(value) {
    _value = value;
  }

  List<String> get getBannersUrlFromApi {
    var myLength = _value.data['result']['data']['events']['items'].length;
    Map _res;
    String myString;
    List<String> listOfBannersUrls = [];
    for (var i = 0; i < myLength; i++) {
      _res = _value.data['result']['data']['events']['items'][i];
      myString = _res['img_url'].toString();
      listOfBannersUrls.add(myString);
    }
    return listOfBannersUrls;
  }

  List<Offer> get getOfferListFromApi {
    var myLength = _value.data['result']['data']['events']['items'].length;
    List<Offer> offerList = [];
    Map _res;
    for (var i = 0; i < myLength; i++) {
      _res = _value.data['result']['data']['events']['items'][i];
      offerList.add(new Offer(
          name: _res['name'].toString(),
          img_url: _res['img_url'].toString(),
          description: _res['description'].toString()));
    }
    return offerList;
  }
}
