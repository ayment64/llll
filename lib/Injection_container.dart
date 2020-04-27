import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:llll/Core/Platform/Network_info.dart';
import 'package:llll/Core/Presentation_logic/Utils/Input_checker.dart';
import 'package:llll/Core/Presentation_logic/Utils/register_input_cheker.dart';
import 'package:llll/Features/Sign_in/Data/Repositories/User_repository_impl.dart';
import 'package:llll/Features/Sign_in/Domain/UseCaces/Login.dart';
import 'package:llll/Features/Sign_in/Domain/UseCaces/Register.dart';
import 'package:llll/Features/Sign_in/Presentation/bloc/login_bloc.dart';
import 'Features/Sign_in/Data/DataSource/Implementations/User_remote_data_source_impl.dart';
import 'Features/Sign_in/Data/DataSource/User_remote_data_source.dart';
import 'Features/Sign_in/Domain/Repositories/User_Repository.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

void init() {
  //* Features - Sign in
  // ? Bloc
  sl.registerFactory(() => LoginBloc(
        login: sl(),
        inputChecker: sl(),
        register: sl(),
        registerInputChecker: sl(),
      ));
  // ? Use cases
  sl.registerLazySingleton(() => Login(sl()));
  sl.registerLazySingleton(() => Register(sl()));
  // ? Repository
  sl.registerLazySingleton<UserRepository>(
      () => UserRepositoryImpl(remoteDataSource: sl(), networkInfo: sl()));
  // ? Data sources
  sl.registerLazySingleton<UserRemoteDataSource>(
      () => UserRemoteDataSourceImpl(client: sl()));

  //* core
  sl.registerLazySingleton(() => InputChecker());
  sl.registerLazySingleton(() => RegisterInputChecker());
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  //* External
  sl.registerLazySingleton(() => DataConnectionChecker());
  sl.registerLazySingleton(() => http.Client());
}
