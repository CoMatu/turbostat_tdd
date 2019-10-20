import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:turbostat_tdd/features/turbostat_tdd/presentation/pages/add_car_page.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/presentation/pages/logo_screen.dart';
import 'package:turbostat_tdd/generated/i18n.dart';

void main() async {
  final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.yellow,
          pageTransitionsTheme: PageTransitionsTheme(builders: {
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          })),
      home: LogoScreen(),
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      title: 'turbostat',
      routes: {
        'logo_screen': (context) => LogoScreen(),
        'add_car': (context) => AddCarPage(),
      },
    );
  }
}
