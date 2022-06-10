import 'package:dio/dio.dart';
import 'package:grocery_mobile_app/dto/config.dart';
import 'package:grocery_mobile_app/dto/account_token.dart';
import 'package:grocery_mobile_app/dto/guest.dart';
import 'package:grocery_mobile_app/networking/api_data/get_data_from_load.dart';
import 'package:grocery_mobile_app/services/save_values_to_local_base.dart';
import 'package:logger/logger.dart';
import 'package:retrofit/retrofit.dart';
import 'package:grocery_mobile_app/models/businessLayer/global.dart' as global;

part 'networking.g.dart';

@RestApi(baseUrl: "https://app.remarked.ru/api/v1/api")
abstract class Api {
  factory Api(Dio dio, {String baseUrl}) = _Api;

  @POST("/")
  Future<HttpResponse> callApi(@Body() Map<String, dynamic> map);
}

class Networking {
  GetDataFromLoad getDataFromLoad = GetDataFromLoad();
  static final instance = Networking._();

  Api _api;

  final logger = Logger();

  Function(String) onError;

  Networking._() {
    var dio = Dio();

    _api = Api(dio);
  }

  Future<MainConfig> loadConfig() {
    return _api.callApi({
      "jsonrpc": "2.0",
      "id": "1",
      "method": "RemarkedLoyaltyApi.getFileRaw",
      "params": {"token": global.appToken, "file": true}
    }).then((value) {
      getDataFromLoad.setValue = value;

      // var pages = (value.data['result']['data']['basic']['pages'] as List);
      // List<PageConfig> pageBlocks = [];
      //
      // for (int i = 0; i < pages.length; i++) {
      //   if ((value.data['result']['data'][pages[i]]) is Map) {
      //     if (value.data['result']['data'][pages[i]]['active'] != null &&
      //         value.data['result']['data'][pages[i]]['active'] == true) {
      //       var dsa =
      //           PageConfig.fromJson(value.data['result']['data'][pages[i]]);
      //       dsa.key = pages[i];
      //
      //       pageBlocks.add(dsa);
      //     }
      //   }
      // }
      // global.pageBlocks = pageBlocks;

      return MainConfig.fromJson(value.data);
    }).catchError((Object obj) {
      // non-200 error goes here.
      switch (obj.runtimeType) {
        case DioError:
          // Here's the sample to get the failed response error code and message
          final res = (obj as DioError).response;
          logger.e("Got error : ${res.statusCode} -> ${res}");
          break;
        default:
          break;
      }
    });
  }

  Future<SmsResponse> sendSmsCode(String phone) async {
    var data = (await _api.callApi({
      "jsonrpc": "2.0",
      "method": "RemarkedLoyaltyApi.GetSmsCode",
      "params": {"token": global.appToken, "phone": '7' + phone},
      "id": 1
    }))
        .data;
    savePhoneToLocalBase('7' + phone);
    return SmsResponse.fromJson(data as Map<String, dynamic>);
  }

  Future<HttpResponse> getAccountToken(String phone, int code) {
    return _api.callApi({
      "jsonrpc": "2.0",
      "id": "1",
      "method": "RemarkedLoyaltyApi.GetAccountToken",
      "params": {
        "token": global.appToken,
        "phone": phone,
        "device_token": global.deviceToken,
        "code": code,
      }
    }).catchError((Object obj) {
      // non-200 error goes here.
      switch (obj.runtimeType) {
        case DioError:
          // Here's the sample to get the failed response error code and message
          final res = (obj as DioError).response;
          logger.e("Got error : ${res.statusCode} -> ${res}");
          break;
        default:
          break;
      }
    });
  }

  Future<SmsResponse> registerAccount(String phone, String name, String email,
      String gender, String birthday, int code) async {
    var data = (await _api.callApi({
      "jsonrpc": "2.0",
      "method": "RemarkedLoyaltyApi.RegisterAccount",
      "params": {
        "phone": phone,
        "name": name,
        "email": email,
        "gender": gender,
        "birthday": birthday,
        "code": code,
        "token": global.appToken,
        "device_token": global.deviceToken,
        "account_token": global.accountToken
      },
      "id": "1"
    }).catchError((Object obj) {
      // non-200 error goes here.
      switch (obj.runtimeType) {
        case DioError:
          // Here's the sample to get the failed response error code and message
          final res = (obj as DioError).response;
          logger.e("Got error : ${res.statusCode} -> ${res}");
          break;
        default:
          break;
      }
    }))
        .data;

    return SmsResponse.fromJson(data as Map<String, dynamic>);
  }

  Future<GuestResponse> getGuestData() async {
    print('getGuestData accountToken - ${global.accountToken}');

    var data = (await _api.callApi({
      "jsonrpc": "2.0",
      "method": "RemarkedLoyaltyApi.GetGuestData",
      "params": {
        "token": global.appToken,
        "account_token": global.accountToken,
      },
      "id": "1"
    }).catchError((Object obj) {
      // non-200 error goes here.
      switch (obj.runtimeType) {
        case DioError:
          // Here's the sample to get the failed response error code and message
          final res = (obj as DioError).response;
          logger.e("Got error : ${res.statusCode} -> ${res}");
          break;
        default:
          break;
      }
    }))
        .data;

    return GuestResponse.fromJson(data as Map<String, dynamic>);
  }
}
