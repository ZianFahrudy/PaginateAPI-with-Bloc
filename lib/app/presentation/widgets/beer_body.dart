import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pagination_with_bloc/app/data/bloc/beer_bloc.dart';
import 'package:pagination_with_bloc/app/data/models/beer_model.dart';
import 'package:pagination_with_bloc/app/injection/injection.dart';
import 'package:pagination_with_bloc/app/presentation/widgets/beer_list_item.dart';

class BeerBody extends StatefulWidget {
  const BeerBody({Key? key}) : super(key: key);

  @override
  _BeerBodyState createState() => _BeerBodyState();
}

class _BeerBodyState extends State<BeerBody> {
  final List<BeerModel> _beers = [];
  final ScrollController _scrollController = ScrollController();

  final beerBloc = getIt<BeerBloc>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocConsumer<BeerBloc, BeerState>(
        listener: (context, beerState) {
          if (beerState is BeerLoading) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(beerState.message)));
          } else if (beerState is BeerSuccess && beerState.beers.isEmpty) {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text('No more beers')));
          } else if (beerState is BeerFailed) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(beerState.error)));
            BlocProvider.of<BeerBloc>(context).isFetching = false;
          }
          return;
        },
        builder: (context, beerState) {
          if (beerState is BeerInitial ||
              beerState is BeerLoading && _beers.isEmpty) {
            return const CircularProgressIndicator();
          } else if (beerState is BeerSuccess) {
            _beers.addAll(beerState.beers);
            BlocProvider.of<BeerBloc>(context).isFetching = false;

            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          } else if (beerState is BeerFailed && _beers.isEmpty) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    BlocProvider.of<BeerBloc>(context)
                      ..isFetching = true
                      ..add(BeerFetchEvent());
                  },
                  icon: const Icon(Icons.refresh),
                ),
                const SizedBox(height: 15),
                Text(beerState.error, textAlign: TextAlign.center),
              ],
            );
          }
          return ListView.separated(
            controller: _scrollController
              ..addListener(() {
                if (_scrollController.offset ==
                        _scrollController.position.maxScrollExtent &&
                    !BlocProvider.of<BeerBloc>(context).isFetching) {
                  BlocProvider.of<BeerBloc>(context)
                    ..isFetching = true
                    ..add(BeerFetchEvent());
                }
              }),
            itemBuilder: (context, index) => BeerListItem(_beers[index]),
            separatorBuilder: (context, index) => const SizedBox(height: 20),
            itemCount: _beers.length,
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
