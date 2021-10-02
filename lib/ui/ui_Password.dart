import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ui_empty_Password.dart';
import 'ui_Password_List.dart';
import '../models/models.dart';
import 'ui_item_pw.dart';

class UiPassword extends StatelessWidget {
  const UiPassword({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          final manager = Provider.of<PasswordManager>(context, listen: false);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PasswordItemScreen(
                onCreate: (item) {
                  manager.addItem(item);
                  Navigator.pop(context);
                },
              ),
            ),
          );
        },
      ),
      body: buildPasswordScreen(),
    );
  }

  Widget buildPasswordScreen() {
    return Consumer<PasswordManager>(
      builder: (context, manager, child) {
        if (manager.passwordItems.isNotEmpty) {
          return UiPasswordList(manager: manager);
        } else {
          return const EmptyPassword();
        }
      },
    );
  }
}
