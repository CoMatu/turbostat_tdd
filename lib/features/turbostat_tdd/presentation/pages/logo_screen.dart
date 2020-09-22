import 'dart:async';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/presentation/widgets/new_design/custom_icon_widget.dart';
import 'package:turbostat_tdd/injection_container.dart';

class LogoScreen extends StatefulWidget {
  @override
  LogoScreenState createState() {
    return LogoScreenState();
  }
}

class LogoScreenState extends State<LogoScreen>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController animationController;
  Map<PermissionGroup, PermissionStatus> permissions;
  SharedPreferences prefs;
  String dataSource;
  final textStyle = TextStyle(fontWeight: FontWeight.bold, fontSize: 14);
  final textStyleDescription = TextStyle(color: Colors.grey, fontSize: 12);
  final double logoSize = 130.0;

  void getPermission() async {
    permissions = await PermissionHandler().requestPermissions([
//      PermissionGroup.camera,
      PermissionGroup.storage,
    ]);
  }

  void getSharedPreferences() {
    dataSource = sl<SharedPreferences>().getString('data_source');
    //sl<SharedPreferences>().clear(); // для тестирования разных режимов входа
  }

  startTime() async {
    var _duration = Duration(seconds: 2);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() {
    switch (dataSource) {
      case 'device':
        Navigator.of(context).pushReplacementNamed('load_data_page');
//        Navigator.of(context).pushReplacementNamed('home_page');
        break;
      case 'cloud':
        Navigator.of(context).pushReplacementNamed('start_page');
        break;
      default:
        Navigator.of(context).pushReplacementNamed('select_page');
    }
  }

  @override
  void initState() {
    super.initState();
//    startTime();
    animationController = AnimationController(
        duration: Duration(milliseconds: 1500), vsync: this);
    animation = Tween(begin: 0.0, end: logoSize).animate(animationController)
      ..addListener(() => this.setState(() {}))
      ..addStatusListener((AnimationStatus status) {
        if (status == AnimationStatus.completed) {
          if (dataSource == null) {
            modalBottomSheet(context);
          } else
            navigationPage();
        }
      });
    animationController.forward();

    getPermission();

    getSharedPreferences();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var logo = AssetImage('assets/images/start_logo.png');
    return Scaffold(
        body: Center(
      child: Container(
        height: animation.value,
        width: animation.value,
        child: Image(image: logo),
      ),
    ));
  }

  modalBottomSheet(context) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        )),
        isDismissible: false,
        context: context,
        builder: (BuildContext ctx) {
          return Padding(
            padding: const EdgeInsets.only(
                left: 20.0, right: 20, bottom: 20, top: 26),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Выберите вариант размещения Ваших даных:',
                  style: textStyle,
                ),
                SizedBox(height: 20),
                selectDeviceItem(),
                Padding(padding: const EdgeInsets.all(12)),
                selectCloudStorageItem(),
              ],
            ),
          );
        });
  }

  Widget selectCloudStorageItem() {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CustomIconWidget(
            fontAwesomeIcons: FontAwesomeIcons.cloud,
            borderColor: Color(0xFF2D9CDB),
            centerColor: Color(0xFF2D9CDB),
            iconColor: Color(0xFF2D9CDB),
            iconSize: 14,
          ),
          SizedBox(
            width: 16,
          ),
          itemTitleSubtitle(
            'Облачное хранилище',
            'Ваши данные будут храниться в облачном хранилище Google. Можно использовать на разных устройствах. Нужна регистрация или вход с помощью аккаунта Google.',
          ),
        ],
      ),
    );
  }

  Widget selectDeviceItem() {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: GestureDetector(
        onTap: _selectDevice,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CustomIconWidget(
              fontAwesomeIcons: FontAwesomeIcons.mobileAlt,
              iconColor: Color(0xFF27AE60),
              centerColor: Color(0xFF10AA78),
              borderColor: Color(0xFF6FCF97),
              iconSize: 19,
            ),
            SizedBox(
              width: 16,
            ),
            itemTitleSubtitle(
              'Ваше устройство',
              'Ваши данные будут храниться в памяти телефона. Доступно на одном устройстве. Регистрация не нужна.',
            )
          ],
        ),
      ),
    );
  }

  Widget itemTitleSubtitle(String title, String subtitle) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 36,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(title, style: textStyle),
            ),
          ),
          Text(subtitle, style: textStyleDescription),
        ],
      ),
    );
  }

  void _selectDevice() {
    sl<SharedPreferences>().setString('data_source', 'device');
    Navigator.of(context).pushReplacementNamed('load_data_page');
  }
}
