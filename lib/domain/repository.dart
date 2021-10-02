import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:save_password/data/password_item.dart';

final String url =
    "https://run.mocky.io/v3/abd3b670-5afc-4f2c-b28a-089a1e894969";

List<PasswordItem> parseUser(String responseBody) {
  var list = json.decode(responseBody) as List<dynamic>;
  var passwords = list.map((e) => PasswordItem.fromJson(e)).toList();
  return passwords;
}

Future<List<PasswordItem>> fetchUsers() async {
  final http.Response response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    return compute(parseUser, response.body);
  } else {
    throw Exception(response.statusCode);
  }
}
