import 'package:grocery_mobile_app/networking/networking.dart';
import 'package:grocery_mobile_app/screens/homeScreen.dart';
import 'config_service.dart';

class OnRefresh {
  final ConfigService _configService = ConfigService.instance;
  List<String> _imagesList;

  List<String> refreshBanners() {
    Networking.instance.loadConfig().then((value) {
      print(value.result.data);
      _configService.config = value.result.data;
      _imagesList = getDataFromLoad.getBannersUrlFromApi;
      return value;
    }).catchError((error) {
      print(error);
    });
    return _imagesList;
  }
}
