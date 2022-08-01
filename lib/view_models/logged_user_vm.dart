import 'package:kprn/models/user_model.dart';
import 'package:rxdart/rxdart.dart';

class LoggedUserVm {
  LoggedUserVm._pr();
  static final LoggedUserVm _instance = LoggedUserVm._pr();
  static LoggedUserVm get instance => _instance;

  final BehaviorSubject<UserModel?> _subject = BehaviorSubject<UserModel>();
  Stream<UserModel?> get stream => _subject.stream;
  UserModel? get current => _subject.value;

  void populate(UserModel? user) {
    _subject.add(user);
  }

  // void continueStream() async {
  //   await _subject.sink.
  // }

  void cancelStream() async {
    await _subject.close();
  }
}
