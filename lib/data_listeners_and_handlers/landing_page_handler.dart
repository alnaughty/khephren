import 'package:flutter/material.dart';
import 'package:rxdart/subjects.dart';

class LandingPageHandler {
  LandingPageHandler._singleton();
  static final LandingPageHandler _instance = LandingPageHandler._singleton();
  static LandingPageHandler get instance => _instance;

  final BehaviorSubject<int> _subject = BehaviorSubject<int>.seeded(0);
  Stream<int> get stream => _subject.stream;
  int get current => _subject.value;
  static final PageController _pageController = PageController();
  PageController get pageController => _pageController;

  Widget secondPage = Container();
  reset() async {
    _subject.add(0);
    await _pageController.animateToPage(
      0,
      duration: const Duration(
        milliseconds: 500,
      ),
      curve: Curves.decelerate,
    );
    secondPage = Container();
  }

  update(Widget child, int page) async {
    secondPage = child;
    _subject.add(page);
    await _pageController.animateToPage(
      page,
      duration: const Duration(
        milliseconds: 500,
      ),
      curve: Curves.decelerate,
    );
  }
}
