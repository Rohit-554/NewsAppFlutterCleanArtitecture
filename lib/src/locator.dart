import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:awesome_dio_interceptor/awesome_dio_interceptor.dart';

import 'data/datasources/local/app_database.dart';
import 'data/datasources/remote/news_api_service.dart';
import 'data/repositories/api_repository_impl.dart';
import 'data/repositories/database_repository_impl.dart';
import 'domain/repositories/api_repository.dart';
import 'domain/repositories/database_repository.dart';

final locator = GetIt.instance;
Future<void> setupLocator() async {
  //for local database
  final db = await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  locator.registerSingleton<AppDatabase>(db);

  //for local repository
  locator.registerSingleton<DatabaseRepository>(
    DatabaseRespositoryImpl(locator.get<AppDatabase>()),
  );

  final dio = Dio();
  dio.interceptors.add(AwesomeDioInterceptor());
  locator.registerSingleton<Dio>(dio);
  locator.registerSingleton<NewsApiService>(
    NewsApiService(locator.get<Dio>()),
  );
  locator.registerSingleton<ApiRepository>(
    ApiRepositoryImpl(locator.get<NewsApiService>()),
  );
}
