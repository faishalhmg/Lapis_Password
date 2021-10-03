import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:save_password/data/password_item.dart';

class PasswordApi {
  static Future<List<PasswordItem>> getPassword(String query) async {
    final url = Uri.parse(
        'https://gist.githubusercontent.com/faishalhmg/362f5a2b6384b2afbe73d45e0f886272/raw/02d4250e78665e0f6a60626f5e801ec9526ff420/password.json');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List password = json.decode(response.body);

      return password
          .map((json) => PasswordItem.fromJson(json))
          .where((password) {
        final titleLower = password.name.toLowerCase();
        final authorLower = password.desc.toLowerCase();
        final searchLower = query.toLowerCase();

        return titleLower.contains(searchLower) ||
            authorLower.contains(searchLower);
      }).toList();
    } else {
      throw Exception();
    }
  }
}
