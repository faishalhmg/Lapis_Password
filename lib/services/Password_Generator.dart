import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:save_password/data/api_provider.dart';

class PasswordGenerator extends StatefulWidget {
  const PasswordGenerator({Key key}) : super(key: key);

  @override
  _PasswordGeneratorState createState() => _PasswordGeneratorState();
}

class _PasswordGeneratorState extends State<PasswordGenerator> {
  String n = "20";
  String data = "";
  final _controller = TextEditingController();
  final _controller2 = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _controller2.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller.text = "Delay 1 press Button";
    _controller2.text = n;
  }

  void getData() async {
    Response response = await apiProvider.callApi(
      "https://random.justyy.workers.dev/api/random/?cached&n=$n",
      {
        "cached": "",
        "n": n,
      },
    );
    if (response.data != null) {
      var responseJson = jsonDecode(jsonEncode(response.data));
      data = responseJson;
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          actions: [BackButton()],
          automaticallyImplyLeading: false,
          backgroundColor: Colors.green,
          title: Text('Generate Random Password'),
        ),
        body: Container(
          padding: EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Text(
                    "Generate Strong Random Password",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: _controller,
                readOnly: true,
                enableInteractiveSelection: false,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.green,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                    ),
                    suffixIcon: IconButton(
                        onPressed: () {
                          final data = ClipboardData(text: _controller.text);
                          Clipboard.setData(data);

                          final snackbar =
                              SnackBar(content: Text("Password Copy"));

                          ScaffoldMessenger.of(context)
                            ..removeCurrentSnackBar()
                            ..showSnackBar(snackbar);
                        },
                        icon: Icon(Icons.copy))),
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: _controller2,
                enableInteractiveSelection: false,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.green,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              buildButtonWidget()
            ],
          ),
        ),
      );

  Widget buildButtonWidget() {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(primary: Colors.green),
        onPressed: () {
          n = _controller2.text;
          getData();
          _controller.text = data;
        },
        child: Text(
          "Password Generate",
          style: TextStyle(color: Colors.white),
        ));
  }
}
