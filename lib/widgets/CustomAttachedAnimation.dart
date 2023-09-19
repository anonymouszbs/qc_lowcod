// ignore_for_file: file_names

import 'package:flutter/material.dart';

class CustomAttachedAnimation extends StatefulWidget {
  final AnimationController controller;
  final Widget child;

  const CustomAttachedAnimation(
      {Key? key, required this.controller, required this.child})
      : super(key: key);

  @override
  State<CustomAttachedAnimation> createState() =>
      _CustomAttachedAnimationState();
}

class _CustomAttachedAnimationState extends State<CustomAttachedAnimation> {
  late Animation<double> animation;

  @override
  void initState() {
    animation =
        CurvedAnimation(parent: widget.controller, curve: Curves.decelerate);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.controller,
      builder: (BuildContext context, child) {
        return ClipRect(
          child: Align(
            heightFactor: animation.value,
            widthFactor: animation.value,
            child: Opacity(
              opacity: animation.value,
              child: child,
            ),
          ),
        );
      },
      child: widget.child,
    );
  }
}
