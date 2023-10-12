part of 'app_bloc.dart';

class AppState extends BaseBlocState with EquatableMixin {
  const AppState({
    this.appInitializedFinish = false,
    this.xCsrfToken,
  });

  final bool appInitializedFinish;
  final String? xCsrfToken;

  @override
  List<Object> get props => [appInitializedFinish];

  AppState copyWith({
    bool? appInitializedFinish,
    String? xCsrfToken,
  }) {
    return AppState(
      appInitializedFinish: appInitializedFinish ?? this.appInitializedFinish,
      xCsrfToken: xCsrfToken ?? this.xCsrfToken,
    );
  }
}
