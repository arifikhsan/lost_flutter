import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  List<Object> get props => const <dynamic>[];
  // Failure([List properties = const <dynamic>[]]) : super([properties]);
}

class ServerFailure extends Failure {}

class CacheFailure extends Failure {}
