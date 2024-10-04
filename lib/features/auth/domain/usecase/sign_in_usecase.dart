import 'package:dartz/dartz.dart';
import 'package:guliva/features/auth/domain/entities/user_entity.dart';
import 'package:guliva/features/auth/domain/repo/auth_repo.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/usecases/usecase.dart';

class SignInUseCase implements UseCase<UserEntity, SignInParams> {
  final AuthRepo repository;
  SignInUseCase(this.repository);

  @override
  Future<Either<Failure, UserEntity>> call(SignInParams params) async {
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

  Map<String, dynamic> toJson() => {
        'email': email,
        'password': password,
      };
}
