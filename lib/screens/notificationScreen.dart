import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:grocery_mobile_app/models/businessLayer/baseRoute.dart';
import 'package:grocery_mobile_app/models/businessLayer/global.dart' as global;
import 'package:grocery_mobile_app/models/notificationModel.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class NotificationScreen extends BaseRoute {
  NotificationScreen({a, o}) : super(a: a, o: o, r: 'NotificationScreen');
  @override
  _NotificationScreenState createState() => new _NotificationScreenState();
}

class _NotificationScreenState extends BaseRouteState {
  _NotificationScreenState() : super();
  List<NotificationModel> notificationList = [
    new NotificationModel(
        title: "Дороже всего наша дружба",
        description: "Поэтому дарим тебе 150 бонусов за верность. Приходи, и купи свой любимый капучино",
        datetTime: "10 минут назад",
        imagePath: "assets/etagi.png"),
    new NotificationModel(
        title: "Полезное для кофеманов ☕",
        description: "Проводим прямой эфир с нутрициологом: «Действительно ли вреден кофеин?» Ждем вас в инстаграме!",
        datetTime: "12 минут назад",
        imagePath: "assets/coffee.png"),
    new NotificationModel(
        title: "Ваши баллы скоро сгорят! 🔥",
        description: "Чтобы сохранить баллы, совершите покупку от 100 руб до 5 декабря. Количество: 560 баллов",
        datetTime: "15 минут назад",
        imagePath: "assets/etagi.png"),
    new NotificationModel(
        title: "Дорогой друг-кофеман! Спасибо, что выбираешь нас 😌",
        description: "Мы уже начали готовить твой заказ: капучино и сэндвич с тунцом. Он будет готов через 15 минут.",
        datetTime: "17 минут назад",
        imagePath: "assets/coffee.png"),
    new NotificationModel(
        title: "Заходите! 💃",
        description: "Дарим 100 баллов за верность, а это уже бесплатный кофе. Эти баллы сгорят через 3 дня",
        datetTime: "20 минут назад",
        imagePath: "assets/etagi.png"),
    new NotificationModel(
        title: "Спасибо за установку!",
        description: "Дарим вам 300 приветственных бонусов. Оплачивайте ими 70% покупки",
        datetTime: "30 минут назад",
        imagePath: "assets/g_logo.png"),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
            customBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Align(
              alignment: Alignment.center,
              child: Icon(MdiIcons.arrowLeft),
            ),
          ),
          centerTitle: true,
          title: Text("${AppLocalizations.of(context).tle_notification}"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView.builder(
            itemCount: notificationList.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.all(0),
                    leading: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        image: DecorationImage(
                          image: AssetImage(notificationList[index].imagePath),
                        ),
                      ),
                    ),
                    title: Text(
                      notificationList[index].title,
                      style: Theme.of(context).primaryTextTheme.bodyText1,
                    ),
                    subtitle: RichText(
                      text: TextSpan(
                        text: "${notificationList[index].description}",
                        style: Theme.of(context).primaryTextTheme.overline.copyWith(
                            color: Theme.of(context).primaryTextTheme.overline.color.withOpacity(0.6),
                            letterSpacing: 0.1),
                        children: [
                          TextSpan(
                            text: '\n${notificationList[index].datetTime}',
                            style: Theme.of(context)
                                .primaryTextTheme
                                .button
                                .copyWith(color: Theme.of(context).primaryTextTheme.button.color.withOpacity(0.4)),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    color: global.isDarkModeEnable ? Theme.of(context).dividerTheme.color : Color(0xFFDFE8EF),
                  ),
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

  @override
  void initState() {
    super.initState();
  }
}
