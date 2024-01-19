// import 'package:flutter/material.dart';
// import 'package:flight_booking/screen/board/social/views/widgets/post_item.dart';
// import 'package:flight_booking/screen/board/social/util/data.dart';

// class Home extends StatefulWidget {
//   const Home({super.key});

//   @override
//   _HomeState createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Feeds"),
//         centerTitle: true,
//         actions: <Widget>[
//           IconButton(
//             icon: const Icon(
//               Icons.filter_list,
//             ),
//             onPressed: () {},
//           ),
//         ],
//       ),
//       body: ListView.builder(
//         padding: const EdgeInsets.symmetric(horizontal: 20),
//         itemCount: posts.length,
//         itemBuilder: (BuildContext context, int index) {
//           Map post = posts[index];
//           return PostItem(
//             img: post['img'],
//             name: post['name'],
//             dp: post['dp'],
//             time: post['time'],
//           );
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         child: const Icon(
//           Icons.add,
//           color: Colors.white,
//         ),
//         onPressed: () {},
//       ),
//     );
//   }
// }
