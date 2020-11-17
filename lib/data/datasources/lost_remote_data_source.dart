import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:lost_flutter/core/error/exceptions.dart';
import 'package:lost_flutter/data/models/item_model.dart';

abstract class LostRemoteDataSource {
  Future<List<ItemModel>> getAllItems();
}

class LostRemoteDataSourceImpl implements LostRemoteDataSource {
  final Dio dio;

  LostRemoteDataSourceImpl({@required this.dio});

  @override
  Future<List<ItemModel>> getAllItems() async {
    final response = await dio.get('http://localhost:3000/api/v1/items') ;
    if (response.statusCode == 200) {
      print(response.data);
      // return ItemModel.fromJson(json.decode(response.data))
    } else {
      throw ServerException();
    }
  }
}
