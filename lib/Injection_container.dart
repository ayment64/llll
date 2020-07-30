import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:llll/Core/Platform/Network_info.dart';
import 'package:llll/Core/Presentation_logic/Utils/Input_checker.dart';
import 'package:llll/Core/Presentation_logic/Utils/register_input_cheker.dart';
import 'package:llll/Features/AssociateCategory/Data/DataSource/Associate_category_location_remaote_data_sourse.dart';
import 'package:llll/Features/AssociateCategory/Domain/UseCaces/Activate_location.dart';
import 'package:llll/Features/AssociateCategory/Domain/UseCaces/AssociatecatorSubCattolocation.dart';
import 'package:llll/Features/AssociateCategory/Presentation/bloc/associate_category_bloc.dart';
import 'package:llll/Features/Category/Data/DataSource/Category_remaote_data_sourse.dart';
import 'package:llll/Features/Category/Data/DataSource/Implementation/Category_remaote_data_sourse_impl.dart';
import 'package:llll/Features/Category/Domain/Repositories/Category_repository.dart';
import 'package:llll/Features/Category/Domain/UseCaces/Init_list_sub_category.dart';
import 'package:llll/Features/Category/Presentation/bloc/add_category_bloc.dart';
import 'package:llll/Features/My_team/Data/DataSource/Implementations/My_team_remote_data_source_impl.dart';
import 'package:llll/Features/My_team/Data/DataSource/My_team_remote_data_source.dart';
import 'package:llll/Features/My_team/Data/Repositories/My_team_repositories_impl.dart';
import 'package:llll/Features/My_team/Domain/Repositories/My_team_repository.dart';
import 'package:llll/Features/My_team/Domain/UseCaces/FindUser.dart';
import 'package:llll/Features/My_team/Domain/UseCaces/GetTeam.dart';
import 'package:llll/Features/My_team/Domain/UseCaces/Get_partner_locations.dart';
import 'package:llll/Features/My_team/Presentation/bloc/my_team_bloc.dart';
import 'package:llll/Features/Profile_submitting/Data/Repositories/Profile_repository_impl.dart';
import 'package:llll/Features/Profile_submitting/Domain/UseCaces/Show_profile.dart';
import 'package:llll/Features/Profile_submitting/Presentation/bloc/profile_submitting_bloc.dart';
import 'package:llll/Features/Sign_in/Data/Repositories/User_repository_impl.dart';
import 'package:llll/Features/Sign_in/Domain/UseCaces/Login.dart';
import 'package:llll/Features/Sign_in/Domain/UseCaces/Register.dart';
import 'package:llll/Features/Sign_in/Presentation/bloc/login_bloc.dart';
import 'package:llll/Features/maps/Data/DataSource/Implementations/Location_remote_data_source_impl.dart';
import 'package:llll/Features/maps/Domain/Repositories/Location_repository.dart';
import 'package:llll/Features/maps/Domain/UseCaces/Show_location.dart';
import 'Features/AssociateCategory/Data/DataSource/implementation/Associate_category_location_remaote_data_sourse_impl.dart';
import 'Features/AssociateCategory/Data/Repositories/Associate_category_location_repository_impl.dart';
import 'Features/AssociateCategory/Domain/Repositories/Associate_category_location_repository.dart';
import 'Features/AssociateCategory/Domain/UseCaces/Get_Category_location_partner.dart';
import 'Features/Category/Data/Repositories/Category_repository_Impl.dart';
import 'Features/Category/Domain/UseCaces/Init_list_category.dart';
import 'Features/Profile_submitting/Data/DataSource/Implementations/Profile_remote_data_source_impl.dart';
import 'Features/Profile_submitting/Data/DataSource/Profile_remote_data_source.dart';
import 'Features/Profile_submitting/Domain/Repositories/Profile_repository.dart';
import 'Features/Profile_submitting/Domain/UseCaces/Profile_editing.dart';
import 'Features/Sign_in/Data/DataSource/Implementations/User_remote_data_source_impl.dart';
import 'Features/Sign_in/Data/DataSource/User_remote_data_source.dart';
import 'Features/Sign_in/Domain/Repositories/User_Repository.dart';
import 'package:http/http.dart' as http;

import 'Features/home/Presentation/bloc/home_bloc.dart';
import 'Features/maps/Data/DataSource/Location_remote_data_source.dart';
import 'Features/maps/Data/Repositories/Location_repository_impl.dart';
import 'Features/maps/Presentation/bloc/maps_bloc.dart';
import 'package:llll/Features/maps/Domain/UseCaces/Add_location.dart';

final sl = GetIt.instance;

