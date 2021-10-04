import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

import '../components/password_tile.dart';
import '../models/models.dart';
import 'ui_item_pw.dart';

class UiPasswordList extends StatefulWidget {
  final PasswordManager manager;

  const UiPasswordList({
    Key key,
    this.manager,
  }) : super(key: key);

  @override
  _UiPasswordListState createState() => _UiPasswordListState();
}

class _UiPasswordListState extends State<UiPasswordList> {
  void getPassword() async {
    setState(() {
      final box = Hive.box(PasswordItem.boxName);

      box.values.toList();
    });
  }

  @override
  void initState() {
    getPassword();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var box = Hive.box(PasswordItem.boxName);

    return ListView.separated(
        itemCount: box.length,
        itemBuilder: (context, index) {
          final item = box.values.toList()[index];

          return Dismissible(
            key: Key(item.name),
            direction: DismissDirection.endToStart,
            background: Container(
              color: Colors.greenAccent,
              alignment: Alignment.centerRight,
              child: const Icon(
                Icons.delete_forever,
                color: Colors.white,
                size: 50.0,
              ),
            ),
            onDismissed: (direction) async {
              widget.manager.deleteItem(index);
              box.deleteAt(index);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('${item.name} dihapus'),
                ),
              );
            },
            confirmDismiss: (DismissDirection direction) async {
              return await showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text("Delete Confirmation"),
                    content: const Text(
                        "Are you sure you want to delete this item?"),
                    actions: <Widget>[
                      FlatButton(
                          onPressed: () => Navigator.of(context).pop(true),
                          child: const Text("Delete")),
                      FlatButton(
                        onPressed: () => Navigator.of(context).pop(false),
                        child: const Text("Cancel"),
                      ),
                    ],
                  );
                },
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
                        // manager.updateItem(item, index);
                        box.putAt(index, item);
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
