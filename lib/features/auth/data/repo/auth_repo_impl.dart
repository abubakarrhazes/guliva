import 'package:dartz/dartz.dart';
import 'package:guliva/core/error/failures.dart';
import 'package:guliva/core/usecases/usecase.dart';
import 'package:guliva/features/auth/domain/entities/user.dart';
import 'package:guliva/features/auth/domain/repo/auth_repo.dart';
import 'package:guliva/features/auth/domain/usecase/sign_in_usecase.dart';
import 'package:guliva/features/auth/domain/usecase/sign_up_usecase.dart';

class AuthRepoImpl implements AuthRepo {
  @override
  Future<Either<Failure, User>> getCachedUser() {
    // TODO: implement getCachedUser
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, User>> signIn(SignInParams params) {
    // TODO: implement signIn
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, NoParams>> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, User>> signUp(SignUpParams params) {
    // TODO: implement signUp
    throw UnimplementedError();
  }
}
