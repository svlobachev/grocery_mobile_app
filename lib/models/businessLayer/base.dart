import 'dart:async';
import 'dart:core';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:grocery_mobile_app/models/businessLayer/apiHelper.dart';
import 'package:grocery_mobile_app/models/businessLayer/businessRule.dart';
import 'package:grocery_mobile_app/models/businessLayer/global.dart' as global;

class Base extends StatefulWidget {
  final dynamic analytics;
  final dynamic observer;
  final String routeName;

  Base({this.analytics, this.observer, this.routeName});

  @override
  BaseState createState() => BaseState();
}

class BaseState extends State<Base> with TickerProviderStateMixin, WidgetsBindingObserver {
  bool bannerAdLoaded = false;

  APIHelper apiHelper;
  BusinessRule br;

  BaseState() {
    apiHelper = new APIHelper();
    br = new BusinessRule(apiHelper);
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  void showSnackBar({String snackBarMessage, Key key}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      key: key,
      content: Text(
        snackBarMessage,
        textAlign: TextAlign.center,
      ),
      duration: Duration(seconds: 2),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return null;
  }

  void closeDialog() {
    Navigator.of(context).pop();
  }

  Future exitAppDialog() async {
    try {
      showCupertinoDialog(
          context: context,
          builder: (BuildContext context) {
            return Theme(
              data: ThemeData(dialogBackgroundColor: Colors.white),
              child: CupertinoAlertDialog(
                title: Text(
                  "Exit app",
                  style: TextStyle(
                    fontFamily: 'AvenirLTStd',
                  ),
                ),
                content: Text("Are you sure you want to exit app?",
                    style: TextStyle(
                      fontFamily: 'AvenirLTStd',
                    )),
                actions: <Widget>[
                  CupertinoDialogAction(
                    child: Text(
                      'Cancel',
                      style: TextStyle(color: Colors.red),
                    ),
                    onPressed: () {
                      // Dismiss the dialog but don't
                      // dismiss the swiped item
                      return Navigator.of(context).pop(false);
                    },
                  ),
                  CupertinoDialogAction(
                    child: Text("Exit"),
                    onPressed: () async {
                      exit(0);
                    },
                  ),
                ],
              ),
            );
          });
    } catch (e) {
      print('Exception - base.dart - exitAppDialog(): ' + e.toString());
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    super.didChangeAppLifecycleState(state);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<bool> dontCloseDialog() async {
    return false;
  }

  void hideLoader() {
    Navigator.pop(context);
  }

  @override
  void initState() {
    super.initState();
  }

  Future darkModeCheck() async {
    try {
      var brightness = SchedulerBinding.instance.window.platformBrightness;
      print("Hello    ");
      bool isDarkMode = brightness == Brightness.dark;
      if (global.isDarkModeEnable != isDarkMode) {
        global.isDarkModeEnable = isDarkMode;
        Phoenix.rebirth(context);
      }
    } catch (e) {
      print('Exception - base.dart - darkModeCheck(): ' + e.toString());
    }
  }

  showOnlyLoaderDialog() {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          elevation: 0,
          backgroundColor: Colors.transparent,
          child: Center(child: new CircularProgressIndicator()),
        );
      },
    );
  }

  // ratingBuilderWidget(){
  //   return
  // }

}
