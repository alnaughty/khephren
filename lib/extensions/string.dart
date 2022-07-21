// import 'dart:core';

// import 'package:http/http.dart';

extension UriParser on String {
  Uri get toUri {
    return Uri.parse(this);
  }
}
