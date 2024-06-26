import 'dart:async';

import 'package:base_bloc/base_bloc.dart';
import 'package:botanic_gaze/features/login/bloc/login_event.dart';
import 'package:botanic_gaze/features/login/bloc/login_state.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class LoginBloc extends BaseBloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {
    on<EmailTextFieldChanged>(
      _onEmailTextFieldChanged,
      transformer: distinct(),
    );

    on<PasswordTextFieldChanged>(
      _onPasswordTextFieldChanged,
      transformer: distinct(),
    );

    on<LoginButtonPressed>(
      _onLoginButtonPressed,
      transformer: log(),
    );

    on<EyeIconPressed>(
      _onEyeIconPressed,
      transformer: log(),
    );
  }

  // final LoginUseCase _loginUseCase;

  bool _isLoginButtonEnabled(String email, String password) {
    return email.isNotEmpty && password.isNotEmpty;
  }

  void _onEmailTextFieldChanged(
    EmailTextFieldChanged event,
    Emitter<LoginState> emit,
  ) {
    emit(
      state.copyWith(
        email: event.email,
        isLoginButtonEnabled:
            _isLoginButtonEnabled(event.email, state.password),
        onPageError: '',
      ),
    );
  }

  void _onPasswordTextFieldChanged(
    PasswordTextFieldChanged event,
    Emitter<LoginState> emit,
  ) {
    emit(
      state.copyWith(
        password: event.password,
        isLoginButtonEnabled:
            _isLoginButtonEnabled(state.email, event.password),
        onPageError: '',
      ),
    );
  }

  FutureOr<void> _onLoginButtonPressed(
    LoginButtonPressed event,
    Emitter<LoginState> emit,
  ) {
    return runBlocCatching(
      action: () async {},
      handleError: false,
      doOnError: (e) async {
        // emit(state.copyWith(onPageError: exceptionMessageMapper.map(e)));
      },
    );
  }

  void _onEyeIconPressed(EyeIconPressed event, Emitter<LoginState> emit) {
    emit(state.copyWith(obscureText: !state.obscureText));
  }
}