void init() {
  //* ---------------------------------  Features Sign in  ---------------------------------------------
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

  //! ----------------------------------------------------------------------------------------------
  //* ------------------------------------  Features Profiling   -----------------------------------------
  // ? Bloc
  sl.registerFactory(
      () => ProfileSubmittingBloc(showProfile: sl(), editProfile: sl()));
  // ? Usecases
  sl.registerLazySingleton(() => ShowProfile(sl()));
  sl.registerLazySingleton(() => ProfileEditing(sl()));

  // ? Repository
  sl.registerLazySingleton<ProfileRepository>(
      () => ProfileRepositoryImpl(remoteDataSource: sl(), networkInfo: sl()));
  // ? Data Sources
  sl.registerLazySingleton<ProfileRemaoteDataSourse>(
      () => ProfileRemoteDataSourceImpl(client: sl()));
  //! ----------------------------------------------------------------------------------------------
  //*-----------------------------------------  home  -----------------------------------------------------

  sl.registerFactory(() => HomeBloc());
  //! ----------------------------------------------------------------------------------------------
  //*-----------------------------------------  home  -----------------------------------------------------

  sl.registerFactory(() => AssociateCategoryBloc(
      showLocation: sl(),
      initListCategoryPartner: sl(),
      activatelocation: sl()));
  // ? Usescases
  sl.registerLazySingleton(
      () => InitListCategoryPartner(categoryRepositor: sl()));
  sl.registerLazySingleton(() => Activatelocation(categoryRepositor: sl()));
  sl.registerLazySingleton(
      () => AssociatecatorSubCattolocation(categoryRepositor: sl()));
  // ? Repositories
  sl.registerLazySingleton<AssociateCategoryLocationRepository>(() =>
      AssociateCategoryLocationRepositoryImpl(
          networkInfo: sl(), remoteDataSource: sl()));
  // ? Data source
  sl.registerLazySingleton<AssociateCategoryLocationRemaoteDataSourse>(
      () => AssociateCategoryLocationRemaoteDataSourseImpl(client: sl()));
  //! ----------------------------------------------------------------------------------------------

  //*-----------------------------------------  maps  -----------------------------------------------------
  sl.registerFactory(() => MapsBloc(addLocation: sl(), showLocation: sl()));
  // ? Usescases
  sl.registerLazySingleton(() => AddLocation(locationRepository: sl()));
  sl.registerLazySingleton(() => ShowLocation(locationRepository: sl()));
  // ? Repositories
  sl.registerLazySingleton<LocationRepository>(
      () => MapRepositoryImpl(networkInfo: sl(), remoteDataSource: sl()));
  // ? Data source
  sl.registerLazySingleton<LocationRemaoteDataSourse>(
      () => LocationRemoteDataSourceImpl(client: sl()));
  //! ----------------------------------------------------------------------------------------------
  //* --------------------------------------- Category ----------------------------------------------------
  // ? Bloc
  sl.registerFactory(() => AddCategoryBloc(
      initListCategory: sl(),
      initListSubCategory: sl(),
      associatecatorSubCattolocation: sl()));
  // ? Use cases
  sl.registerLazySingleton(() => InitListCategory(categoryRepositor: sl()));
  sl.registerLazySingleton(() => InitListSubCategory(categoryRepositor: sl()));

  // ? Repository
  sl.registerLazySingleton<CategoryRepository>(
      () => CategoryRepositoryImpl(remoteDataSource: sl(), networkInfo: sl()));
  // ? Data sources
  sl.registerLazySingleton<CategoryRemaoteDataSourse>(
      () => CategoryRemaoteDataSourseimpl(client: sl()));
  //! ----------------------------------------------------------------------------------------------
  //* --------------------------------------- Category ----------------------------------------------------
  // ? Bloc
  sl.registerFactory(() =>
      MyTeamBloc(findUser: sl(), getTeam: sl(), getPartnerLocations: sl()));
  // ? UseCases
  sl.registerFactory(() => GetPartnerLocations(categoryRepositor: sl()));
  sl.registerLazySingleton(() => FindUser(categoryRepositor: sl()));
  sl.registerLazySingleton(() => GetTeam(categoryRepositor: sl()));
  // ? Repository
  sl.registerLazySingleton<MyTeamRepository>(() => MyTeamRepositoryImpl(
        remoteDataSource: sl(),
        networkInfo: sl(),
      ));
  // ? Data sources
  sl.registerLazySingleton<MyTeamRemoteDataSource>(
      () => MyTeamRemoteDataSourceImpl(client: sl()));

  //! ----------------------------------------------------------------------------------------------
  //! ---------------------------------------------------getTeamParams------------------------------
  //! ----------------------------------------------------------------------------------------------
  //*-----------------------------------------  core  -----------------------------------------------------
  sl.registerLazySingleton(() => InputChecker());
  sl.registerLazySingleton(() => RegisterInputChecker());
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  //! ----------------------------------------------------------------------------------------------
  //! ----------------------------------------------------------------------------------------------
  //! ----------------------------------------------------------------------------------------------
  //*--------------------------------------- External  ----------------------------------------------------
  sl.registerLazySingleton(() => DataConnectionChecker());
  sl.registerLazySingleton(() => http.Client());
}
