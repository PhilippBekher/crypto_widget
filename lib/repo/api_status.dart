class Success {
  int? code;
  Object response;
  Success({this.code, required this.response});
}

class Failure {
  int code;
  Object response;
  Failure({required this.code, required this.response});
}
