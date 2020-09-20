import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/presentation/pages/new_design/home_page.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/presentation/pages/pages.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/presentation/providers/providers.dart';

class PageViewController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<PageCounter>(
      builder: (context, page, child) {
        return IndexedStack(
          index: page.pageIndex,
          children: <Widget>[
            HomePage(),
            HistoryPage(),
            StatsPage(),
            CarListPage(),
            SettingPage(),
          ],
        );
      },
    );
  }
}
