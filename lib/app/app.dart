import 'package:flutter/material.dart';
import 'package:pagination_with_bloc/app/presentation/screens/beer_screen.dart';
import 'package:pagination_with_bloc/main.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: BeerScreen(),
    );
  }
}
