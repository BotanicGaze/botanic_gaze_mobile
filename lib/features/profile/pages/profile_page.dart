import 'package:base_bloc/base_bloc.dart';
import 'package:botanic_gaze/features/profile/index.dart';
import 'package:botanic_gaze/widgets/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends BasePageState<ProfilePage, ProfileBloc> {
  @override
  Widget buildPage(BuildContext context) {
    return CommonScaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: () async {
                final result = await FacebookAuth.instance
                    .login(); // by default we request the email and the public profile
                // or FacebookAuth.i.login()
                if (result.status == LoginStatus.success) {
                  // you are logged
                  final accessToken = result.accessToken!;
                  print(accessToken.token);
                } else {
                  print(result.status);
                  print(result.message);
                }
              },
              child: const Text('Facebook login'),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: () async {
                // Trigger the authentication flow
                final googleUser = await GoogleSignIn().signIn();

                // Obtain the auth details from the request
                final googleAuth = await googleUser?.authentication;

                print(googleAuth?.accessToken);

                // Create a new credential
                // final credential = GoogleAuthProvider.credential(
                //   accessToken: googleAuth?.accessToken,
                //   idToken: googleAuth?.idToken,
                // );
              },
              child: const Text('Google login'),
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
