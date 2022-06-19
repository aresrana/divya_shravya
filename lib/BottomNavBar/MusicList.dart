// import 'dart:io';
// import 'CustomDrawer.dart';
// import 'package:foldable_sidebar/foldable_sidebar.dart';
// import 'package:swipedetector/swipedetector.dart';
// import 'package:flutter_icons/flutter_icons.dart';
// import 'package:flutter/material.dart';
//
// class MusicList extends StatefulWidget {
//   @override
//   _MusicListState createState() => _MusicListState();
// }
//
// class _MusicListState extends State<MusicList> {
//   FSBStatus drawerStatus;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Colors.white,
//         appBar: AppBar(
//           backgroundColor: Colors.white,
//           elevation: 0,
//           leading: IconButton(
//               icon: Icon(
//                 MaterialCommunityIcons.menu,
//                 color: Colors.deepPurple,
//               ),
//               onPressed: () {
//                 setState(() {
//                   drawerStatus = drawerStatus == FSBStatus.FSB_OPEN
//                       ? FSBStatus.FSB_CLOSE
//                       : FSBStatus.FSB_OPEN;
//                 });
//               }),
//           automaticallyImplyLeading: false,
//         ),
//         body: SwipeDetector(
//             onSwipeRight: () {
//               setState(() {
//                 drawerStatus = FSBStatus.FSB_OPEN;
//               });
//             },
//             onSwipeLeft: () {
//               setState(() {
//                 drawerStatus = FSBStatus.FSB_CLOSE;
//               });
//             },
//             swipeConfiguration: SwipeConfiguration(
//                 verticalSwipeMinVelocity: 75, horizontalSwipeMinVelocity: 75),
//             child: FoldableSidebarBuilder(
//                 drawerBackgroundColor: Theme
//                     .of(context)
//                     .backgroundColor,
//                 status: drawerStatus,
//                 drawer: CustomDrawer(
//                   closeDrawer: () {
//                     setState(() {
//                       drawerStatus = FSBStatus.FSB_CLOSE;
//                     });
//                   },
//                 ))));
//   }
//
// }
