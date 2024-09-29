class Base {
  int? code;
  dynamic data;
  String? message;

  Base({this.code, this.data, this.message});

  Base.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    data = json['data'];
    message = json['message'];
  }
}
