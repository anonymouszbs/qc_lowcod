

// ignore_for_file: file_names

import 'package:flutter/material.dart';

class RotationAnimation extends StatefulWidget {
  final Widget child;
  final bool isshow;
  const RotationAnimation({Key? key, required this.child, required this.isshow}) : super(key: key);

  @override
 State <RotationAnimation>createState() => _RotationAnimationState();
}



class _RotationAnimationState extends State<RotationAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: 0.5).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
  
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    widget.isshow==true?_animationController.forward():_animationController.animateTo(0);
    return Center(
      child: AnimatedBuilder(
        animation: _animation,
        builder: (BuildContext context,  child) {
          return Transform.rotate(
            angle: _animation.value * 2.0 * 3.1415926535897932,
            child: child,
          );
        },
        child:widget.child),
    );
  }
}