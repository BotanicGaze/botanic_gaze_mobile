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
import 'package:botanic_gaze/data_source/app_api_service.dart' as _i25;
import 'package:botanic_gaze/data_source/app_api_service_impl.dart' as _i26;
import 'package:botanic_gaze/data_source/clients/plant_api_client.dart' as _i18;
import 'package:botanic_gaze/features/camera/bloc/analysis_image/analysis_image_bloc.dart'
    as _i3;
import 'package:botanic_gaze/features/camera/bloc/camera/camera_bloc.dart'
    as _i8;
import 'package:botanic_gaze/features/diagnosis/bloc/diagnosis_bloc.dart'
    as _i9;
import 'package:botanic_gaze/features/explore/bloc/explore_bloc.dart' as _i10;
import 'package:botanic_gaze/features/explore/bloc/popular_plant_detail/popular_plant_detail_bloc.dart'
    as _i20;
import 'package:botanic_gaze/features/feedback/bloc/feedback_bloc.dart' as _i11;
import 'package:botanic_gaze/features/login/bloc/login_bloc.dart' as _i15;
import 'package:botanic_gaze/features/my_garden/bloc/my_garden_bloc.dart'
    as _i16;
import 'package:botanic_gaze/features/my_garden/bloc/my_plant_detail/my_plant_detail_bloc.dart'
    as _i17;
import 'package:botanic_gaze/features/plant_detail/bloc/bloc/plant_detail_bloc.dart'
    as _i19;
import 'package:botanic_gaze/features/profile/bloc/profile_bloc.dart' as _i21;
import 'package:botanic_gaze/features/search_plants/bloc/search_plants/search_plants_bloc.dart'
    as _i22;
import 'package:botanic_gaze/features/search_plants/bloc/search_plants_filter/search_plants_filter_bloc.dart'
    as _i23;
import 'package:botanic_gaze/features/search_tab/bloc/search_tab_bloc.dart'
    as _i24;
import 'package:botanic_gaze/navigation/app_navigator.dart' as _i6;
import 'package:botanic_gaze/services/appsflyer_config.dart' as _i7;
import 'package:botanic_gaze/services/global_callback.dart' as _i12;
import 'package:botanic_gaze/services/local_push_notification_service.dart'
    as _i13;
import 'package:botanic_gaze/services/location_service.dart' as _i14;
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
    gh.lazySingleton<_i7.AppsflyerConfig>(() => _i7.AppsflyerConfig());
    gh.factory<_i8.CameraBloc>(() => _i8.CameraBloc());
    gh.factory<_i9.DiagnosisBloc>(() => _i9.DiagnosisBloc());
    gh.factory<_i10.ExploreBloc>(() => _i10.ExploreBloc());
    gh.factory<_i11.FeedbackBloc>(() => _i11.FeedbackBloc());
    gh.lazySingleton<_i12.GlobalCallback>(() => _i12.GlobalCallback());
    gh.lazySingleton<_i13.LocalPushNotificationService>(
        () => _i13.LocalPushNotificationService());
    gh.factory<_i14.LocationService>(() => _i14.LocationService());
    gh.factory<_i15.LoginBloc>(() => _i15.LoginBloc());
    gh.factory<_i16.MyGardenBloc>(() => _i16.MyGardenBloc());
    gh.factory<_i17.MyPlantDetailBloc>(() => _i17.MyPlantDetailBloc());
    gh.lazySingleton<_i18.PlantApiClient>(() => _i18.PlantApiClient());
    gh.factory<_i19.PlantDetailBloc>(() => _i19.PlantDetailBloc());
    gh.factory<_i20.PopularPlantListDetailBloc>(
        () => _i20.PopularPlantListDetailBloc());
    gh.lazySingleton<_i21.ProfileBloc>(() => _i21.ProfileBloc());
    gh.factory<_i22.SearchPlantsBloc>(() => _i22.SearchPlantsBloc());
    gh.factory<_i23.SearchPlantsFilterBloc>(
        () => _i23.SearchPlantsFilterBloc());
    gh.factory<_i24.SearchTabBloc>(() => _i24.SearchTabBloc());
    gh.lazySingleton<_i25.AppApiService>(
        () => _i26.AppApiServiceImpl(gh<_i18.PlantApiClient>()));
    return this;
  }
}
