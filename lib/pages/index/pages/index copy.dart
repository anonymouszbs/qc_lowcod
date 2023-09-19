// ignore_for_file: file_names
// import 'package:flutter/material.dart';

// import '../../../public/system_utils.dart';

// class IndexPage extends StatefulWidget {
//   const IndexPage({Key? key}) : super(key: key);

//   @override
//   State<IndexPage> createState() => _IndexPageState();
// }

// class _IndexPageState extends State<IndexPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           ElevatedButton(
//               onPressed: () {
//                 SystemUtils.notific(
//                     title: "标题",
//                     body: "内容",
//                     onclick: () {},
//                     onclose: () => null,
//                     onshow: () => null);
//               },
//               child: Text("系统弹窗")),
//               ElevatedButton(
//               onPressed: () {
//                SystemUtils.showQCnotific(title: "编译完成",icon: Icons.check);
//               },
//               child: Text("notifity")),
//                ElevatedButton(
//               onPressed: () {
//                SystemUtils.showQCnotific(title: "编译完成",icon: Icons.check);
//               },
//               child: Text("notifity"))
//         ],
//       ),
//     );
//   }
// }
