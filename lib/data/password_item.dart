import 'package:flutter/painting.dart';
import 'package:hive/hive.dart';
part 'password_item.g.dart';

@HiveType(typeId: 0)
class PasswordItem extends HiveObject {
  static String boxName = 'password_items';
  @HiveField(0)
  String id;
  @HiveField(1)
  String name;
  @HiveField(2)
  String username;
  @HiveField(3)
  String password;
  @HiveField(4)
  String importantCode;
  @HiveField(5)
  String desc;
  @HiveField(6)
  DateTime date;

  Color color;
  // ignore: non_constant_identifier_names
  bool Lock;

  PasswordItem({
    this.id,
    this.name,
    this.username,
    this.password,
    this.importantCode,
    this.desc,
    this.color,
    this.date,
    // ignore: non_constant_identifier_names
    this.Lock = false,
  });

  PasswordItem copyWith({
    String id,
    String name,
    String username,
    String password,
    String importantCode,
    String desc,
    DateTime date,
    Color color,
  }) {
    return PasswordItem(
      id: id ?? this.id,
      name: name ?? this.name,
      username: username ?? this.username,
      password: password ?? this.password,
      importantCode: importantCode ?? this.importantCode,
      desc: desc ?? this.importantCode,
      color: color ?? this.color,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'username': username,
      'password': password,
      'importanceCode': importantCode,
      'desc': desc,
      'color': color.value,
      'date': date.millisecondsSinceEpoch,
    };
  }

  factory PasswordItem.fromMap(Map<String, dynamic> map) {
    return PasswordItem(
      id: map['id'],
      name: map['name'],
      username: map['username'],
      password: map['password'],
      importantCode: map['importantCode'],
      desc: map['desc'],
      color: Color(map['color']),
      date: DateTime.fromMillisecondsSinceEpoch(map['date']),
    );
  }

  // String toJson() => json.encode(toMap());

  factory PasswordItem.fromJson(Map<String, dynamic> json) => PasswordItem(
        id: json['id'],
        name: json['name'],
        username: json['username'],
        password: json['password'],
        importantCode: json['importantCode'],
        desc: json['desc'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'username': username,
        'password': password,
        'importanceCode': importantCode,
        'desc': desc,
      };

  @override
  String toString() {
    return 'PasswordItem(id: $id, name: $name, username: $username, password : $password, importantCode : $importantCode, desc: $desc, color: $color, date: $date)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PasswordItem &&
        other.id == id &&
        other.name == name &&
        other.username == username &&
        other.password == password &&
        other.importantCode == importantCode &&
        other.desc == desc &&
        other.color == color &&
        other.date == date;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        username.hashCode ^
        password.hashCode ^
        importantCode.hashCode ^
        desc.hashCode ^
        color.hashCode ^
        date.hashCode;
  }

  void addListener(void Function() handleListUpdates) {}
}
