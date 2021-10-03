class PasswordModel {
  final n;
  final cached;
  final data;
  PasswordModel({this.n, this.cached, this.data});

  // String toJson() => json.encode(toMap());

  factory PasswordModel.fromJson(Map<String, dynamic> json) =>
      PasswordModel(n: json['n'], cached: json['cached'], data: json['data']);

  Map<String, dynamic> toJson() => {'n': n, 'cached': 'cached', 'data': 'data'};

  @override
  String toString() {
    return 'PasswordItem(n: $n, cached: $cached, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PasswordModel &&
        other.n == n &&
        other.cached == cached &&
        other.data == data;
  }

  @override
  int get hashCode {
    return n.hashCode ^ cached.hashCode ^ data.hashCode;
  }

  // ignore: missing_return
  static List<PasswordModel> fromListDynamic(jsonDecode) {}
}
