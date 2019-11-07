import 'package:flutter/material.dart';
import 'package:turbostat_tdd/core/util/util.dart';

class BottomNavigation extends StatefulWidget {
  BottomNavigation();

  
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int selectedIndex = 0;
  int bottomSelectedIndex = 0;

  PageController pageController;

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
      print('bottom $selectedIndex');
    });
  }

  void bottomTapped(int index) {
    setState(() {
      pageController = PageController();
      bottomSelectedIndex = index;
      pageController.animateToPage(index,
          duration: Duration(milliseconds: 500), curve: Curves.ease);
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
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
