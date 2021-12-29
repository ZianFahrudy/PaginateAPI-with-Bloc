import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:pagination_with_bloc/app/data/models/beer_model.dart';
import 'package:pagination_with_bloc/app/domain/repositories/beer_repository.dart';

part 'beer_event.dart';
part 'beer_state.dart';

@injectable
class BeerBloc extends Bloc<BeerEvent, BeerState> {
  final BeerRepository _repository;

  int page = 1;
  bool isFetching = false;

  BeerBloc(this._repository) : super(BeerInitial()) {
    on<BeerEvent>((event, emit) async {
      emit(BeerLoading('Loading...'));
      try {
        final result = await _repository.getBeer(page);

        result.fold((l) => emit(BeerFailed(l.message)), (r) {
          emit(BeerSuccess(r));
          page++;
        });
      } catch (e) {
        emit(BeerFailed(e.toString()));
      }
    });
  }
}
