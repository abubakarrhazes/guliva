import 'package:dartz/dartz.dart';
import 'package:guliva/core/error/failures.dart';
import 'package:guliva/core/usecases/usecase.dart';
import 'package:guliva/features/auth/domain/entities/user_entity.dart';
import 'package:guliva/features/auth/domain/repo/auth_repo.dart';

class SignUpUseCase implements UseCase<UserEntity, SignUpParams> {
  final AuthRepo repository;
  SignUpUseCase(this.repository);

  @override
  Future<Either<Failure, UserEntity>> call(SignUpParams params) async {
    return await repository.signUp(params);
  }
}

class SignUpParams {
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String dob;
  final String phoneNo;
  final bool? withEmail;
  const SignUpParams({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.phoneNo,
    required this.dob,
    this.withEmail,
  });

  Map<String, dynamic> toJson() => {
        'firstName': firstName,
        'lastName': lastName,
        'phoneNo': phoneNo,
        'email': email,
        'dob': dob,
        'password': password,
        'withEmail': withEmail,
      };
}
