import 'package:base_bloc/l10n/l10n.dart';
import 'package:shared/shared.dart';

class ExceptionMessageMapper {
  const ExceptionMessageMapper();

  String map(AppException appException) {
    switch (appException.appExceptionType) {
      case AppExceptionType.remote:
        final exception = appException as RemoteException;
        switch (exception.kind) {
          case RemoteExceptionKind.badCertificate:
            return BaseBlocLocalization.current.badCertificateException;
          case RemoteExceptionKind.noInternet:
            return BaseBlocLocalization.current.noInternetException;
          case RemoteExceptionKind.network:
            return BaseBlocLocalization.current.canNotConnectToHost;
          case RemoteExceptionKind.serverDefined:
            return exception.generalServerMessage ??
                BaseBlocLocalization.current.unknownException;
          case RemoteExceptionKind.serverUndefined:
            return exception.generalServerMessage ??
                BaseBlocLocalization.current.unknownException;
          case RemoteExceptionKind.timeout:
            return BaseBlocLocalization.current.timeoutException;
          case RemoteExceptionKind.cancellation:
            return BaseBlocLocalization.current.cancellationException;
          case RemoteExceptionKind.unknown:
            return '${BaseBlocLocalization.current.unknownException}: ${exception.rootException}';
          case RemoteExceptionKind.refreshTokenFailed:
            return BaseBlocLocalization.current.tokenExpired;
        }
      case AppExceptionType.parse:
        return BaseBlocLocalization.current.parseException;
      case AppExceptionType.remoteConfig:
        return BaseBlocLocalization.current.unknownException;
      case AppExceptionType.uncaught:
        return BaseBlocLocalization.current.unknownException;
      case AppExceptionType.validation:
        final exception = appException as ValidationException;
        switch (exception.kind) {
          case ValidationExceptionKind.emptyEmail:
            return BaseBlocLocalization.current.emptyEmail;
          case ValidationExceptionKind.invalidEmail:
            return BaseBlocLocalization.current.invalidEmail;
          case ValidationExceptionKind.invalidPassword:
            return BaseBlocLocalization.current.invalidPassword;
          case ValidationExceptionKind.invalidUserName:
            return BaseBlocLocalization.current.invalidUserName;
          case ValidationExceptionKind.invalidPhoneNumber:
            return BaseBlocLocalization.current.invalidPhoneNumber;
          case ValidationExceptionKind.invalidDateTime:
            return BaseBlocLocalization.current.invalidDateTime;
          case ValidationExceptionKind.passwordsAreNotMatch:
            return BaseBlocLocalization.current.passwordsAreNotMatch;
        }
    }
  }
}
