import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  // late String message;
  // @override
  // List<Object?> get props => [message];
}

class NetworkFailure extends Failure {
  final String message = "Server error try again later";
  @override
  List<Object?> get props => [message];
}

class ServerFailure extends Failure {
  final String message = "No network connection";
  @override
  List<Object?> get props => [message];
}
