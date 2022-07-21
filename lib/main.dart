import 'package:flutter/material.dart';
import 'package:kprn/khprn_app.dart';
import 'package:kprn/services/data_cacher.dart';

final DataCacher cacher = DataCacher.instance;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await cacher.init();
  runApp(const KhprnApp());
}
