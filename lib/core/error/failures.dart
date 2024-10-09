import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;

  Failure({required this.message});
  @override
  List<Object> get props => [message];
}

// General failures
class ServerFailure extends Failure {
  ServerFailure({required super.message});
}

class CacheFailure extends Failure {
  CacheFailure({required super.message});
}

class NetworkFailure extends Failure {
  NetworkFailure({required super.message});
}

class ExceptionFailure extends Failure {
  ExceptionFailure({required super.message});
}

class CredentialFailure extends Failure {
  CredentialFailure({required super.message});
}

class AuthenticationFailure extends Failure {
  AuthenticationFailure({required super.message});
}
