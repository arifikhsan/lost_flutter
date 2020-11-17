import 'package:flutter/foundation.dart';
import 'package:lost_flutter/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:lost_flutter/core/usecase/no_params.dart';
import 'package:lost_flutter/core/usecase/usecase.dart';
import 'package:lost_flutter/domain/entities/item_entity.dart';
import 'package:lost_flutter/domain/repositories/lost_repository.dart';

class GetAllItemsUsecase implements Usecase<List<ItemEntity>, NoParams> {
  final LostRepository repository;

  GetAllItemsUsecase({@required this.repository});

  @override
  Future<Either<Failure, List<ItemEntity>>> call(NoParams params) async {
    return await repository.getAllItems();
  }
}
