import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/presentation/providers/providers.dart';
import 'package:turbostat_tdd/generated/i18n.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key key}) : super(key: key);

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int selectedIndex;

  @override
  void initState() { 
    super.initState();
  }

  @override
  void didChangeDependencies() {
    selectedIndex = Provider.of<PageCounter>(context, listen: false).pageIndex;
    super.didChangeDependencies();
  }

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
      Provider.of<PageCounter>(context, listen: false).updateIndex(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PageCounter>(builder: (context, page, child) {
      return BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColorLight,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.view_list),
            title: Text(S.of(context).history), // TODO add i18n plugin translate
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pie_chart),
            title: Text(S.of(context).stats),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_car),
            title: Text(S.of(context).cars),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text(S.of(context).settings),
          ),
        ],
        currentIndex: page.pageIndex,
        selectedItemColor: Colors.black,
        onTap: onItemTapped,
      );
    });
  }
}
