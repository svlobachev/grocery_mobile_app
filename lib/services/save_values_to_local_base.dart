import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
var uuid = Uuid();
final String uuidv1 = uuid.v1();

void removeLocalBaseValues() async {
  final SharedPreferences prefs = await _prefs;

  // prefs.remove('device_token').then((bool success) {
  //   print("device_token_removed");
  // });
  prefs.remove('accountToken').then((bool success) {
    print("accountToken_removed");
  });
  prefs.remove('phone').then((bool success) {
    print("phone_removed");
  });
}

Future<void> deviceTokenSaveToLocalBase() async {
  final SharedPreferences prefs = await _prefs;

  if (prefs.getString('device_token') == null) {
    await prefs.setString('device_token', uuidv1).then((bool success) {
      print("funcSetDeviceToken --> $uuidv1");
    });
  }
}

Future<void> savePhoneToLocalBase(String phone) async {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final SharedPreferences prefs = await _prefs;

  await prefs.setString('phone', phone).then((bool success) {
    // print("funcSetPhone --> $phone");
  });
}

Future<void> saveSmsCodeToLocalBase(int smsCode) async {
  final SharedPreferences prefs = await _prefs;

  await prefs.setString('smsCode', smsCode.toString()).then((bool success) {
    print("funcSetsmsCode --> $smsCode");
  });
}
