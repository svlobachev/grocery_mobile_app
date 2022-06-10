import 'package:grocery_mobile_app/dto/guest.dart';
import 'package:grocery_mobile_app/dto/page.dart';

String appName = 'Grocery App';
bool isDarkModeEnable = false;
String appVersion = '1.0';
List<String> rtlLanguageCodeLList = [
  'ar',
  'arc',
  'ckb',
  'dv',
  'fa',
  'ha',
  'he',
  'khw',
  'ks',
  'ps',
  'ur',
  'uz_AF',
  'yi'
];
String languageCode;
bool isRTL = false;
String deviceToken;
String appToken;
String accountToken;

List<PageConfig> pageBlocks = [];
List<String> banners = [];

Guest currentUser;
