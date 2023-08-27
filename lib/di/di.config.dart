// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:base_bloc/base_bloc.dart' as _i4;
import 'package:botanic_gaze/data_source/app_api_service.dart' as _i15;
import 'package:botanic_gaze/data_source/clients/random_user_api_client.dart'
    as _i10;
import 'package:botanic_gaze/features/camera/bloc/analysis_image/analysis_image_bloc.dart'
    as _i3;
import 'package:botanic_gaze/features/camera/bloc/camera/camera_bloc.dart'
    as _i6;
import 'package:botanic_gaze/features/diagnosis/bloc/diagnosis_bloc.dart'
    as _i7;
import 'package:botanic_gaze/features/explore/bloc/explore_bloc.dart' as _i8;
import 'package:botanic_gaze/features/login/bloc/login_bloc.dart' as _i9;
import 'package:botanic_gaze/features/profile/bloc/profile_bloc.dart' as _i11;
import 'package:botanic_gaze/features/search_plants/bloc/search_plants_bloc.dart'
    as _i12;
import 'package:botanic_gaze/features/search_tab/bloc/search_tab_bloc.dart'
    as _i13;
import 'package:botanic_gaze/features/splash/bloc/splash_bloc.dart' as _i14;
import 'package:botanic_gaze/navigation/app_navigator.dart' as _i5;
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
    gh.factory<_i3.AnalysisImageBloc>(() => _i3.AnalysisImageBloc());
    gh.lazySingleton<_i4.AppNavigator>(() => _i5.AppNavigatorImpl());
    gh.factory<_i6.CameraBloc>(() => _i6.CameraBloc());
    gh.factory<_i7.DiagnosisBloc>(() => _i7.DiagnosisBloc());
    gh.factory<_i8.ExploreBloc>(() => _i8.ExploreBloc());
    gh.factory<_i9.LoginBloc>(() => _i9.LoginBloc());
    gh.lazySingleton<_i10.PlantApiClient>(() => _i10.PlantApiClient());
    gh.factory<_i11.ProfileBloc>(() => _i11.ProfileBloc());
    gh.factory<_i12.SearchPlantsBloc>(() => _i12.SearchPlantsBloc());
    gh.factory<_i13.SearchTabBloc>(() => _i13.SearchTabBloc());
    gh.factory<_i14.SplashBloc>(() => _i14.SplashBloc());
    gh.lazySingleton<_i15.AppApiService>(
        () => _i15.AppApiService(gh<_i10.PlantApiClient>()));
    return this;
  }
}
