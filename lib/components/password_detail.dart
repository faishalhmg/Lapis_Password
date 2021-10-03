import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:save_password/data/password_item.dart';
import 'package:save_password/models/password_manager.dart';

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
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const SizedBox(width: 16.0),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                selectedPassword.id,
                                style: GoogleFonts.lato(
                                    color: Colors.green,
                                    fontSize: 21.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 4.0),
                              Text(
                                selectedPassword.name,
                                style: GoogleFonts.lato(
                                    color: Colors.green,
                                    fontSize: 21.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 4.0),
                              Text(
                                selectedPassword.username,
                                style: GoogleFonts.lato(
                                    color: Colors.green,
                                    fontSize: 21.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 4.0),
                              Text(
                                selectedPassword.password,
                                style: GoogleFonts.lato(
                                    color: Colors.green,
                                    fontSize: 21.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 4.0),
                              Text(
                                selectedPassword.importantCode,
                                style: GoogleFonts.lato(
                                    color: Colors.green,
                                    fontSize: 21.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 4.0),
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
        ));
  }
}
