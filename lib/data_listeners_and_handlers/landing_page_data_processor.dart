import 'package:kprn/models/launchpad_data.dart';
import 'package:kprn/services/API/launchpad.dart';

class LandingDataProcessor {
  final LaunchpadApi _api = LaunchpadApi();
  List<LaunchpadData> _upcomingLaunchPads = [];
  List<LaunchpadData> get upcomingLaunchpads => _upcomingLaunchPads;
  Future<void> run(int chainId) async {
    await Future.wait(
      [
        _api.fetch(
          chainId: chainId,
          filter: "active",
        ),
      ],
    ).then((List value) {
      _upcomingLaunchPads = value[0];
      print(upcomingLaunchpads.length);
    });
  }
}
