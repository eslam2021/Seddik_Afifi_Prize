class Raf3Model {
  Raf3Model({
    required this.message,
    required this.check,
  });
  late final String message;
  late final bool check;

  Raf3Model.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    check = json['check'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['message'] = message;
    _data['check'] = check;
    return _data;
  }
}
