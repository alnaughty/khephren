import 'dart:convert';

import 'package:kprn/extensions/string.dart';
import 'package:kprn/models/launchpad_data.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class LaunchpadApi {
  Future<List<LaunchpadData>> fetch({
    String toSearch = "",
    String filter = "",
    required int chainId,
  }) async {
    try {
      final String launchpadApi = dotenv.get("LAUNCHPAD_API");
      return await http
          .get(
              "$launchpadApi/launchpads?chain_id=$chainId&filter=$filter&keyword=$toSearch"
                  .toUri)
          .then(
        (response) {
          if (response.statusCode == 200) {
            var data = json.decode(response.body);
            print("DATA : $data");
            List dataa = data['data'];
            List<LaunchpadData> _data =
                dataa.map((e) => LaunchpadData.fromJson(e)).toList();
            print("DATA LENGTH : ${_data.length}");
            return _data;
          }
          return [];
        },
      );
    } catch (e) {
      print("ERROR : $e");
      return [];
    }
  }
}
