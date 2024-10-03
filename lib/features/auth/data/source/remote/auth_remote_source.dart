import 'package:dartz/dartz.dart';
import 'package:guliva/core/error/failures.dart';
import 'package:guliva/features/auth/domain/entities/user.dart';
import 'package:guliva/features/auth/domain/usecase/sign_in_usecase.dart';
import 'package:guliva/features/auth/domain/usecase/sign_up_usecase.dart';

abstract class AuthRemoteSource {
  Future<Either<Failure, User>> signIn(SignInParams params);
  Future<Either<Failure, User>> signUp(SignUpParams params);
 


}