import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pagination_with_bloc/app/data/bloc/beer_bloc.dart';
import 'package:pagination_with_bloc/app/injection/injection.dart';
import 'package:pagination_with_bloc/app/presentation/widgets/beer_body.dart';

class BeerScreen extends StatelessWidget {
  const BeerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final beerBloc = getIt<BeerBloc>();

    return BlocProvider(
      create: (context) => beerBloc..add(BeerFetchEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Beers'),
        ),
        body: const BeerBody(),
      ),
    );
  }
}
