import 'package:flutter/material.dart';
import 'package:save_password/components/Search_From_Json_Network.dart';
import 'package:save_password/constants.dart';
import 'package:save_password/ui/side_menu.dart';
import 'package:save_password/ui/ui_Password.dart';
import 'package:save_password/ui/ui_dash_passw.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  static List<Widget> pages = <Widget>[
    Dashboard(),
    UiPassword(),
    SearchPassword()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: SideMenu(),
        appBar: AppBar(
            backgroundColor: secondaryColor,
            title: Text('LAPIS PASSWORD',
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(color: Colors.lightGreen))),
        body: pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
            selectedItemColor:
                Theme.of(context).textSelectionTheme.selectionColor,
            backgroundColor: secondaryColor,
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            items: <BottomNavigationBarItem>[
              const BottomNavigationBarItem(
                  icon: Icon(Icons.list), label: 'Password'),
              const BottomNavigationBarItem(
                  icon: Icon(Icons.add), label: 'Add Password'),
              const BottomNavigationBarItem(
                  icon: Icon(Icons.search), label: 'To Search')
            ]));
  }
}
