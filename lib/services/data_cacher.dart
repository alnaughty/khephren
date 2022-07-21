import 'package:shared_preferences/shared_preferences.dart';

class DataCacher {
  DataCacher._pr();
  static final DataCacher _instance = DataCacher._pr();
  static DataCacher get instance => _instance;
  late final SharedPreferences _sharedPreferences;
  Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  String? get ethereumAddress => _sharedPreferences.getString("address");
  void setAddress(String? address) async {
    if (address == null) return;
    await _sharedPreferences.setString("address", address);
  }
}
