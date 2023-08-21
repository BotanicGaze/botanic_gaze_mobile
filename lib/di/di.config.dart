// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:base_bloc/base_bloc.dart' as _i3;
import 'package:botanic_gaze/data_source/app_api_service.dart' as _i13;
import 'package:botanic_gaze/data_source/clients/random_user_api_client.dart'
    as _i8;
import 'package:botanic_gaze/features/diagnosis/bloc/diagnosis_bloc.dart'
    as _i5;
import 'package:botanic_gaze/features/explore/bloc/explore_bloc.dart' as _i6;
import 'package:botanic_gaze/features/login/bloc/login_bloc.dart' as _i7;
import 'package:botanic_gaze/features/profile/bloc/profile_bloc.dart' as _i9;
import 'package:botanic_gaze/features/scan/bloc/scan_bloc.dart' as _i10;
import 'package:botanic_gaze/features/search/bloc/search_bloc.dart' as _i11;
import 'package:botanic_gaze/features/search_tab/bloc/search_tab_bloc.dart'
    as _i12;
import 'package:botanic_gaze/navigation/app_navigator.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i3.AppNavigator>(() => _i4.AppNavigatorImpl());
    gh.factory<_i5.DiagnosisBloc>(() => _i5.DiagnosisBloc());
    gh.factory<_i6.ExploreBloc>(() => _i6.ExploreBloc());
    gh.factory<_i7.LoginBloc>(() => _i7.LoginBloc());
    gh.lazySingleton<_i8.PlantApiClient>(() => _i8.PlantApiClient());
    gh.factory<_i9.ProfileBloc>(() => _i9.ProfileBloc());
    gh.factory<_i10.ScanBloc>(() => _i10.ScanBloc());
    gh.factory<_i11.SearchBloc>(() => _i11.SearchBloc());
    gh.factory<_i12.SearchTabBloc>(() => _i12.SearchTabBloc());
    gh.lazySingleton<_i13.AppApiService>(
        () => _i13.AppApiService(gh<_i8.PlantApiClient>()));
    return this;
  }
}
