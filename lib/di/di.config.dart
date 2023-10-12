// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:base_bloc/base_bloc.dart' as _i5;
import 'package:botanic_gaze/app/bloc/app_bloc.dart' as _i4;
import 'package:botanic_gaze/data_source/app_api_service.dart' as _i20;
import 'package:botanic_gaze/data_source/clients/random_user_api_client.dart'
    as _i13;
import 'package:botanic_gaze/features/camera/bloc/analysis_image/analysis_image_bloc.dart'
    as _i3;
import 'package:botanic_gaze/features/camera/bloc/camera/camera_bloc.dart'
    as _i7;
import 'package:botanic_gaze/features/diagnosis/bloc/diagnosis_bloc.dart'
    as _i8;
import 'package:botanic_gaze/features/explore/bloc/explore_bloc.dart' as _i9;
import 'package:botanic_gaze/features/explore/bloc/popular_plant_detail/popular_plant_detail_bloc.dart'
    as _i15;
import 'package:botanic_gaze/features/login/bloc/login_bloc.dart' as _i12;
import 'package:botanic_gaze/features/plant_detail/bloc/bloc/plant_detail_bloc.dart'
    as _i14;
import 'package:botanic_gaze/features/profile/bloc/profile_bloc.dart' as _i16;
import 'package:botanic_gaze/features/search_plants/bloc/search_plants/search_plants_bloc.dart'
    as _i17;
import 'package:botanic_gaze/features/search_plants/bloc/search_plants_filter/search_plants_filter_bloc.dart'
    as _i18;
import 'package:botanic_gaze/features/search_tab/bloc/search_tab_bloc.dart'
    as _i19;
import 'package:botanic_gaze/navigation/app_navigator.dart' as _i6;
import 'package:botanic_gaze/services/local_push_notification_service.dart'
    as _i10;
import 'package:botanic_gaze/services/location_service.dart' as _i11;
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
    gh.lazySingleton<_i4.AppBloc>(() => _i4.AppBloc());
    gh.lazySingleton<_i5.AppNavigator>(() => _i6.AppNavigatorImpl());
    gh.factory<_i7.CameraBloc>(() => _i7.CameraBloc());
    gh.factory<_i8.DiagnosisBloc>(() => _i8.DiagnosisBloc());
    gh.factory<_i9.ExploreBloc>(() => _i9.ExploreBloc());
    gh.lazySingleton<_i10.LocalPushNotificationService>(
        () => _i10.LocalPushNotificationService());
    gh.factory<_i11.LocationService>(() => _i11.LocationService());
    gh.factory<_i12.LoginBloc>(() => _i12.LoginBloc());
    gh.lazySingleton<_i13.PlantApiClient>(() => _i13.PlantApiClient());
    gh.factory<_i14.PlantDetailBloc>(() => _i14.PlantDetailBloc());
    gh.factory<_i15.PopularPlantListDetailBloc>(
        () => _i15.PopularPlantListDetailBloc());
    gh.lazySingleton<_i16.ProfileBloc>(() => _i16.ProfileBloc());
    gh.factory<_i17.SearchPlantsBloc>(() => _i17.SearchPlantsBloc());
    gh.factory<_i18.SearchPlantsFilterBloc>(
        () => _i18.SearchPlantsFilterBloc());
    gh.factory<_i19.SearchTabBloc>(() => _i19.SearchTabBloc());
    gh.lazySingleton<_i20.AppApiService>(
        () => _i20.AppApiService(gh<_i13.PlantApiClient>()));
    return this;
  }
}
