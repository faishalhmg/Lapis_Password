import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:save_password/data/password_item.dart';
import 'package:save_password/models/models.dart';

class PasswordDetailsScreen extends StatefulWidget {
  @override
  _PasswordDetailsScreenState createState() => _PasswordDetailsScreenState();
}

class _PasswordDetailsScreenState extends State<PasswordDetailsScreen> {
  PasswordItem selectedPassword;
  PasswordManager passwordManager;

  @override
  Widget build(BuildContext context) {
    passwordManager = Provider.of<PasswordManager>(context);
    selectedPassword = passwordManager.SelectedPassword;
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedPassword.name),
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(Icons.chevron_left),
        ),
      ),
      body: Center(
        child: Container(
          child: ListTile(
            onTap: () {
              print('tapped');
            },
            title: Text(selectedPassword.name,
                style: Theme.of(context).textTheme.bodyText1),
            subtitle: Text(selectedPassword.desc,
                style: Theme.of(context).textTheme.subtitle1),
          ),
        ),
      ),
    );
  }
}
