// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i8;
import 'package:get_it/get_it.dart' as _i1;
import 'package:getx_project/core/config/injection/register_module.dart' as _i9;
import 'package:getx_project/core/config/router/app_router.dart' as _i3;
import 'package:getx_project/data/dataSources/remote/supabase_data_source.dart'
    as _i5;
import 'package:getx_project/data/repositories/user_repository_impl.dart'
    as _i7;
import 'package:getx_project/domain/repositories/user_repository.dart' as _i6;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i4;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.singleton<_i3.AppRouter>(() => _i3.AppRouter());
    await gh.factoryAsync<_i4.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true,
    );
    gh.factory<_i5.UserDataSource>(() => _i5.RemoteDataSourceImpl());
    gh.factory<_i6.UserRepository>(
        () => _i7.UserRepositoryImpl(gh<_i5.UserDataSource>()));
    gh.lazySingleton<_i8.Dio>(
        () => registerModule.dio(gh<_i4.SharedPreferences>()));
    return this;
  }
}

class _$RegisterModule extends _i9.RegisterModule {}
