import 'package:flutter/material.dart';

import '../../../../widgets/drag/resizable_draggable_widget.dart';

class MenuZujian extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        child: ListView(
          shrinkWrap: true,
          children: [
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 3,
              children: List.generate(6, (index) {
                return Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1),
                    ),
                    child: Draggable(
                      data:ElevatedButton(
                        child: Text("按钮"),
                        onPressed: null,
                      ),
                      feedback: ElevatedButton(
                        child: Text("按钮"),
                        onPressed: null,
                      ),
                      child:
                          ElevatedButton(child: Text("按钮"), onPressed: (){}),
                    ));
              }),
            )
          ],
        ),
      ),
    );
  }
}
