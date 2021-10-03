import 'package:flutter/material.dart';
import '../components/password_tile.dart';
import '../models/models.dart';
import 'ui_item_pw.dart';

class UiPasswordList extends StatelessWidget {
  final PasswordManager manager;

  const UiPasswordList({
    Key key,
    this.manager,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final passwordItem = manager.passwordItems;

    return ListView.separated(
        itemCount: passwordItem.length,
        itemBuilder: (context, index) {
          final item = passwordItem[index];
          return Dismissible(
            key: Key(item.name),
            direction: DismissDirection.endToStart,
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              child: const Icon(
                Icons.delete_forever,
                color: Colors.white,
                size: 50.0,
              ),
            ),
            onDismissed: (direction) {
              manager.deleteItem(index);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('${item.name} dihapus'),
                ),
              );
            },
            child: InkWell(
              child: PasswordTile(
                key: Key(item.name),
                item: item,
                // onComplete: (change) {
                //   manager.completeItem(index, change);
                // },
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PasswordItemScreen(
                      originalItem: item,
                      onUpdate: (item) {
                        manager.updateItem(item, index);
                        Navigator.pop(context);
                      },
                    ),
                  ),
                );
              },
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(height: 16.0);
        });
  }
}
