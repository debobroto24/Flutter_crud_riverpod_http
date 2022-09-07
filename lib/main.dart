import 'dart:io';

import 'package:flutte_crud_riverpod_http/screens/user_list_screen.dart';
// import 'package:flutte_crud_riverpod_http/screens/user_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// class MyHttpOverides extends HttpOverrides {
//   @override
//   HttpClient createHttpClient(SecurityContext? context) {
//     return super.createHttpClient(context)
//       ..badCertificateCallback =
//           (X509Certificate cert, String host, int port) => true;

//     // ..badCertificateCallback = (X509Certificate cert, String host, );
//   }
// }

void main() {
  // HttpOverrides.global = MyHttpOverides();
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const UserListScreen(),
    );
  }
}
