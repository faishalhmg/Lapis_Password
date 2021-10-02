import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart';
import '../data/password_item.dart';

class PasswordManager extends ChangeNotifier {
  var box = Hive.box(PasswordItem.boxName);
  final _passwordItems = <PasswordItem>[];
  List<PasswordItem> passwordList = [];
  bool _createNewItem = false;
  PasswordItem _selectedPassword = PasswordItem();
  List<PasswordItem> get passwordItems => List.unmodifiable(_passwordItems);

  PasswordItem get SelectedPassword => _selectedPassword;

  bool get isCreatingNewItem => _createNewItem;

  void createNewItem() {
    _createNewItem = true;
    notifyListeners();
  }

  void deleteItem(int index) {
    box.deleteAt(index);
    _passwordItems.removeAt(index);
    notifyListeners();
  }

  void passwordItemTapped(int index) {
    _createNewItem = false;
    notifyListeners();
  }

  void addItem(PasswordItem item) {
    box.add(item);
    _passwordItems.add(item);
    _createNewItem = false;
    notifyListeners();
  }

  void updateItem(PasswordItem item, int index) {
    box.putAt(index, item);
    _passwordItems[index] = item;
    _createNewItem = false;
    notifyListeners();
  }

  List _passwordList = <PasswordItem>[];
  List get password => _passwordList;

  void getPassword() async {
    passwordList = await box.values.toList();
    notifyListeners();
  }

  List<PasswordItem> getPasswordList() {
    getPassword();
    notifyListeners();
    return passwordList;
  }
}
//   void LockItem(int index, bool change) {
//     final item = _passwordItems[index];
//     _passwordItems[index] = item.copyWith(isLock: change);
//     notifyListeners();
//   }
// }
