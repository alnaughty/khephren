import 'package:flutter/material.dart';
import 'package:kprn/data_listeners_and_handlers/landing_page_handler.dart';
import 'package:rxdart/subjects.dart';

class LaunchpadPageHandler {
  static final PageController _pageController = PageController();
  PageController get pageController => _pageController;
  final BehaviorSubject<int> _subject = BehaviorSubject<int>.seeded(0);
  Stream<int> get stream => _subject.stream;
  int get current => _subject.value;
  static final LandingPageHandler _landingHandler = LandingPageHandler.instance;
  Widget secondPage = Container();
  void back() async {
    // ignore: no_leading_underscores_for_local_identifiers
    final int _current = current;
    if (_current == 0) {
      _landingHandler.reset();
    } else {
      final int ff = _current - 1;
      await _pageController.animateToPage(
        ff,
        duration: const Duration(
          milliseconds: 500,
        ),
        curve: Curves.decelerate,
      );
    }
    _subject.add(0);
  }

  void fore(Widget child) async {
    secondPage = child;
    _subject.add(1);
    await _pageController.animateToPage(
      1,
      duration: const Duration(
        milliseconds: 500,
      ),
      curve: Curves.decelerate,
    );
  }
}
