import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:save_password/components/search_widget.dart';
import 'package:save_password/data/password_item.dart';
import 'package:save_password/domain/repository.dart';

class SearchPassword extends StatefulWidget {
  @override
  SearchPasswordState createState() => SearchPasswordState();
}

class SearchPasswordState extends State<SearchPassword> {
  List<PasswordItem> passwords = [];
  String query = '';
  Timer debouncer;

  @override
  void initState() {
    super.initState();

    init();
  }

  @override
  void dispose() {
    debouncer?.cancel();
    super.dispose();
  }

  void debounce(
    VoidCallback callback, {
    Duration duration = const Duration(milliseconds: 1000),
  }) {
    if (debouncer != null) {
      debouncer.cancel();
    }

    debouncer = Timer(duration, callback);
  }

  Future init() async {
    final passwords = await PasswordApi.getPassword(query);

    setState(() => this.passwords = passwords);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 60, 0, 0),
              child: Expanded(
                child: ListView.builder(
                  itemCount: passwords.length,
                  itemBuilder: (context, index) {
                    final password = passwords[index];
                    return ListTile(
                      title: Text(password.name),
                      subtitle: Text(password.desc),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Scaffold(
                                  appBar: AppBar(
                                    title: Text(password.name),
                                    leading: IconButton(
                                      onPressed: () =>
                                          Navigator.of(context).pop(),
                                      icon: Icon(Icons.chevron_left),
                                    ),
                                  ),
                                  body: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 270,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 16.0),
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          'ID : ',
                                                          style:
                                                              GoogleFonts.lato(
                                                                  color: Colors
                                                                      .orange,
                                                                  fontSize:
                                                                      21.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                        ),
                                                        Text(
                                                          password.id,
                                                          style:
                                                              GoogleFonts.lato(
                                                                  color: Colors
                                                                      .green,
                                                                  fontSize:
                                                                      21.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                        ),
                                                        const SizedBox(
                                                            height: 4.0),
                                                        Text(
                                                          'Nama : ',
                                                          style:
                                                              GoogleFonts.lato(
                                                                  color: Colors
                                                                      .orange,
                                                                  fontSize:
                                                                      21.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                        ),
                                                        Text(
                                                          password.name,
                                                          style:
                                                              GoogleFonts.lato(
                                                                  color: Colors
                                                                      .green,
                                                                  fontSize:
                                                                      21.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                        ),
                                                        const SizedBox(
                                                            height: 4.0),
                                                        Text(
                                                          'Username : ',
                                                          style:
                                                              GoogleFonts.lato(
                                                                  color: Colors
                                                                      .orange,
                                                                  fontSize:
                                                                      21.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                        ),
                                                        Text(
                                                          password.username,
                                                          style:
                                                              GoogleFonts.lato(
                                                                  color: Colors
                                                                      .green,
                                                                  fontSize:
                                                                      21.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                        ),
                                                        const SizedBox(
                                                            height: 4.0),
                                                        Text(
                                                          'Password : ',
                                                          style:
                                                              GoogleFonts.lato(
                                                                  color: Colors
                                                                      .orange,
                                                                  fontSize:
                                                                      21.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                        ),
                                                        Text(
                                                          password.password,
                                                          style:
                                                              GoogleFonts.lato(
                                                                  color: Colors
                                                                      .green,
                                                                  fontSize:
                                                                      21.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                        ),
                                                        const SizedBox(
                                                            height: 4.0),
                                                        Text(
                                                          'Important Code : ',
                                                          style:
                                                              GoogleFonts.lato(
                                                                  color: Colors
                                                                      .orange,
                                                                  fontSize:
                                                                      21.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                        ),
                                                        Text(
                                                          password
                                                              .importantCode,
                                                          style:
                                                              GoogleFonts.lato(
                                                                  color: Colors
                                                                      .green,
                                                                  fontSize:
                                                                      21.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                        ),
                                                        const SizedBox(
                                                            height: 4.0),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ))),
                        );
                      },
                    );
                    // return buildBook(password);
                  },
                ),
              ),
            ),
            buildSearch(),
          ],
        ),
      );

  Widget buildSearch() => SearchWidget(
        text: query,
        hintText: 'Password or Description',
        onChanged: searchPassword,
      );

  Future searchPassword(String query) async => debounce(() async {
        final passwords = await PasswordApi.getPassword(query);

        if (!mounted) return;

        setState(() {
          this.query = query;
          this.passwords = passwords;
        });
      });

//   Widget buildBook(PasswordItem password) => ListTile(
//         title: Text(password.name),
//         subtitle: Text(password.desc),
//         onTap: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => PasswordItemScreen(
//                 originalItem: password,
//                 onUpdate: (item) {
//                   PasswordManager().updateItem(item, index);
//                   Navigator.pop(context);
//                 },
//               ),
//             ),
//           );
//         },
//       );
}
