import 'package:app_ui/app_ui.dart';
import 'package:base_bloc/base_bloc.dart';
import 'package:botanic_gaze/constants/index.dart';
import 'package:botanic_gaze/features/profile/index.dart';
import 'package:botanic_gaze/navigation/index.dart';
import 'package:botanic_gaze/services/appsflyer_config.dart';
import 'package:botanic_gaze/widgets/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends BasePageState<ProfilePage, ProfileBloc> {
  // @override
  // ProfileBloc get bloc => context.read<ProfileBloc>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bloc.add(GetLocationName());
  }

  @override
  Widget buildPage(BuildContext context) {
    return BlocListener<ProfileBloc, ProfileState>(
      listenWhen: (previous, current) =>
          previous.exception != current.exception &&
          current.exception?.appExceptionType == AppExceptionType.remote,
      listener: (context, state) async {
        await showCupertinoDialog<dynamic>(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(
                (state.exception as RemoteException?)?.generalServerMessage ??
                    '',
                textAlign: TextAlign.center,
              ),
              actions: [
                TextButton(
                  child: const Text('OK'),
                  onPressed: () {
                    context.pop();
                  },
                ),
              ],
            );
          },
        );
      },
      child: CommonScaffold(
        otherBackground: otherBackground(),
        body: SingleChildScrollView(
          child: AppSafeArea(
            child: BlocBuilder<ProfileBloc, ProfileState>(
              builder: (context, state) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(Dimens.d16.responsive()),
                      child: Center(
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(Dimens.d2.responsive()),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(Dimens.d70),
                                border: Border.all(
                                  color: Theme.of(context).primaryColor,
                                  width: Dimens.d3.responsive(),
                                ),
                              ),
                              child: SizedBox(
                                width: Dimens.d75.responsive(),
                                height: Dimens.d75.responsive(),
                                child: const CircleAvatar(
                                  // backgroundColor: Colors.amber,
                                  backgroundImage:
                                      AssetImage(AppImages.imageDefaultUser),
                                ),
                              ),
                            ),
                            // SizedBox(height: Dimens.d12.responsive()),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.center,
                            //   children: [
                            //     Image.asset(
                            //       AppIcons.iconPlantCoin,
                            //       width: Dimens.d32.responsive(),
                            //       height: Dimens.d32.responsive(),
                            //       color: Theme.of(context).primaryColor,
                            //     ),
                            //     SizedBox(width: Dimens.d8.responsive()),
                            //     Text(
                            //       '500',
                            //       style: Theme.of(context).textTheme.labelLarge,
                            //     )
                            //   ],
                            // ),
                            SizedBox(height: Dimens.d12.responsive()),
                            Text(
                              state.userInfo?.username ?? 'Hello, plant lover',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            SizedBox(height: Dimens.d24.responsive()),
                            if (state.userInfo == null) ...[
                              SizedBox(
                                width: double.infinity,
                                child: CupertinoButton(
                                  onPressed: () {
                                    bloc.add(LoginWithGoogle());
                                  },
                                  color: AppColors.black,
                                  borderRadius: BorderRadius.circular(
                                    Dimens.d32.responsive(),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        AppImages.imageGoogleLogo,
                                        width: Dimens.d24.responsive(),
                                      ),
                                      SizedBox(width: Dimens.d8.responsive()),
                                      Text(
                                        'Login with google',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelLarge
                                            ?.copyWith(
                                              color: AppColors.white,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: Dimens.d16.responsive()),
                              SizedBox(
                                width: double.infinity,
                                child: CupertinoButton(
                                  color: const Color(0xFF4267B2),
                                  borderRadius: BorderRadius.circular(
                                    Dimens.d32.responsive(),
                                  ),
                                  onPressed: () {
                                    bloc.add(LoginWithFacebook());
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        AppImages.imageFacebookLogo,
                                        width: Dimens.d24.responsive(),
                                      ),
                                      SizedBox(width: Dimens.d8.responsive()),
                                      Text(
                                        'Login with facebook',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelLarge
                                            ?.copyWith(
                                              color: AppColors.white,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                    ),
                    // const Spacer()
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // SizedBox(height: Dimens.d32.responsive()),
                        Padding(
                          padding: EdgeInsets.all(Dimens.d16.responsive()),
                          child: Text(
                            'General',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ),
                        // SizedBox(height: Dimens.d16.responsive()),
                        Visibility(
                          visible: state.userInfo != null,
                          child: profileSettingItem(
                            context,
                            title: 'Coin',
                            icon: AppIcons.iconPlantCoin,
                            rightInfo: Text(
                              state.userInfo?.coin?.coinBalance.toString() ??
                                  '',
                            ),
                            onTap: () {},
                          ),
                        ),
                        profileSettingItem(
                          context,
                          title: 'Invite friends',
                          icon: AppIcons.iconInviteFriend,
                          rightInfo: const CupertinoListTileChevron(),
                          onTap: () async {
                            // final result = await FirebaseDynamicLinksService
                            //     .createReferralLink(
                            //   referralCode: state.userInfo?.inviteCode ?? '',
                            // );
                            // Log.d(result);
                            // await Share.share(
                            //   'My referral code is ${state.userInfo?.inviteCode}, access now $result',
                            // );
                            await AppsflyerConfig().init();
                          },
                        ),
                        // const Divider(),
                        profileSettingItem(
                          context,
                          title: 'Location',
                          icon: AppIcons.iconLocation,
                          rightInfo: Text(
                            state.locationName,
                            textAlign: TextAlign.right,
                          ),
                          onTap: () async {
                            bloc.add(GetLocationName());
                            // final status = await BackgroundFetch.status;
                            // print('[BackgroundFetch] status: $status');
                          },
                        ),
                        // const Divider(),
                        profileSettingItem(
                          context,
                          title: 'Weather alerts',
                          icon: AppIcons.iconWeatherAlert,
                          rightInfo: CupertinoSwitch(
                            value: state.weatherAlert,
                            onChanged: (value) {
                              bloc.add(SwitchWeatherAlert());
                            },
                          ),
                        ),
                        // const Divider(),
                        profileSettingItem(
                          context,
                          title: 'Care reminders',
                          icon: AppIcons.iconCareReminder,
                          rightInfo: CupertinoSwitch(
                            value: state.careReminder,
                            onChanged: (value) {
                              bloc.add(SwitchCareReminders());
                            },
                          ),
                        ),
                        // const Divider(),
                        SizedBox(height: Dimens.d32.responsive()),
                        Padding(
                          padding: EdgeInsets.all(Dimens.d16.responsive()),
                          child: Text(
                            'Help',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ),
                        profileSettingItem(
                          context,
                          title: 'FAQ',
                          icon: AppIcons.iconFaq,
                          onTap: () {
                            context.pushNamed(
                              ScreenPaths.frequentlyAskedQuestions,
                            );
                          },
                          rightInfo: const Icon(
                            Icons.arrow_forward_ios_sharp,
                            size: 16,
                          ),
                        ),
                        // const Divider(),
                        profileSettingItem(
                          context,
                          title: 'Send feedback',
                          icon: AppIcons.iconFeedback,
                          rightInfo: const Icon(
                            Icons.arrow_forward_ios_sharp,
                            size: 16,
                          ),
                          onTap: () {
                            context.pushNamed(ScreenPaths.feedbackScreen);
                          },
                        ),
                        // const Divider(),
                        profileSettingItem(
                          context,
                          title: 'Rate us',
                          icon: AppIcons.iconRating,
                          rightInfo: const Icon(
                            Icons.arrow_forward_ios_sharp,
                            size: 16,
                          ),
                        ),
                        // const Divider(),
                        profileSettingItem(
                          context,
                          title: 'Contacts us',
                          icon: AppIcons.iconContact,
                          rightInfo: const Icon(
                            Icons.arrow_forward_ios_sharp,
                            size: 16,
                          ),
                        ),
                        // const Divider(),
                        profileSettingItem(
                          context,
                          title: 'Term of use',
                          icon: AppIcons.iconTermsAndConditions,
                          rightInfo: const Icon(
                            Icons.arrow_forward_ios_sharp,
                            size: 16,
                          ),
                          onTap: () {
                            IntentUtils.openBrowserURL(
                              url: Uri.parse(
                                'https://botanic-gaze.net/terms-of-use',
                              ),
                            );
                          },
                        ),
                        // const Divider(),
                        profileSettingItem(
                          context,
                          title: 'Privacy police',
                          icon: AppIcons.iconPrivacyPolice,
                          rightInfo: const Icon(
                            Icons.arrow_forward_ios_sharp,
                            size: 16,
                          ),
                          onTap: () {
                            IntentUtils.openBrowserURL(
                              url: Uri.parse(
                                'https://botanic-gaze.net/privacy-policy',
                              ),
                            );
                          },
                        ),
                      ],
                    ),

                    Visibility(
                      visible: state.userInfo != null,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: Dimens.d16.responsive(),
                          vertical: Dimens.d32.responsive(),
                        ),
                        child: SizedBox(
                          width: double.infinity,
                          child: CupertinoButton(
                            borderRadius:
                                BorderRadius.circular(Dimens.d32.responsive()),
                            color: AppColors.secondary,
                            child: Text(
                              'Logout',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge
                                  ?.copyWith(
                                    color: AppColors.white,
                                  ),
                            ),
                            onPressed: () {
                              bloc.add(Logout());
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget profileSettingItem(
    BuildContext context, {
    required String title,
    Widget? rightInfo,
    String? icon,
    VoidCallback? onTap,
  }) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(
        horizontal: Dimens.d16.responsive(),
        // vertical: Dimens.d4.responsive(),
      ),
      leading: icon != null
          ? Image.asset(
              icon,
              width: Dimens.d24.responsive(),
              color: Theme.of(context).primaryColor,
            )
          : null,
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      trailing: SizedBox(
        width: ScreenUtil().screenWidth * 0.4,
        child: Align(
          alignment: Alignment.centerRight,
          child: rightInfo ?? const CupertinoListTileChevron(),
        ),
      ),
      onTap: onTap,
    );
  }

  List<Widget> otherBackground() {
    return [
      // Align(
      //   alignment: Alignment.topRight,
      //   child: Image.asset(
      //     AppImages.imageBackground1,
      //     width: ScreenUtil().screenHeight * 0.2,
      //   ),
      // ),
      Align(
        alignment: Alignment.bottomRight,
        child: Opacity(
          opacity: 0.2,
          child: Image.asset(
            AppImages.imageBackground2,
            width: ScreenUtil().screenHeight * 0.2,
          ),
        ),
      ),
      Align(
        alignment: Alignment.bottomLeft,
        child: Opacity(
          opacity: 0.2,
          child: Image.asset(
            AppImages.imageBackground3,
            width: ScreenUtil().screenHeight * 0.2,
          ),
        ),
      ),
    ];
  }

  @override
  bool get wantKeepAlive => true;
}
