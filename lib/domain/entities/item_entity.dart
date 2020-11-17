import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class ItemEntity extends Equatable {
  final int id;
  final String name;
  final String detail;

  ItemEntity({
    @required this.id,
    @required this.name,
    @required this.detail,
  });

  @override
  List<Object> get props => [id, name, detail];
}
