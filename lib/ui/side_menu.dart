import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:save_password/models/DarkThemeProvider.dart';
import 'package:save_password/models/user.dart';

class SideMenu extends StatelessWidget {
  final User user;
  const SideMenu({
    Key key,
    this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);

    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
              child: IconButton(
            onPressed: () {},
            icon: Icon(Icons.lock),
          )),
          DrawerListTile(
            title: "Dashboard",
            press: () {},
          ),
          DrawerListTile(
            title: "Tambah Data Password",
            press: () {},
          ),
          DrawerListTile(
            title: "History",
            press: () {},
          ),
          DrawerListTile(
            title: "APP Description",
            press: () {},
          ),
          Checkbox(
              value: themeChange.darkTheme,
              onChanged: (bool value) {
                themeChange.darkTheme = value;
              })
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key key,
    // For selecting those three line once press "Command+D"
    this.title,
    this.svgSrc,
    this.press,
  }) : super(key: key);

  final String title, svgSrc;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      title: Text(
        title,
      ),
    );
  }
}
