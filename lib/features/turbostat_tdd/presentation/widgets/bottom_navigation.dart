import 'package:flutter/material.dart';
import 'package:turbostat_tdd/core/util/util.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/presentation/pages/load_data_page.dart';

class BottomNavigation extends StatefulWidget {
  final int selectedIndex;

  const BottomNavigation({Key key, this.selectedIndex}) : super(key: key);
  
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int selectedIndex = 0;
  int bottomSelectedIndex = 0;

  @override
  void initState() {
    
    super.initState();
  }

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
      LoadDataPage.pageCounter.updateIndex(index);
      print('bottom $selectedIndex');
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Theme.of(context).primaryColorLight,
      type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.view_list),
          title: Text('History'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.pie_chart),
          title: Text('Stats'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.directions_car),
          title: Text('Cars'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          title: Text('Setting'),
        ),
      ],
      currentIndex: selectedIndex,
      selectedItemColor: Colors.black,
      onTap: onItemTapped,
    );
  }
}
