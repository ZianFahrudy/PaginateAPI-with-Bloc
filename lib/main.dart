import 'package:flutter/material.dart';
import 'package:pagination_with_bloc/app/injection/injection.dart';

import 'app/app.dart';

void main() {
  configureDependencies();
  runApp(const AppWidget());
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(),
//     );
//   }
// }
