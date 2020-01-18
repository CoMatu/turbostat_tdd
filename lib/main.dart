import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:provider/provider.dart';
import 'package:turbostat_tdd/core/auth/auth_provider.dart';
import 'package:turbostat_tdd/core/auth/base_auth.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/presentation/pages/add_part_page.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/presentation/pages/load_data_page.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/presentation/pages/logo_screen.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/presentation/pages/pages.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/presentation/pages/select_data_source_page.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/presentation/pages/start_page.dart';
import 'package:turbostat_tdd/generated/i18n.dart';
import 'features/turbostat_tdd/presentation/providers/providers.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); //без него ловит ошибку main
  await di.init();
  final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PageCounter()),
        ChangeNotifierProvider(create: (context) => CurrentCar()),
        ChangeNotifierProvider(create: (context) => Maintenances()),
        ChangeNotifierProvider(create: (context) => CurrentMaintenance()),
        ChangeNotifierProvider(create: (context) => Entries()),
        ChangeNotifierProvider(create: (context) => CurrentEntry()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AuthProvider(
      auth: BaseAuthImpl(),
      child: MaterialApp(
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
          'start_page': (context) => StartPage(),
          'load_data_page': (context) => LoadDataPage(),
          'select_page': (context) => SelectDataSourcePage(),
          'add_car': (context) => AddCarPage(),
          'edit_car': (context) => EditCarPage(),
          'add_maintenance': (context) => AddMaintenancePage(),
          'maintenancies_page': (context) => MaintenancesPage(),
          'edit_maintenance': (context) => EditMaintenancePage(),
          'add_entry': (context) => AddEntryPage(),
          'edit_entry': (context) => EditEntryPage(),
          'add_part': (context) => AddPartPage(),
        },
      ),
    );
  }
}

//TODO на дашбод рекламу но начало показа только через 10 запусков чтобы не оттолкнуть
