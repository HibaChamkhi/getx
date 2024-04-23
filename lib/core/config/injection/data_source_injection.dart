import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../../../data/dataSources/remote/user_data_source.dart';

@module
abstract class DataSourceInjectableModule {
  UserDataSource getUserDataSource(Dio dio) => UserDataSource(dio);
// Add more data dources as needed
}
