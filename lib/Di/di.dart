import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:vista_movie/data/datasource/auth_datasource.dart';

var locator = GetIt.instance;

Future<void> getItInit() async {
  locator.registerSingleton<Dio>(
      Dio(BaseOptions(baseUrl: "https://vista.chbk.run/api/")));

//datasources

  locator
      .registerFactory<IAuthanticationDataSource>(() => AuthenticationRemote());
}
