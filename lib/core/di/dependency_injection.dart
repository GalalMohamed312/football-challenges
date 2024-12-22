import 'package:dio/dio.dart';
import 'package:foot/features/password_challenge/data/data_source/password_challenge_data_source.dart';
import 'package:foot/features/password_challenge/data/data_source/password_challenge_local_data_source.dart';
import 'package:foot/features/password_challenge/logic/password_challenge_cubit.dart';

import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../networking/dio_factory.dart';



final getIt = GetIt.instance;

Future<void> setupDI() async {

  final supabase = Supabase.instance.client;
  getIt.registerSingleton(PasswordChallengeDataSource(supabase));
  getIt.registerSingleton(PasswordChallengeLocalDataSource());
  getIt.registerFactory(() => PasswordChallengeCubit(getIt<PasswordChallengeDataSource>(),getIt<PasswordChallengeLocalDataSource>()));
  // Dio & ApiService
  // Dio dio = DioFactory.getDio();
  // getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // login
  // getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  // getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));


  // home
  // getIt.registerLazySingleton<HomeApiService>(() => HomeApiService(dio));
  // getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(getIt()));
}
