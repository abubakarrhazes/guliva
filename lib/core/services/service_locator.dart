import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:guliva/core/network/network_info.dart';
import 'package:guliva/features/auth/data/repo/auth_repo_impl.dart';
import 'package:guliva/features/auth/data/source/local/auth_local_source.dart';
import 'package:guliva/features/auth/data/source/remote/auth_remote_source.dart';
import 'package:guliva/features/auth/domain/repo/auth_repo.dart';
import 'package:guliva/features/auth/domain/usecase/get_cached_user_usecase.dart';
import 'package:guliva/features/auth/domain/usecase/sign_in_usecase.dart';
import 'package:guliva/features/auth/domain/usecase/sign_out_usecase.dart';
import 'package:guliva/features/auth/domain/usecase/sign_up_usecase.dart';
import 'package:guliva/features/auth/presentation/bloc/user_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> init() async {
  //Features - User
  // Bloc
  sl.registerFactory(
    () => UserBloc(sl(), sl(), sl(), sl()),
  );
  // Use cases
  sl.registerLazySingleton(() => GetCachedUserUseCase(sl()));
  sl.registerLazySingleton(() => SignInUseCase(sl()));
  sl.registerLazySingleton(() => SignUpUseCase(sl()));
  sl.registerLazySingleton(() => SignOutUseCase(sl()));
  // Repository
  sl.registerLazySingleton<AuthRepo>(() => AuthRepoImpl(
      authRemoteSource: sl(), authLocalSource: sl(), networkInfo: sl()));
  // Data sources
  sl.registerLazySingleton<AuthLocalSource>(
    () => AuthLocalSourceImpl(sharedPreferences: sl(), secureStorage: sl()),
  );
  sl.registerLazySingleton<AuthRemoteSource>(
    () => AuthRemoteSourceImpl(client: sl()),
  );
   // Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  ///! External
  final sharedPreferences = await SharedPreferences.getInstance();
  const secureStorage = FlutterSecureStorage();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => secureStorage);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
