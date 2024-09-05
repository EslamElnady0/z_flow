import 'dart:async';

import 'package:flutter/material.dart';

class ImageSwitcher extends StatefulWidget {
  final List<String> switchingImages;
  final double height;
  final double? width;
  const ImageSwitcher(
      {super.key,
      required this.switchingImages,
      required this.height,
      this.width});

  @override
  State<ImageSwitcher> createState() => _ImageSwitcherState();
}

class _ImageSwitcherState extends State<ImageSwitcher> {
  int _currentIndex = 0;
  late Timer _timer;
  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % widget.switchingImages.length;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
      child: Image.asset(
        widget.switchingImages[_currentIndex],
        height: widget.height,
        width: widget.width,
        key: ValueKey<int>(_currentIndex),
        fit: BoxFit.cover,
      ),
    );
  }
}
