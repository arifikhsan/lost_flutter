import 'package:dartz/dartz.dart';
import 'package:lost_flutter/core/error/failures.dart';
import 'package:lost_flutter/domain/entities/item_entity.dart';

abstract class LostRepository {
  Future<Either<Failure, List<ItemEntity>>> getAllItems();
  Future<Either<Failure, List<ItemEntity>>> getLostItems();
  Future<Either<Failure, List<ItemEntity>>> getFoundItems();
}
