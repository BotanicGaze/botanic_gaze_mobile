// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:base_network/src/app_preferences.dart' as _i4;
import 'package:base_network/src/repository/mapper/base_error_response_mapper/firebase_storage_error_response_mapper.dart'
    as _i8;
import 'package:base_network/src/repository/mapper/base_error_response_mapper/goong_error_response_mapper.dart'
    as _i9;
import 'package:base_network/src/repository/mapper/base_error_response_mapper/json_array_error_response_mapper.dart'
    as _i12;
import 'package:base_network/src/repository/mapper/base_error_response_mapper/json_object_error_response_mapper.dart'
    as _i14;
import 'package:base_network/src/repository/mapper/base_error_response_mapper/line_error_response_mapper.dart'
    as _i16;
import 'package:base_network/src/repository/mapper/base_error_response_mapper/twitter_error_response_mapper.dart'
    as _i25;
import 'package:base_network/src/repository/mapper/base_success_response_mapper/data_json_array_response_mapper.dart'
    as _i6;
import 'package:base_network/src/repository/mapper/base_success_response_mapper/data_json_object_reponse_mapper.dart'
    as _i7;
import 'package:base_network/src/repository/mapper/base_success_response_mapper/json_array_response_mapper.dart'
    as _i13;
import 'package:base_network/src/repository/mapper/base_success_response_mapper/json_object_reponse_mapper.dart'
    as _i15;
import 'package:base_network/src/repository/mapper/base_success_response_mapper/records_json_array_response_mapper.dart'
    as _i20;
import 'package:base_network/src/repository/mapper/base_success_response_mapper/results_json_array_response_mapper.dart'
    as _i24;
import 'package:base_network/src/repository/mapper/notification_data_mapper.dart'
    as _i18;
import 'package:base_network/src/repository/source/api/client/auth_app_server_api_client.dart'
    as _i26;
import 'package:base_network/src/repository/source/api/client/none_auth_app_server_api_client.dart'
    as _i17;
import 'package:base_network/src/repository/source/api/client/raw_api_client.dart'
    as _i19;
import 'package:base_network/src/repository/source/api/client/refresh_token_api_client.dart'
    as _i21;
import 'package:base_network/src/repository/source/api/middleware/access_token_interceptor.dart'
    as _i3;
import 'package:base_network/src/repository/source/api/middleware/connectivity_interceptor.dart'
    as _i5;
import 'package:base_network/src/repository/source/api/middleware/header_interceptor.dart'
    as _i10;
import 'package:base_network/src/repository/source/api/middleware/refresh_token_interceptor.dart'
    as _i22;
import 'package:base_network/src/repository/source/api/refresh_token_api_service.dart'
    as _i23;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared/shared.dart' as _i11;

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
    gh.factory<_i3.AccessTokenInterceptor>(
        () => _i3.AccessTokenInterceptor(gh<_i4.AppPreferences>()));
    gh.factory<_i5.ConnectivityInterceptor>(
        () => _i5.ConnectivityInterceptor());
    gh.factory<_i6.DataJsonArrayResponseMapper<dynamic>>(
        () => _i6.DataJsonArrayResponseMapper<dynamic>());
    gh.factory<_i7.DataJsonObjectResponseMapper<dynamic>>(
        () => _i7.DataJsonObjectResponseMapper<dynamic>());
    gh.factory<_i8.FirebaseStorageErrorResponseMapper>(
        () => _i8.FirebaseStorageErrorResponseMapper());
    gh.factory<_i9.GoongErrorResponseMapper>(
        () => _i9.GoongErrorResponseMapper());
    gh.factory<_i10.HeaderInterceptor>(
        () => _i10.HeaderInterceptor(gh<_i11.AppInfo>()));
    gh.factory<_i12.JsonArrayErrorResponseMapper>(
        () => _i12.JsonArrayErrorResponseMapper());
    gh.factory<_i13.JsonArrayResponseMapper<dynamic>>(
        () => _i13.JsonArrayResponseMapper<dynamic>());
    gh.factory<_i14.JsonObjectErrorResponseMapper>(
        () => _i14.JsonObjectErrorResponseMapper());
    gh.factory<_i15.JsonObjectResponseMapper<dynamic>>(
        () => _i15.JsonObjectResponseMapper<dynamic>());
    gh.factory<_i16.LineErrorResponseMapper>(
        () => _i16.LineErrorResponseMapper());
    gh.lazySingleton<_i17.NoneAuthAppServerApiClient>(
        () => _i17.NoneAuthAppServerApiClient(
              baseUrl: gh<String>(),
              headerInterceptor: gh<_i10.HeaderInterceptor>(),
            ));
    gh.factory<_i18.NotificationDataMapper>(
        () => _i18.NotificationDataMapper());
    gh.lazySingleton<_i19.RawApiClient>(
        () => _i19.RawApiClient(baseUrl: gh<String>()));
    gh.factory<_i20.RecordsJsonArrayResponseMapper<dynamic>>(
        () => _i20.RecordsJsonArrayResponseMapper<dynamic>());
    gh.lazySingleton<_i21.RefreshTokenApiClient>(
        () => _i21.RefreshTokenApiClient(
              gh<String>(),
              gh<_i10.HeaderInterceptor>(),
              gh<_i3.AccessTokenInterceptor>(),
            ));
    gh.factory<_i22.RefreshTokenInterceptor>(() => _i22.RefreshTokenInterceptor(
          gh<_i4.AppPreferences>(),
          gh<_i23.RefreshTokenApiService<dynamic>>(),
          gh<_i17.NoneAuthAppServerApiClient>(),
        ));
    gh.factory<_i24.ResultsJsonArrayResponseMapper<dynamic>>(
        () => _i24.ResultsJsonArrayResponseMapper<dynamic>());
    gh.factory<_i25.TwitterErrorResponseMapper>(
        () => _i25.TwitterErrorResponseMapper());
    gh.lazySingleton<_i26.AuthAppServerApiClient>(
        () => _i26.AuthAppServerApiClient(
              gh<String>(),
              gh<_i10.HeaderInterceptor>(),
              gh<_i3.AccessTokenInterceptor>(),
              gh<_i22.RefreshTokenInterceptor>(),
            ));
    return this;
  }
}
