import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

import 'package:provider/provider.dart';
import 'package:save_password/data/password_item.dart';
import 'package:save_password/models/password_manager.dart';
import 'Search.dart';

typedef OnSearchChanged = Future<List<String>> Function(String);

class SearchWithSuggestionDelegate extends SearchDelegate<String> {
  List<PasswordItem> passwordModels = [];
  final OnSearchChanged onSearchChanged;
  String keyword = "chicken";

  bool isLoading = false;
  TextEditingController textEditingController = TextEditingController();

  List<String> _Keywords = const [];

  SearchWithSuggestionDelegate({String searchFieldLabel, this.onSearchChanged})
      : super(searchFieldLabel: searchFieldLabel);

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => Navigator.pop(context),
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () => query = "",
      ),
    ];
  }

  @override
  void showResults(BuildContext context) {
    close(context, query);
  }

  @override
  Widget buildResults(BuildContext context) {
    Box passwordBox;

    return Scaffold(
        backgroundColor: Colors.black,
        body: Builder(builder: (context) {
          if (isLoading) {
            return Center(
              child: Text('Mohon Tunggu...'),
            );
          } else if (passwordModels.isEmpty) {
            return Center(child: Text('Pencarian tidak ditemukan'));
          }
          PasswordManager passwordProvider =
              Provider.of<PasswordManager>(context, listen: false);

          return ValueListenableBuilder(
              valueListenable: passwordBox.listenable(),
              builder: (context, passwordBox, _) {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: passwordBox.length,
                  itemBuilder: (context, index) {
                    final password = passwordBox.getAt(index) as PasswordItem;
                    // with get we can get data from HiveDb, and pass index as 'key'
                    return ListTile(
                      onTap: () {
                        // passwordProvider.updateSelectedIndex(index);
                        // Navigator.of(context).push(
                        //   MaterialPageRoute(
                        //     builder: (context) => ContactDetailsScreen(),
                        // ),
                        // );
                      },
                      onLongPress: () {
                        ///* this will delete that contact from hive
                        //  passwordProvider.updateSelectedIndex(index);
                        // passwordProvider.deleteFromHive();
                      },
                      title: Text(password.name,
                          style: Theme.of(context).textTheme.bodyText1),
                      subtitle: Text(password.desc,
                          style: Theme.of(context).textTheme.subtitle1),
                    );
                  },
                );
              });
        }));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder<List<String>>(
      future: onSearchChanged != null ? onSearchChanged(query) : null,
      builder: (context, snapshot) {
        if (snapshot.hasData) _Keywords = snapshot.data;
        return ListView.builder(
          itemCount: _Keywords.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Icon(Icons.restore),
              title: Text("${_Keywords[index]}"),
              onTap: () => query = _Keywords[index],
              tileColor: Color(0xDD004D40),
              onLongPress: () => _Keywords.removeAt(index),
            );
          },
        );
      },
    );
  }
}
