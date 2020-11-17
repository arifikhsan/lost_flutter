import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:lost_flutter/core/usecase/no_params.dart';
import 'package:lost_flutter/data/models/item_model.dart';
import 'package:lost_flutter/domain/usecases/get_all_items_usecase.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetAllItemsUsecase getAllItemsUsecase;

  HomeBloc({
    @required this.getAllItemsUsecase,
  }) : super(HomeInitial());

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is GetAllItems) {
      yield HomeLoading();
      final failureOrItems = await getAllItemsUsecase(NoParams());
      failureOrItems.fold(
        (failure) => HomeError(messages: 'error nih'),
        (items) => HomeLoaded(items: items),
      );
    }
  }
}
