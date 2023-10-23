import 'package:app_ui/app_ui.dart';
import 'package:base_bloc/base_bloc.dart';
import 'package:botanic_gaze/di/di.dart';
import 'package:botanic_gaze/features/feedback/index.dart';
import 'package:botanic_gaze/features/profile/index.dart';
import 'package:botanic_gaze/models/index.dart';
import 'package:botanic_gaze/widgets/index.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({super.key});

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends BasePageState<FeedbackScreen, FeedbackBloc> {
  UserInfoResponse? get profileBloc => getIt<ProfileBloc>().state.userInfo;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  @override
  Widget buildPage(BuildContext context) {
    return CommonScaffold(
      appBar: AppBar(
        title: const Text('Feedback'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(Dimens.d16.responsive()),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Dear ${profileBloc?.niceName ?? ""}',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(height: Dimens.d8.responsive()),
                Text('''
Your experience matters! 🌟 
Share your thoughts on ${getIt<AppInfo>().appName} - whether it's a suggestion, feedback, or a glowing review! 
Your input is the secret ingredient to make ${getIt<AppInfo>().appName} even more amazing. 🚀
          '''),
                RichText(
                  text: TextSpan(
                    text: 'Your email ',
                    style: Theme.of(context).textTheme.bodyMedium,
                    children: const [
                      TextSpan(
                        text: '*',
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: Dimens.d8.responsive()),
                AppTextField(
                  hintText: 'Your email',
                  controller: _emailController,
                  validator: (value) {
                    if (value?.isEmpty ?? true) return 'We Need Your Input! 🌐';
                    if (!ValidationUtils.isValidEmail(value ?? '')) {
                      return 'Oops! 🙊 Please confirm your email';
                    }
                    return null;
                  },
                ),
                SizedBox(height: Dimens.d16.responsive()),
                RichText(
                  text: TextSpan(
                    text: 'Title ',
                    style: Theme.of(context).textTheme.bodyMedium,
                    children: const [
                      TextSpan(
                        text: '*',
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: Dimens.d12.responsive()),
                AppTextField(
                  hintText: 'Title',
                  controller: _titleController,
                  validator: (value) {
                    if (value?.isEmpty ?? true) return 'We Need Your Input! 🌐';
                    return null;
                  },
                ),
                SizedBox(height: Dimens.d16.responsive()),
                RichText(
                  text: TextSpan(
                    text: 'Message ',
                    style: Theme.of(context).textTheme.bodyMedium,
                    children: const [
                      TextSpan(
                        text: '*',
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: Dimens.d12.responsive()),
                AppTextField(
                  hintText: 'Message',
                  controller: _contentController,
                  maxLine: 5,
                  validator: (value) {
                    if (value?.isEmpty ?? true) return 'We Need Your Input! 🌐';
                    return null;
                  },
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: AppSafeArea(
        minimum: EdgeInsets.all(Dimens.d16.responsive()),
        child: AppButton.fullSize(
          child: const Text('Submit'),
          onPressed: () {
            if (formKey.currentState?.validate() ?? false) {
              bloc.add(
                SendFeedback(
                  title: _titleController.text.trim(),
                  content: _contentController.text.trim(),
                  email: _emailController.text.trim(),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
