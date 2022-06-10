import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:grocery_mobile_app/models/businessLayer/baseRoute.dart';
import 'package:grocery_mobile_app/screens/loginScreen.dart';

class IntroScreen extends BaseRoute {
  IntroScreen({a, o}) : super(a: a, o: o, r: 'IntroScreen');
  @override
  _IntroScreenState createState() => new _IntroScreenState();
}

class _IntroScreenState extends BaseRouteState {
  _IntroScreenState() : super();

  int _currentIndex = 0;
  PageController _pageController;
  @override
  Widget build(BuildContext context) {
    print("widht - ${MediaQuery.of(context).size.width} height ${MediaQuery.of(context).size.height}");
    return WillPopScope(
      onWillPop: () {
        return null;
      },
      child: Scaffold(
          body: Stack(children: [
        Container(
          color: _currentIndex == 0
              ? Color(0xFF5c7fdd)
              : _currentIndex == 1
                  ? Color(0xFF4ADAB7)
                  : Color(0xFF4EC4DE),
          child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                _currentIndex = index;

                setState(() {});
              },
              children: [
                Image.asset(
                  'assets/intro_1.png',
                  fit: BoxFit.fitWidth,
                ),
                Image.asset('assets/intro_2.png', fit: BoxFit.fitWidth),
                Image.asset('assets/intro_3.png', fit: BoxFit.fitWidth),
              ]),
        ),
        Container(
          margin: EdgeInsets.only(top: 25),
          height: 50,
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.only(left: 15, top: 20),
                height: 50,
                width: 50,
              ),
              Container(
                  margin: EdgeInsets.only(right: 15, top: 20),
                  width: 100,
                  child: Stack(
                    children: <Widget>[
                      Container(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            for (int i = 0; i < 3; i++)
                              if (i == _currentIndex) ...[circleBar(true)] else circleBar(false),
                          ],
                        ),
                      ),
                    ],
                  ))
            ],
          ),
        ),
        Positioned(
          right: MediaQuery.of(context).size.width / 3,
          bottom: 15,
          child: Align(
            alignment: Alignment.center,
            child: TextButton(
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.transparent)),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => LogInScreen(a: widget.analytics, o: widget.observer)));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '${AppLocalizations.of(context).btn_get_started}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      letterSpacing: 2.0,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Icon(
                    Icons.arrow_right_rounded,
                    size: 30,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ),
        )
      ])),
    );
  }

  Widget circleBar(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 50),
      margin: EdgeInsets.symmetric(horizontal: 8),
      height: isActive ? 5 : 5,
      width: isActive ? 23 : 10,
      decoration: BoxDecoration(
          color: isActive ? Colors.white : Colors.white38, borderRadius: BorderRadius.all(Radius.circular(12))),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _pageController = new PageController(initialPage: _currentIndex);
  }
}
