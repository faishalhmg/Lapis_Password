import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:save_password/data/password_item.dart';

class RecentAdd extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RecentAddState();
  }
}

class RecentAddState extends State<RecentAdd> {
  List<PasswordItem> listPassword = [];
  void getPassword() async {
    setState(() {
      final box = Hive.box(PasswordItem.boxName);

      listPassword = box.values.toList();
    });
  }

  @override
  void initState() {
    getPassword();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
            padding: EdgeInsets.all(15),
            child: ListView.builder(
                itemCount: listPassword.length,
                itemBuilder: (context, position) {
                  PasswordItem getpassword = listPassword[position];
                  var name = getpassword.name;
                  var username = getpassword.username;
                  return Card(
                    elevation: 8,
                    child: Container(
                      height: 80,
                      padding: EdgeInsets.all(15),
                      child: Stack(
                        children: <Widget>[
                          Align(
                              alignment: Alignment.topLeft,
                              child: Text(getpassword.name,
                                  style: TextStyle(fontSize: 18))),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                              margin: EdgeInsets.only(right: 45),
                              // child: IconButton(
                              //     icon: Icon(Icons.edit),
                              //     onPressed: () {
                              //       Navigator.push(
                              //           context,
                              //           MaterialPageRoute(
                              //               builder: (_) =>
                              //                   AddOrEditEmployeeScreen(true,
                              //                       position, getEmployee)));
                              //     }),
                            ),
                          ),
                          // Align(
                          //   alignment: Alignment.centerRight,
                          //   child: IconButton(
                          //       icon: Icon(Icons.delete),
                          //       onPressed: () {
                          //         final box = Hive.box<PasswordItem>('employee');
                          //         box.deleteAt(position);
                          //         setState(
                          //             () => {listEmployees.removeAt(position)});
                          //       }),
                          // ),
                          Align(
                              alignment: Alignment.bottomLeft,
                              child: Text("name: $name | username: $username",
                                  style: TextStyle(fontSize: 18))),
                        ],
                      ),
                    ),
                  );
                })),
      ),
    );
  }
}
