import 'package:base_bloc/base_bloc.dart';
import 'package:botanic_gaze/features/camera/index.dart';
import 'package:botanic_gaze/features/dash_board/view/view.dart';
import 'package:botanic_gaze/features/explore/index.dart';
import 'package:botanic_gaze/features/feedback/index.dart';
import 'package:botanic_gaze/features/gallery/index.dart';
import 'package:botanic_gaze/features/my_garden/index.dart';
import 'package:botanic_gaze/features/plant_detail/index.dart';
import 'package:botanic_gaze/features/profile/index.dart';
import 'package:botanic_gaze/features/search_plants/index.dart';
import 'package:botanic_gaze/features/splash/index.dart';
import 'package:botanic_gaze/models/index.dart';
import 'package:botanic_gaze/navigation/screen_paths.dart';
import 'package:botanic_gaze/widgets/index.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

@LazySingleton(as: AppNavigator)
class AppNavigatorImpl extends AppNavigator with LogMixin {
  @override
  GoRouter get router => GoRouter(
        navigatorKey: appNavigatorKey,
        debugLogDiagnostics: true,
        routes: [
          GoRoute(
            path: ScreenPaths.rootPage,
            name: ScreenPaths.rootPage,
            pageBuilder: (context, state) => CustomTransitionPage<void>(
              key: state.pageKey,
              child: const SplashPage(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) =>
                      FadeTransition(opacity: animation, child: child),
            ),
          ),
          GoRoute(
            path: ScreenPaths.dashBoardPage,
            name: ScreenPaths.dashBoardPage,
            pageBuilder: (context, state) => CustomTransitionPage<void>(
              key: state.pageKey,
              child: const DashBoardPage(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) =>
                      FadeTransition(opacity: animation, child: child),
            ),
          ),
          GoRoute(
            path: ScreenPaths.searchPage,
            name: ScreenPaths.searchPage,
            builder: (context, state) {
              final extra = state.extra as Map<String, dynamic>?;
              return SearchPlantsPage(
                searchPlantsFilter:
                    extra?['search_plants_filter'] as SearchPlantsFilter?,
              );
            },
            routes: [
              GoRoute(
                path: ScreenPaths.searchPlantsFilterPage,
                name: ScreenPaths.searchPlantsFilterPage,
                builder: (context, state) {
                  final extra = state.extra as Map<String, dynamic>?;
                  return SearchPlantsFilterPage(
                    initFilter: extra?['init_filter'] as SearchPlantsFilter? ??
                        const SearchPlantsFilter(),
                  );
                },
              ),
            ],
          ),
          GoRoute(
            path: ScreenPaths.scanPage,
            name: ScreenPaths.scanPage,
            builder: (context, state) => const CameraPage(),
          ),
          GoRoute(
            path: ScreenPaths.analysisImagePage,
            name: ScreenPaths.analysisImagePage,
            builder: (context, state) {
              final extra = state.extra as Map<String, String?>?;
              return AnalysisImagePage(
                imagePath: extra?['image_path'] ?? '',
              );
            },
          ),
          GoRoute(
            path: '${ScreenPaths.plantDetailPage}:id',
            name: ScreenPaths.plantDetailPage,
            builder: (context, state) {
              return PlantDetailPage(
                plantId: int.tryParse(state.pathParameters['id'] ?? '') ?? 0,
                showAddGarden:
                    ((state.extra as Map?)?['show_add_garden'] as bool?) ??
                        true,
              );
            },
          ),
          GoRoute(
            path: ScreenPaths.galleryPhotoWrapper,
            name: ScreenPaths.galleryPhotoWrapper,
            pageBuilder: (context, state) {
              final extra = state.extra as Map<String, dynamic>?;
              return CustomTransitionPage<void>(
                key: state.pageKey,
                child: GalleryPhotoWrapper(
                  initialIndex: extra?['initial_index'] as int? ?? 0,
                  galleryImages:
                      extra?['gallery_images'] as List<String>? ?? <String>[],
                ),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) =>
                        FadeTransition(opacity: animation, child: child),
              );
            },
          ),
          GoRoute(
            path: ScreenPaths.popularPlantDetail,
            name: ScreenPaths.popularPlantDetail,
            builder: (context, state) {
              final extra = state.extra as Map<String, dynamic>?;

              return PopularPlantDetail(
                data: extra?['popular_plant_model'] as PopularPlantModel,
              );
            },
          ),
          GoRoute(
            path: ScreenPaths.myPlantDetail,
            name: ScreenPaths.myPlantDetail,
            builder: (context, state) {
              final extra = state.extra as MyPlantModel?;
              return MyPlantDetailScreen(
                item: extra,
              );
            },
          ),
          GoRoute(
            path: ScreenPaths.feedbackScreen,
            name: ScreenPaths.feedbackScreen,
            builder: (context, state) {
              // final extra = state.extra as MyPlantModel?;
              return const FeedbackScreen();
            },
          ),
          GoRoute(
            path: ScreenPaths.frequentlyAskedQuestions,
            name: ScreenPaths.frequentlyAskedQuestions,
            builder: (context, state) {
              // final extra = state.extra as MyPlantModel?;
              return const FrequentlyAskedQuestions();
            },
          ),
        ],
      );

  @override
  bool get canPopSelfOrChildren => throw UnimplementedError();

  @override
  int get currentBottomTab => throw UnimplementedError();

  @override
  String getCurrentRouteName({bool useRootNavigator = false}) {
    throw UnimplementedError();
    // return GoRouterState.of(navigatorKey.currentState!.context).name ?? '';
  }

  @override
  GlobalKey<NavigatorState> get navigatorKey => appNavigatorKey;

  @override
  Future<bool> pop<T extends Object?>({
    T? result,
    bool useRootNavigator = false,
  }) async {
    globalContext.pop<T>();
    return true;
  }

  @override
  Future<T?> showAppDialog<T extends Object?>(
    AppPopupInfo appPopupInfo, {
    bool barrierDismissible = true,
    bool useSafeArea = false,
    bool useRootNavigator = true,
  }) async {
    return appPopupInfo.when(
      errorWithRetryDialog: (message, onRetryPressed) {
        return null;
      },
      requiredLoginDialog: () {
        return null;
      },
      confirmDialog: (
        String title,
        String message,
        void Function()? onPositive,
        void Function()? onNegative,
        bool showButtonNegative,
        String? positiveTitle,
        String? negativeTitle,
      ) async {
        // return null;
        await AppConfirmDialog.show(
          globalContext,
          content: message,
          positiveText: positiveTitle,
          negativeText: negativeTitle,
          positivePress: onPositive,
          negativePress: onNegative,
        );
        return null;
      },
      successDialog:
          (String title, String message, VoidCallback? onButtonPressed) async {
        await AppDialog.showSuccess(
          globalContext,
          content: message,
          onClose: onButtonPressed,
          barrierDismissible: false,
        );
        return null;
      },
      infoDialog:
          (String title, String message, VoidCallback? onButtonPressed) {
        return null;
      },
    );
  }

  @override
  void showErrorSnackBar(String message, {Duration? duration}) {
    ViewUtils.showAppSnackBar(
      globalContext,
      message,
      duration: duration,
      // backgroundColor: AppColors.current.primaryColor,
    );
  }

  @override
  Future<T?> showAppGeneralDialog<T extends Object?>(
    AppPopupInfo appPopupInfo, {
    Widget Function(
      BuildContext p1,
      Animation<double> p2,
      Animation<double> p3,
      Widget p4,
    )? transitionBuilder,
    Duration transitionDuration =
        DurationConstants.defaultGeneralDialogTransitionDuration,
    bool barrierDismissible = true,
    Color barrierColor = const Color(0x80000000),
    bool useRootNavigator = true,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<T?> showAppModalBottomSheet<T extends Object?>(
    AppPopupInfo appPopupInfo, {
    bool isScrollControlled = false,
    bool useRootNavigator = false,
    bool isDismissible = true,
    bool enableDrag = true,
    Color barrierColor = Colors.black54,
    Color? backgroundColor,
  }) {
    throw UnimplementedError();
  }

  @override
  void showSuccessSnackBar(String message, {Duration? duration}) {}
}
