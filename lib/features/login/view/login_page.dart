import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:botanic_gaze/features/login/login.dart';
import 'package:botanic_gaze/features/login/view/login_view.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: const LoginView(),
    );
  }
}
