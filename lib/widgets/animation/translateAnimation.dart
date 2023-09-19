

import 'package:flutter/material.dart';

class TranslateAnimation extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final  isshow ;
  final Widget frame;
  final EdgeInsetsGeometry padding;
  final Alignment alignment;
  final Axis direction;
  const TranslateAnimation({Key? key,required this.isshow, required this.frame, required this.padding, required this.alignment, required this.direction}):super(key: key);

  @override
  State<TranslateAnimation> createState() => _TranslateAnimationState();
}

class _TranslateAnimationState extends State<TranslateAnimation>with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 300), vsync: this);
    
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if(widget.isshow){
      animationController.forward();
    }else{
      animationController.animateTo(0);
    }
     return Container(
            alignment: widget.alignment,
            padding: widget.padding,
            child: SizeTransition(
                axis: widget.direction,
                sizeFactor: CurvedAnimation(
                    parent: animationController, curve: Curves.easeInToLinear),
                child: Material(
                  child: widget.frame,
                )));
  }
}