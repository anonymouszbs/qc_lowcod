import 'package:flutter/material.dart';

class Buttons extends StatefulWidget {
  final double height;
  final List<Widget> itemswidget;
  final List<bool> isSelected;
  final Function(int)? onclick;
  final Color selectcolor;
  final Color color;
  const Buttons(
      {Key? key,
      required this.height,
      required this.itemswidget,
      required this.isSelected,required this.onclick, required this.selectcolor, required this.color,})
      : super(key: key);

  @override
  State<Buttons> createState() => _ButtonsState();
}

class _ButtonsState extends State<Buttons> {
  @override
  Widget build(BuildContext context) {
    return Row(
      
      crossAxisAlignment: CrossAxisAlignment.start,
     // direction: Axis.horizontal,
      children: widget.itemswidget.asMap().keys.map((e) {
      return Expanded(child: Container(
        color: widget.isSelected[e]?widget.color:widget.selectcolor,
        child: 
       TextButton(
       
          onPressed: widget.isSelected[e]?null:(){
            widget.onclick!(e);
          }, child: Container(
            alignment: Alignment.center,
            height: widget.height,
            width: MediaQuery.of(context).size.width,
            child:widget.itemswidget[e]
          ),),
        ),
      );
      }).toList(),
    );
  }
}
