// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:guliva/core/error/failures.dart';
import 'package:guliva/core/network/network_info.dart';
import 'package:guliva/core/usecases/usecase.dart';
import 'package:guliva/features/auth/data/models/response_model.dart';
import 'package:guliva/features/auth/data/models/user_model.dart';
import 'package:guliva/features/auth/data/source/local/auth_local_source.dart';
import 'package:guliva/features/auth/data/source/remote/auth_remote_source.dart';
import 'package:guliva/features/auth/domain/entities/user_entity.dart';
import 'package:guliva/features/auth/domain/repo/auth_repo.dart';
import 'package:guliva/features/auth/domain/usecase/sign_in_usecase.dart';
import 'package:guliva/features/auth/domain/usecase/sign_up_usecase.dart';

typedef _DataSourceChooser = Future<UserModel> Function();

class AuthRepoImpl implements AuthRepo {
  final AuthRemoteSource authRemoteSource;
  final AuthLocalSource authLocalSource;
  final NetworkInfo networkInfo;

  AuthRepoImpl(
      {required this.authRemoteSource,
      required this.authLocalSource,
      required this.networkInfo});
  @override
  Future<Either<Failure, UserEntity>> getCachedUser() async {
    // TODO: implement getCachedUser
    try {
      final user = await authLocalSource.getUser();
      return Right(user);
    } on CacheFailure {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signIn(SignInParams params) async {
    return await _authenticate(() {
      return authRemoteSource.signIn(params);
    });
  }

  @override
  Future<Either<Failure, NoParams>> signOut() async {
    // TODO: implement signOut
    try {
      await authLocalSource.clearCache();
      return Right(NoParams());
    } on CacheFailure {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signUp(SignUpParams params) async {
    // TODO: implement signUp
    return await _authenticate(() {
      return authRemoteSource.signUp(params);
    });
  }

  Future<Either<Failure, UserEntity>> _authenticate(
    _DataSourceChooser getDataSource,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteResponse = await getDataSource();
        authLocalSource.saveToken(remoteResponse.token);
        authLocalSource.saveUser(remoteResponse);
        return Right(remoteResponse);
      } on Failure catch (failure) {
        return Left(failure);
      }
    } else {
      return Left(NetworkFailure());
    }
  }
}
