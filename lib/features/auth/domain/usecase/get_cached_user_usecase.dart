import 'package:dartz/dartz.dart';
import 'package:guliva/features/auth/domain/entities/user.dart';
import 'package:guliva/features/auth/domain/repo/auth_repo.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/usecases/usecase.dart';


class GetCachedUserUseCase implements UseCase<User, NoParams> {
  final AuthRepo repository;
  GetCachedUserUseCase(this.repository);

  @override
  Future<Either<Failure, User>> call(NoParams params) async {
    return await repository.getCachedUser();
  }
}
