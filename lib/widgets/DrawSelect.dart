
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DrawSelect extends StatefulWidget {
  const DrawSelect({super.key});

  @override
  State<DrawSelect> createState() => _DrawSelectState();
}

class _DrawSelectState extends State<DrawSelect> {
  List departmentList =  [
        {
            "id": 1,
            "DepartmentName": "清华大学",
            "ParentDepartmentID": 0,
            "status": 1
        },
        {
            "id": 2,
            "DepartmentName": "软件学院",
            "ParentDepartmentID": 1,
            "status": 1
        },
        {
            "id": 3,
            "DepartmentName": "计算机学院",
            "ParentDepartmentID": 1,
            "status": 1
        },
        {
            "id": 4,
            "DepartmentName": "数学系",
            "ParentDepartmentID": 1,
            "status": 1
        }
    ];
String selectvalue = "清华大学";
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 100.w,
        height:30.h,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          gradient: LinearGradient(
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
            colors: [
              Color.fromRGBO(255, 255, 255, 0),
              Color.fromRGBO(255, 255, 255, 0.12)
            ],
          ),
        ),

        child: DropdownButton<String>(
            underline: Container(),
            dropdownColor: Color.fromRGBO(255, 255, 255, 0.20), //下拉背景色
            value: selectvalue,
            items: departmentList
                .map<DropdownMenuItem<String>>((value) {
              return DropdownMenuItem<String>(
                  value: value['DepartmentName'].toString(),
                  child:  Row(
                      children: [
                      
                        Text(
                          value['DepartmentName'].toString(),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: ScreenUtil().setSp(14)),
                        ),
                      
                        
                      ],
                    ),
                  );
            }).toList(),
            onChanged: (newValue) {
               setState(() {
                 selectvalue = newValue!;
               });
            },
          ),
        );
  }
}