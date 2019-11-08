import 'package:flutter/material.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/presentation/pages/load_data_page.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/presentation/pages/pages.dart';

class PageViewController extends StatefulWidget {
  const PageViewController({
    Key key,
  }) : super(key: key);

  @override
  _PageViewControllerState createState() => _PageViewControllerState();
}

class _PageViewControllerState extends State<PageViewController> {
  void Function(int) onItemTapped;

  int bottomSelectedIndex = 0;

  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  void bottomTapped(int index) {
    setState(() {
      pageController = PageController();
      bottomSelectedIndex = index;
      pageController.animateToPage(index,
          duration: Duration(milliseconds: 500), curve: Curves.ease);
    });
  }

  void pageChanged(int index) {
    setState(() {
      LoadDataPage.pageCounter.updateIndex(index);
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      onPageChanged: (index) {
        pageChanged(index);
      },
      children: <Widget>[
        HistoryPage(),
        StatsPage(),
        CarListPage(),
        SettingPage(),
      ],
    );
  }
}
