part of 'splash_bloc.dart';

class SplashState extends BaseBlocState with EquatableMixin {
  const SplashState({
    this.appInitializedFinish = false,
    this.xCsrfToken,
  });

  final bool appInitializedFinish;
  final String? xCsrfToken;

  @override
  List<Object> get props => [appInitializedFinish];

  SplashState copyWith({
    bool? appInitializedFinish,
    String? xCsrfToken,
  }) {
    return SplashState(
      appInitializedFinish: appInitializedFinish ?? this.appInitializedFinish,
      xCsrfToken: xCsrfToken ?? this.xCsrfToken,
    );
  }
}
