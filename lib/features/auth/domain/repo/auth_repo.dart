import 'package:dartz/dartz.dart';
import 'package:guliva/core/error/failures.dart';
import 'package:guliva/core/usecases/usecase.dart';
import 'package:guliva/features/auth/domain/entities/user_entity.dart';
import 'package:guliva/features/auth/domain/usecase/sign_in_usecase.dart';
import 'package:guliva/features/auth/domain/usecase/sign_up_usecase.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> signIn(SignInParams params);
  Future<Either<Failure, UserEntity>> signUp(SignUpParams params);
  Future<Either<Failure, NoParams>> signOut();
  Future<Either<Failure, UserEntity>> getCachedUser();
}
