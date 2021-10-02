import 'package:flutter/material.dart';
import 'package:save_password/data/password_item.dart';

class PasswordDetailsPage extends StatelessWidget {
  final PasswordItem passwordItem;

  PasswordDetailsPage({this.passwordItem});

  String passwordTitle() {
    String title = "";
    return title;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            '${passwordTitle()} ${passwordItem.name} ${passwordItem.username} ${passwordItem.password}  ${passwordItem.importantCode} ${passwordItem.desc} ${passwordItem.color} ${passwordItem.date}'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 16.0,
            ),
            Center(
              child: Hero(
                tag: passwordItem.id,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(null),
                  radius: 100.0,
                ),
              ),
            ),
            SizedBox(
              height: 22.0,
            ),
            Text(
              '${passwordTitle()} ${passwordItem.name} ${passwordItem.username} ${passwordItem.password}  ${passwordItem.importantCode} ${passwordItem.desc} ${passwordItem.color} ${passwordItem.date}',
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.left,
            ),
            SizedBox(
              height: 12.0,
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 12.0, right: 12.0, bottom: 20.0),
                  child: Text(
                    passwordItem.password,
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
