import 'package:dartz/dartz.dart';
import 'package:guliva/features/auth/domain/entities/user.dart';
import 'package:guliva/features/auth/domain/repo/auth_repo.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/usecases/usecase.dart';

class SignInUseCase implements UseCase<User, SignInParams> {
  final AuthRepo repository;
  SignInUseCase(this.repository);

  @override
  Future<Either<Failure, User>> call(SignInParams params) async {
    return await repository.signIn(params);
  }
}

class SignInParams {
  final String email;
  final String password;
  const SignInParams({
    required this.email,
    required this.password,
  });
}
