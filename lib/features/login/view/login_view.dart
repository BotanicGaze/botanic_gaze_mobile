import 'package:app_ui/app_ui.dart';
import 'package:base_bloc/base_bloc.dart';
import 'package:botanic_gaze/features/login/login.dart';
import 'package:botanic_gaze/widgets/index.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LoginViewState();
  }
}

class _LoginViewState extends BasePageState<LoginView, LoginBloc> {
  @override
  Widget buildPage(BuildContext context) {
    return CommonScaffold(
      // appBar: CommonAppBar(
      //   leadingIcon: LeadingIcon.close,
      //   // leadingIconColor: AppColors.current.secondaryColor,
      //   centerTitle: true,
      //   text: S.current.login,
      //   backgroundColor: AppColors.current.primaryColor,
      //   titleTextStyle: AppTextStyles.s14w400Primary(),
      // ),
      body: AppSafeArea(
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
                    // onPressed: null,

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
