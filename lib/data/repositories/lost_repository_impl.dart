import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:lost_flutter/core/error/exceptions.dart';
import 'package:lost_flutter/core/error/failures.dart';
import 'package:lost_flutter/data/datasources/lost_remote_data_source.dart';
import 'package:lost_flutter/domain/entities/item_entity.dart';
import 'package:lost_flutter/domain/repositories/lost_repository.dart';

class LostRepositoryImpl implements LostRepository {
  final LostRemoteDataSource remoteDataSource;

  LostRepositoryImpl({
    @required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, List<ItemEntity>>> getAllItems() async {
    try {
      final remoteItems = await remoteDataSource.getAllItems();
      return Right(remoteItems);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<ItemEntity>>> getFoundItems() {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<ItemEntity>>> getLostItems() {
    throw UnimplementedError();
  }
}
