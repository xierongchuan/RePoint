import 'package:flutter/material.dart';

import 'package:repoint/pages/toDoPage.dart';
import 'package:repoint/pages/mainScreen.dart';

final Color mBlue = Color(0xFF1389FD);
final Color mRed = Color(0xFFA80000);
final Color mGreen = Color(0xFF359D35);
final Color mGrey = Color(0xFF3D3D3D);
final Color mDarkGrey = Color(0xFF2E2E2E);
final Color mLightGrey = Color(0xFF828282);
final Color mLightGreyAlpha = Color(0x88828282);
final Color mWhite = Color(0xFFFFFFFF);

void main(){
  runApp(MaterialApp(
    title: 'RePoint',
    theme: ThemeData(
      primaryColor: mGrey,
    ),
    initialRoute: '/',
    routes: {
      '/': (context) => MainScreen(),
      '/toDo': (context) => ToDoPage(),
    },
  ));
}

// ----------------------------------------------------------------------------

// var _number = 0;

// void main() => runApp(MaterialApp(
//   title: 'RePoint',
//   home: UserPanel(),
// ));

// class UserPanel extends StatefulWidget {
//   const UserPanel({ Key? key }) : super(key: key);

//   @override
//   _UserPanelState createState() => _UserPanelState();
// }

// class _UserPanelState extends State<UserPanel> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: mDarkGrey,
//       appBar: AppBar(
//         backgroundColor: mGrey,
//         title: Text(
//           'RePoint',
//           style: TextStyle(
//             fontFamily: 'Google',
//             color: mWhite,
//           ),
//         ),
//       ),
//       body: SafeArea(
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Column(
//               children: [
//                 Padding(padding: EdgeInsets.only(top: 15),),
//                 CircleAvatar(
//                   backgroundImage: AssetImage('assets/images/GinIchimaru.jpg'),
//                   radius: 50,
//                 ),
//                 Padding(padding: EdgeInsets.only(top: 7),),
//                 Text(
//                   'Gin Ichimaru',
//                   style: TextStyle(
//                     fontFamily: 'Google',
//                     fontSize: 20.0,
//                     color: mWhite,
//                   ),
//                 ),
//                 Row(
//                   children: [
//                     TextButton(
//                       onPressed: () {
//                         Clipboard.setData(new ClipboardData(text: 'tsukuyomi@madara-uchiha.ru'));
//                         final snackBar = SnackBar(
//                           duration: Duration(milliseconds: 1000),
//                           backgroundColor: mGrey,
//                           content: Text(
//                             'Copied',
//                             style: TextStyle(
//                               fontSize: 17.5,
//                             ),
//                           ),
//                           // action: SnackBarAction(
//                           //   label: 'Undo',
//                           //   textColor: mLightGrey,
//                           //   onPressed: () {},
//                           // ),
//                         );
//                         ScaffoldMessenger.of(context).showSnackBar(snackBar);
//                       },
//                       style: ButtonStyle(overlayColor: MaterialStateProperty.all<Color>(mLightGreyAlpha),),
//                       child: Row(
//                         children: [
//                           Icon(
//                             Icons.mail_outline,
//                             color: mLightGrey,
//                           ),
//                           Padding(padding: EdgeInsets.only(right: 5),),
//                           Text(
//                             'tsukuyomi@madara-uchiha.ru',
//                             style: TextStyle(
//                               color: mLightGrey,
//                               fontFamily: 'Google',
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//                 Text(
//                   '$_number',
//                   style: TextStyle(
//                     fontFamily: 'Google',
//                     fontSize: 20.0,
//                     color: mWhite,
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: mGrey,
//         child: Icon(
//           Icons.add,
//           size: 27.5,
//         ),
//         onPressed: () {
//           setState(() {
//             _number++;
//           });
//         },
//       ),
//     );
//   }
// }
