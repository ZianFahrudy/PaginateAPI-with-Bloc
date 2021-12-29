part of 'beer_bloc.dart';

@immutable
abstract class BeerState {}

class BeerInitial extends BeerState {}

class BeerSuccess extends BeerState {
  final List<BeerModel> beers;

  BeerSuccess(this.beers);
}

class BeerLoading extends BeerState {
  final String message;
  BeerLoading(this.message);
}

class BeerFailed extends BeerState {
  final String error;
  BeerFailed(this.error);
}
