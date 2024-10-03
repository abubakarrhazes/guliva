import 'package:dartz/dartz.dart';
import 'package:guliva/features/auth/domain/repo/auth_repo.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/usecases/usecase.dart';

class SignOutUseCase implements UseCase<NoParams, NoParams> {
  final AuthRepo repository;
  SignOutUseCase(this.repository);

  @override
  Future<Either<Failure, NoParams>> call(NoParams params) async {
    return await repository.signOut();
  }
}
