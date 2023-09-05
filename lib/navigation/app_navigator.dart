import 'package:base_bloc/base_bloc.dart';
import 'package:botanic_gaze/features/camera/index.dart';
import 'package:botanic_gaze/features/dash_board/view/view.dart';
import 'package:botanic_gaze/features/gallery/index.dart';
import 'package:botanic_gaze/features/plant_detail/index.dart';
import 'package:botanic_gaze/features/search_plants/index.dart';
import 'package:botanic_gaze/features/splash/index.dart';
import 'package:botanic_gaze/navigation/navigation_contains.dart';
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
            path: NavigationContains.rootPage,
            name: NavigationContains.rootPage,
            pageBuilder: (context, state) => CustomTransitionPage<void>(
              key: state.pageKey,
              child: const SplashPage(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) =>
                      FadeTransition(opacity: animation, child: child),
            ),
          ),
          GoRoute(
            path: NavigationContains.dashBoardPage,
            name: NavigationContains.dashBoardPage,
            pageBuilder: (context, state) => CustomTransitionPage<void>(
              key: state.pageKey,
              child: const DashBoardPage(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) =>
                      FadeTransition(opacity: animation, child: child),
            ),
          ),
          GoRoute(
            path: NavigationContains.searchPage,
            name: NavigationContains.searchPage,
            builder: (context, state) {
              final extra = state.extra as Map<String, dynamic>?;
              return SearchPlantsPage(
                searchPlantsFilter:
                    extra?['search_plants_filter'] as SearchPlantsFilter?,
              );
            },
            routes: [
              GoRoute(
                path: NavigationContains.searchPlantsFilterPage,
                name: NavigationContains.searchPlantsFilterPage,
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
            path: NavigationContains.scanPage,
            name: NavigationContains.scanPage,
            builder: (context, state) => const CameraPage(),
          ),
          GoRoute(
            path: NavigationContains.analysisImagePage,
            name: NavigationContains.analysisImagePage,
            builder: (context, state) {
              final extra = state.extra as Map<String, String?>?;
              return AnalysisImagePage(
                imagePath: extra?['image_path'] ?? '',
              );
            },
          ),
          GoRoute(
            path: '${NavigationContains.plantDetailPage}:id',
            name: NavigationContains.plantDetailPage,
            builder: (context, state) {
              return PlantDetailPage(
                plantId: int.tryParse(state.pathParameters['id'] ?? '') ?? 0,
              );
            },
          ),
          GoRoute(
            path: NavigationContains.galleryPhotoWrapper,
            name: NavigationContains.galleryPhotoWrapper,
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
            // builder: (context, state) {
            //   final extra = state.extra as Map<String, dynamic>?;

            //   return GalleryPhotoWrapper(
            // initialIndex: extra?['initial_index'] as int? ?? 0,
            // galleryImages:
            //     extra?['gallery_images'] as List<String>? ?? <String>[],
            //   );
            // },
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
  }) {
    throw UnimplementedError();
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
        return null;
      },
    );
  }

  @override
  void showErrorSnackBar(String message, {Duration? duration}) {}

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

  // Future<T?> showRequestPermission<T extends Object?>(
  //   PermissionType type, {
  //   bool barrierDismissible = true,
  //   bool useSafeArea = false,
  //   bool useRootNavigator = true,
  // }) async {
  //   final context = navigatorKey.currentContext!;
  //   await showDialog<T>(
  //     barrierDismissible: barrierDismissible,
  //     useSafeArea: useSafeArea,
  //     useRootNavigator: useRootNavigator,
  //     barrierColor: AppColors.black.withOpacity(0.2),
  //     context: context,
  //     builder: (context) {
  //       return PermissionPopup(type: type);
  //     },
  //   );
  //   return null;
  // }
}
