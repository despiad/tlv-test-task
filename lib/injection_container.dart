import 'package:get_it/get_it.dart';
import 'package:graphql/client.dart';

import 'infrastructure/api/graphql_api.dart';
import 'infrastructure/datasources/mission_remote_datasource.dart';
import 'infrastructure/repositories/mission_repository.dart';
import 'presentation/bloc/search_bloc.dart';

final sl = GetIt.instance;

void setup() {
  // Clients
  sl.registerSingleton<GraphQLClient>(Config().setup());

  // DataSources
  sl.registerLazySingleton(() => MissionRemoteDataSource(sl()));

  // Repositories
  sl.registerLazySingleton(() => MissionRepository(sl()));

  // Blocs/Cubits
  sl.registerFactory(() => SearchBloc(sl()));
}
