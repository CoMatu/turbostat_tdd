import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
      return BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Container(
          height: 80,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                BottomBatItem(
                    fontAwesomeIcons: FontAwesomeIcons.home,
                    iconColor: Colors.white,
                    iconSize: 16),
                BottomBatItem(
                    fontAwesomeIcons: FontAwesomeIcons.chartBar,
                    iconColor: Colors.white30,
                    iconSize: 17),
                SizedBox.shrink(),
                BottomBatItem(
                    fontAwesomeIcons: FontAwesomeIcons.car,
                    iconColor: Colors.white30,
                    iconSize: 17),
                BottomBatItem(
                    fontAwesomeIcons: FontAwesomeIcons.cog,
                    iconColor: Colors.white30,
                    iconSize: 17),
              ],
            ),
          ),
        ),
      );
    });
  }
}

class BottomBatItem extends StatelessWidget {
  const BottomBatItem({
    Key key,
    @required this.fontAwesomeIcons,
    @required this.iconColor,
    @required this.iconSize,
  }) : super(key: key);

  final IconData fontAwesomeIcons;
  final iconColor;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 36,
        width: 36,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xFF0E202E),
        ),
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Container(
            height: 30,
            width: 30,
            child: Center(
              child: FaIcon(
                fontAwesomeIcons,
                color: iconColor,
                size: iconSize,
              ),
            ),
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: Theme.of(context).primaryColor),
          ),
        ));
  }
}
/*
BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.view_list),
            title: Text(''),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pie_chart),
            title: Text(S.of(context).stats),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.pie_chart,
              color: Colors.transparent,
            ),
            title: Text(''),
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
      */
