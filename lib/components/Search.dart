import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

import 'SearchDelegate.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Search extends StatefulWidget {
  @override
  _Search createState() => _Search();
}

String keyword = "";
String text = "";

class _Search extends State<Search> {
  Box passwordBox;

  SearchWithSuggestionDelegate searchWithSuggestionDelegate =
      SearchWithSuggestionDelegate();

  Future<void> _showSearch() async {
    final searchText = await showSearch<String>(
      context: context,
      delegate: SearchWithSuggestionDelegate(
        onSearchChanged: _getRecentSearchesLike,
      ),
    );
    await _saveToRecentSearches(searchText);
  }

  Future<List<String>> _getRecentSearchesLike(String keywords) async {
    final pref = await SharedPreferences.getInstance();
    final allSearches = pref.getStringList("recentSearches");
    return allSearches.where((search) => search.startsWith(keywords)).toList();
  }

  Future<void> _saveToRecentSearches(String keywords) async {
    if (keywords == null) return;
    final pref = await SharedPreferences.getInstance();

    Set<String> allSearches =
        pref.getStringList("recentSearches")?.toSet() ?? {};
    allSearches = {keywords, ...allSearches};
    pref.setStringList("recentSearches", allSearches.toList());
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: IconButton(
        iconSize: 100,
        icon: Icon(Icons.search),
        onPressed: () {
          _showSearch();
          buildresult(context);
        },
      ),
    );
  }
}

Widget buildresult(BuildContext context) {
  return Scaffold(
    body: SearchWithSuggestionDelegate().buildResults(context),
  );
}
