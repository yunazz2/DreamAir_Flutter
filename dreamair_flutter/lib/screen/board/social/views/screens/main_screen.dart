// import 'package:flutter/material.dart';
// import 'package:flight_booking/screen/board/social/views/widgets/icon_badge.dart';
// import 'package:flight_booking/screen/board/social/views/screens/chat/chats.dart';
// import 'package:flight_booking/screen/board/social/views/screens/friends.dart';
// import 'package:flight_booking/screen/board/social/views/screens/home.dart';
// import 'package:flight_booking/screen/board/social/views/screens/notifications.dart';
// import 'package:flight_booking/screen/board/social/views/screens/profile.dart';

// class MainScreen extends StatefulWidget {
//   const MainScreen({super.key});

//   @override
//   _MainScreenState createState() => _MainScreenState();
// }

// class _MainScreenState extends State<MainScreen> {
//   late PageController _pageController;
//   int _page = 2;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: PageView(
//         physics: const NeverScrollableScrollPhysics(),
//         controller: _pageController,
//         onPageChanged: onPageChanged,
//         children: <Widget>[
//           Chats(),
//           Friends(),
//           Home(),
//           Notifications(),
//           Profile(),
//         ],
//       ),
//       bottomNavigationBar: Theme(
//         data: Theme.of(context).copyWith(
//           // sets the background color of the `BottomNavigationBar`
//           canvasColor: Theme.of(context).primaryColor,
//           // sets the active color of the `BottomNavigationBar` if `Brightness` is light
//           primaryColor: Theme.of(context).colorScheme.secondary,
//           textTheme: Theme.of(context).textTheme.copyWith(
//                 bodySmall: TextStyle(color: Colors.grey[500]),
//               ),
//         ),
//         child: BottomNavigationBar(
//           type: BottomNavigationBarType.fixed,
//           items: <BottomNavigationBarItem>[
//             const BottomNavigationBarItem(
//               icon: Icon(
//                 Icons.message,
//               ),
//               label: '',
//             ),
//             const BottomNavigationBarItem(
//               icon: Icon(
//                 Icons.group,
//               ),
//               label: '',
//             ),
//             const BottomNavigationBarItem(
//               icon: Icon(
//                 Icons.home,
//               ),
//               label: '',
//             ),
//             BottomNavigationBarItem(
//               icon: IconBadge(icon: Icons.notifications),
//               label: '',
//             ),
//             const BottomNavigationBarItem(
//               icon: Icon(Icons.person),
//               label: '',
//             ),
//           ],
//           onTap: navigationTapped,
//           currentIndex: _page,
//         ),
//       ),
//     );
//   }

//   void navigationTapped(int page) {
//     _pageController.jumpToPage(page);
//   }

//   @override
//   void initState() {
//     super.initState();
//     _pageController = PageController(initialPage: 2);
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     _pageController.dispose();
//   }

//   void onPageChanged(int page) {
//     setState(() {
//       _page = page;
//     });
//   }
// }
