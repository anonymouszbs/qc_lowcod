import 'package:flutter/material.dart';
import 'package:qc_lowcode/pages/floatbutton/controller/theme.dart';

class StaticTogglebuts extends StatefulWidget {
  final List<Widget> children;
  final Axis direction;
  final Function(int index) onTap;
  const StaticTogglebuts(
      {Key? key,
      required this.children,
      required this.direction,
      required this.onTap})
      : super(key: key);

  @override
  State<StaticTogglebuts> createState() => _StaticTogglebutsState();
}

class _StaticTogglebutsState extends State<StaticTogglebuts> {
  List<bool> isSelected = [];
  int currentindex = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.children.map((e) {
      isSelected.add(false);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(

      children: widget.children,
      isSelected: isSelected,
      direction: widget.direction,
      fillColor: ReaderThemeC.current.theme.value.primaryColor,
      onPressed: (v) {
        if (currentindex == v) {
          return;
        }
        currentindex = v;
        widget.onTap(v);
        setState(() {
          isSelected = isSelected.map((e) => false).toList();
          isSelected[v] = !isSelected[v];
        });
      },
    );
  }
}
