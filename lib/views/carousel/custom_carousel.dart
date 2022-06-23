import 'dart:async';

import 'package:flutter/material.dart';

class CustomCarousel extends StatefulWidget {
  const CustomCarousel({
    Key? key,
    required this.children,
    this.viewportFraction = 1.0,
    required this.changeDuration,
  }) : super(key: key);
  final List<Widget> children;
  final double viewportFraction;
  final Duration changeDuration;
  @override
  State<CustomCarousel> createState() => _CustomCarouselState();
}

class _CustomCarouselState extends State<CustomCarousel>
    with SingleTickerProviderStateMixin {
  late final PageController _pageController;
  int _currentPage = 0;
  Timer? timer;
  initTime() {
    timer = Timer.periodic(widget.changeDuration, (time) {
      if (_currentPage == widget.children.length - 1) {
        _currentPage = 0;
      } else {
        _currentPage += 1;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 600),
        curve: Curves.decelerate,
      );
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  void initState() {
    _pageController = PageController(
      viewportFraction: widget.viewportFraction,
    );
    initTime();
    super.initState();
  }

  @override
  void dispose() {
    stop();
    _pageController.dispose();
    super.dispose();
  }

  stop() {
    if (timer != null && timer!.isActive) {
      timer!.cancel();
      timer = null;
    }
  }

  reset() {
    if (timer != null) {
      stop();
      initTime();
    }
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      onPageChanged: (int index) {
        setState(() {
          _currentPage = index;
        });
        reset();
      },
      itemCount: widget.children.length,
      itemBuilder: (_, index) => Padding(
        padding: const EdgeInsets.only(
          left: 10,
          right: 10,
        ),
        child: widget.children[index],
      ),
      controller: _pageController,
      // children: widget.children,
    );
  }
}
