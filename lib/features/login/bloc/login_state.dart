import 'package:base_bloc/base_bloc.dart';
import 'package:shared/shared.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState extends BaseBlocState with _$LoginState {
  const factory LoginState({
    @Default('') String email,
    @Default('') String password,
    @Default(false) bool isLoginButtonEnabled,
    @Default(false) bool obscureText,
    @Default('') String onPageError,
    @Default(false) bool showLoginButtonLoading,
  }) = _LoginState;
}
