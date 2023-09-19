import 'package:flutter/material.dart';

class MacWindowAnimation extends StatefulWidget {
  @override
  _MacWindowAnimationState createState() => _MacWindowAnimationState();
}

class _MacWindowAnimationState extends State<MacWindowAnimation> {
  double scaleFactor = 1.0;

  void _toggleAnimation() {
    setState(() {
      scaleFactor = (scaleFactor == 1.0) ? 0.5 : 1.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mac Window Animation'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: _toggleAnimation,
          child: AnimatedContainer(
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            alignment: Alignment.topLeft,  // 设置缩放原点为左上角
            width: 300 * scaleFactor,
            height: 200 * scaleFactor,
            transformAlignment: Alignment.topLeft,  // 设置变换的原点为左上角
            transform: Matrix4.identity()..scale(scaleFactor),  // 缩放变换
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Center(
              child: Text(
                'Mac Window',
                style: TextStyle(
                  fontSize: 24.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
