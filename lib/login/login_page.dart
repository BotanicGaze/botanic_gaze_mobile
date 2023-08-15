import 'package:app_ui/app_ui.dart';
import 'package:base_bloc/base_bloc.dart';
import 'package:botanic_gaze/common_view/common_scaffold.dart';
import 'package:botanic_gaze/login/bloc/login_bloc.dart';
import 'package:botanic_gaze/login/bloc/login_event.dart';
import 'package:botanic_gaze/login/bloc/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends BasePageState<LoginPage, LoginBloc> {
  @override
  Widget buildPage(BuildContext context) {
    return CommonScaffold(
      hideKeyboardWhenTouchOutside: true,
      // appBar: CommonAppBar(
      //   leadingIcon: LeadingIcon.close,
      //   // leadingIconColor: AppColors.current.secondaryColor,
      //   centerTitle: true,
      //   text: S.current.login,
      //   backgroundColor: AppColors.current.primaryColor,
      //   titleTextStyle: AppTextStyles.s14w400Primary(),
      // ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(Dimens.d16.responsive()),
          child: Column(
            children: [
              // TextField(
              //   title: S.current.email,
              //   hintText: S.current.email,
              //   onChanged: (email) =>
              //       bloc.add(EmailTextFieldChanged(email: email)),
              //   keyboardType: TextInputType.emailAddress,
              // ),
              // SizedBox(height: Dimens.d24.responsive()),
              // AppTextField(
              //   title: S.current.password,
              //   hintText: S.current.password,
              //   onChanged: (pass) =>
              //       bloc.add(PasswordTextFieldChanged(password: pass)),
              //   keyboardType: TextInputType.visiblePassword,
              // ),
              SizedBox(height: Dimens.d15.responsive()),
              // BlocBuilder<LoginBloc, LoginState>(
              //   buildWhen: (previous, current) =>
              //       previous.onPageError != current.onPageError,
              //   builder: (_, state) => Text(
              //     state.onPageError,
              //     style: AppTextStyles.s14w400Secondary(),
              //   ),
              // ),
              BlocBuilder<LoginBloc, LoginState>(
                buildWhen: (previous, current) =>
                    previous.isLoginButtonEnabled !=
                    current.isLoginButtonEnabled,
                builder: (context, state) {
                  return ElevatedButton(
                    onPressed: () => bloc.add(const LoginButtonPressed()),
                    child: const Text('Loading'),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
