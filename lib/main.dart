import 'package:flutter/material.dart';
import 'package:pagination_with_bloc/app/injection/injection.dart';

import 'app/app.dart';

void main() {
  configureDependencies();
  runApp(const AppWidget());
}
