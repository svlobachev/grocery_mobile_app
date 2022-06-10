import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:grocery_mobile_app/models/businessLayer/apiHelper.dart';

class BusinessRule {
  APIHelper dbHelper;

  BusinessRule(APIHelper _dbHelper) {
    dbHelper = _dbHelper;
  }

  openBarcodeScanner() async {
    try {
      String barcodeScanRes;
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666',
        'Cancel',
        true,
        ScanMode.BARCODE,
      );
      print(barcodeScanRes);
    } catch (e) {
      print("Exception - businessRule.dart - openBarcodeScanner():" + e.toString());
    }
  }
}
