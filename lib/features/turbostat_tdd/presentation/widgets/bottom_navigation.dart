import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/presentation/providers/providers.dart';

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
    selectedIndex = Provider.of<PageCounter>(context).pageIndex;
    super.didChangeDependencies();
  }

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
      Provider.of<PageCounter>(context).updateIndex(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PageCounter>(builder: (context, page, child) {
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
    });
  }
}
