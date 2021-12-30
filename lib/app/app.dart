import 'package:flutter/material.dart';
import 'package:pagination_with_bloc/app/presentation/screens/beer_screen.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.dark,
      theme: ThemeData.dark(),
      home: const BeerScreen(),
    );
  }
}
