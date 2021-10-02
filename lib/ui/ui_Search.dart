import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:save_password/components/SearchDelegate.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchPassword extends StatefulWidget {
  final String placeholder;
  final TextEditingController controller;
  const SearchPassword({Key key, this.placeholder, this.controller})
      : super(key: key);

  @override
  _SearchPasswordState createState() => _SearchPasswordState();
}

class _SearchPasswordState extends State<SearchPassword> {
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
    return Scaffold(
      body: Builder(
        builder: (context) {
          return Container(
            child: TextFormField(
              controller: widget.controller,
              style: GoogleFonts.lato(fontSize: 20, color: Colors.lightGreen),
              onTap: () {},
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 15,
                ),
                prefixIcon: Padding(
                  padding: EdgeInsets.only(right: 8.0),
                  child: Icon(Icons.search, color: Colors.lightGreen),
                ),
                suffixIcon: InkWell(
                  onTap: () {
                    widget.controller.text = "";
                    SearchWithSuggestionDelegate().buildResults(context);
                  },
                  child: Icon(Icons.circle, color: Colors.lightGreen, size: 20),
                ),
                hintText: widget.placeholder,
                hintStyle: GoogleFonts.lato(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white),
                filled: true,
                enabledBorder: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: Colors.lightGreen),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: Colors.lightGreen),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildsuges(BuildContext context) {
    return Scaffold(body: SearchWithSuggestionDelegate().buildResults(context));
  }
}
