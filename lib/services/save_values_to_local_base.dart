import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
var uuid = const Uuid();
final String uuidV1 = uuid.v1();

void removeLocalBaseValues() async {
  final SharedPreferences prefs = await _prefs;

  // prefs.remove('device_token').then((bool success) {
  //   if (kDebugMode) {
  //     print("device_token_removed");
  //   }
  // });

  prefs.remove('accountToken').then((bool success) {
    if (kDebugMode) {
      print("accountToken_removed");
    }
  });
  prefs.remove('phone').then((bool success) {
    if (kDebugMode) {
      print("phone_removed");
    }
  });
  prefs.remove('smsCode').then((bool success) {
    if (kDebugMode) {
      print("smsCode_removed");
    }
  });
  prefs.remove('name').then((bool success) {
    if (kDebugMode) {
      print("name_removed");
    }
  });
  prefs.remove('email').then((bool success) {
    if (kDebugMode) {
      print("email_removed");
    }
  });
  prefs.remove('gender').then((bool success) {
    if (kDebugMode) {
      print("gender_removed");
    }
  });
  prefs.remove('birthday').then((bool success) {
    if (kDebugMode) {
      print("birthday_removed");
    }
  });
}

Future<void> deviceTokenSaveToLocalBase() async {
  final SharedPreferences prefs = await _prefs;

  if (prefs.getString('device_token') == null) {
    await prefs.setString('device_token', uuidV1).then((bool success) {
      if (kDebugMode) {
        print("saveDeviceToken --> $uuidV1");
      }
    });
  }
}

Future<void> savePhoneToLocalBase(String phone) async {
  final SharedPreferences prefs = await _prefs;
  if (prefs.getString('phone') == null) {
    await prefs.setString('phone', '7$phone').then((bool success) {
      if (kDebugMode) {
        print('savePhone --> 7$phone');
      }
    });
  }
}

Future<void> saveSmsCodeToLocalBase(int smsCode) async {
  final SharedPreferences prefs = await _prefs;

  await prefs.setString('smsCode', smsCode.toString()).then((bool success) {
    if (kDebugMode) {
      print("saveSmsCode --> $smsCode");
    }
  });
}

Future<void> saveRegistrationDataToLocalBase(
    String name, String email, String gender, String birthday) async {
  final SharedPreferences prefs = await _prefs;

  await prefs.setString('name', name).then((bool success) {
    if (kDebugMode) {
      print("saveName --> $name");
    }
  });
  await prefs.setString('email', email).then((bool success) {
    if (kDebugMode) {
      print("saveEmail --> $email");
    }
  });
  await prefs.setString('gender', gender).then((bool success) {
    if (kDebugMode) {
      print("saveGender --> $gender");
    }
  });
  await prefs.setString('birthday', birthday).then((bool success) {
    if (kDebugMode) {
      print("saveBirthday --> $birthday");
    }
  });
}
