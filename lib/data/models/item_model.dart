import 'package:flutter/foundation.dart';
import 'package:lost_flutter/domain/entities/item_entity.dart';

class ItemModel extends ItemEntity {
  ItemModel({
    @required int id,
    @required String name,
    @required String detail,
  }) : super(id: id, name: name, detail: detail);

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
      id: json['id'],
      name: json['name'],
      detail: json['detail'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'detail': detail,
    };
  }
}
