import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'core/common/app_user/app_user_cubit.dart';
import 'feature/auth/data/datasources/auth_remote_data_source.dart';
import 'feature/auth/data/repository/auth_repository_impl.dart';
import 'feature/auth/domain/repository/auth_repository.dart';
import 'feature/auth/domain/usecase/current_user.dart';
import 'feature/auth/domain/usecase/log_in_usecase.dart';
import 'feature/auth/domain/usecase/sign_up_usecase.dart';
import 'feature/auth/presentation/bloc/auth_bloc.dart';
import 'firebase_options.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;
Future<void> initDependencies () async {
  _initAuth();
  //_initNews();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  sl.registerLazySingleton(() => FirebaseAuth.instance);
  sl.registerLazySingleton(() => http.Client());

  // core
  sl.registerLazySingleton(() => AppUserCubit());
}

void _initAuth(){
  // data source
  sl.registerFactory<AuthRemoteDataSource>(() => AuthRemoteDataSourceImpl(
    firebaseAuth: sl(),
  ));

  //repository

  sl.registerFactory<AuthRepository>(() => AuthRepositoryImpl(
      sl()
  ));

  // use case
  sl.registerFactory(() => UserSignUp(
      sl())
  );
  sl.registerFactory(() => UserLogIn(
      sl()));
  sl.registerFactory(() => CurrentUser(
      sl()));

  // bloc
  sl.registerLazySingleton(() => AuthBloc(
      userSignUp : sl(),
      userLogIn: sl(),
      currentUser: sl(),
      appUserCubit: sl()
  ));
}

// void _initNews (){
//   //datasource
//   sl.registerFactory(() =>
//       NewsRemoteDataSource(sl()));
//   sl.registerFactory(() =>
//       NewsLocalDataSource()..init()
//   );
//   sl.registerFactory(() =>
//       ConnectivityHelper()
//   );
//
//   //repository
//   sl.registerFactory<NewsRepository>(() =>
//       NewsRepositoryImpl(
//           sl(),
//           sl(),
//           sl(),
//       ));
//

//   //use case
//
//   sl.registerFactory(() =>
//       GetNews(sl()));
//
//
//   //bloc
//   sl.registerLazySingleton(() => NewsBloc(
//       getNews: sl()
//
//
//   ));
//
// }
