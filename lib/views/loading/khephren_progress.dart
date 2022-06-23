import 'package:flutter/material.dart';

class KhephrenProgressIndicator extends StatefulWidget {
  const KhephrenProgressIndicator({Key? key, this.size, this.color})
      : super(key: key);
  final double? size;
  final Color? color;
  @override
  State<KhephrenProgressIndicator> createState() =>
      _KhephrenProgressIndicatorState();
}

class _KhephrenProgressIndicatorState extends State<KhephrenProgressIndicator>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _scaleController;
  // bool isForwardScale = true;
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 5000),
    );
    _controller.repeat();
    _scaleController = AnimationController(
      vsync: this,
      lowerBound: .3,
      duration: const Duration(milliseconds: 1500),
    );
    _scaleController.forward();
    _scaleController.addListener(_scaleListener);
    super.initState();
  }

  void _scaleListener() {
    if (_scaleController.isCompleted) {
      _scaleController.reverse();
    } else if (_scaleController.isDismissed) {
      _scaleController.forward();
    }
  }

  @override
  void dispose() {
    _scaleController.removeListener(_scaleListener);
    _scaleController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RotationTransition(
        turns: Tween(begin: 0.0, end: 1.0).animate(_controller),
        child: ScaleTransition(
          scale: _scaleController,
          child: FadeTransition(
            opacity: _scaleController,
            child: Image.asset(
              "assets/images/logo.png",
              width: widget.size,
              height: widget.size,
              color: widget.color,
            ),
          ),
        ),
      ),
    );
  }
}
