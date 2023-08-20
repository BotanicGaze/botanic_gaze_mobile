import 'package:base_bloc/base_bloc.dart';
import 'package:base_bloc/src/di/di.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

abstract class BasePageState<T extends StatefulWidget, B extends BaseBloc>
    extends BasePageStateDelegate<T, B> with LogMixin {}

abstract class BasePageStateDelegate<T extends StatefulWidget,
        B extends BaseBloc> extends State<T>
    with ExceptionHandlerListener, AutomaticKeepAliveClientMixin {
  late final AppNavigator navigator = getIt<AppNavigator>();
  late final ExceptionMessageMapper exceptionMessageMapper =
      const ExceptionMessageMapper();
  late final ExceptionHandler exceptionHandler = ExceptionHandler(
    navigator: navigator,
    listener: this,
  );

  late final CommonBloc commonBloc = getIt<CommonBloc>()
    ..disposeBag = disposeBag
    ..exceptionHandler = exceptionHandler
    ..exceptionMessageMapper = exceptionMessageMapper;

  late final B bloc = getIt<B>()
    ..disposeBag = disposeBag
    ..commonBloc = commonBloc
    ..exceptionHandler = exceptionHandler
    ..exceptionMessageMapper = exceptionMessageMapper;

  late final DisposeBag disposeBag = DisposeBag();

  bool get isAppWidget => false;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => bloc),
        BlocProvider(create: (_) => commonBloc),
      ],
      child: BlocListener<CommonBloc, CommonState>(
        listenWhen: (previous, current) =>
            previous.appExceptionWrapper != current.appExceptionWrapper &&
            current.appExceptionWrapper != null,
        listener: (context, state) {
          handleException(state.appExceptionWrapper!);
        },
        child: buildPageListeners(
          child: isAppWidget
              ? buildPage(context)
              : Stack(
                  children: [
                    buildPage(context),
                    BlocBuilder<CommonBloc, CommonState>(
                      buildWhen: (previous, current) =>
                          previous.isLoading != current.isLoading,
                      builder: (context, state) => Visibility(
                        visible: state.isLoading,
                        child: buildPageLoading(),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }

  Widget buildPageListeners({required Widget child}) => child;

  Widget buildPageLoading() => const Center(
        child: CircularProgressIndicator(),
      );

  Widget buildPage(BuildContext context);

  @override
  void dispose() {
    super.dispose();
    disposeBag.dispose();
  }

  void handleException(AppExceptionWrapper appExceptionWrapper) {
    exceptionHandler
        .handleException(
      appExceptionWrapper,
      handleExceptionMessage(appExceptionWrapper.appException),
    )
        .then((value) {
      appExceptionWrapper.exceptionCompleter?.complete();
    });
  }

  String handleExceptionMessage(AppException appException) {
    return exceptionMessageMapper.map(appException);
  }

  @override
  void onRefreshTokenFailed() {
    commonBloc.add(const ForceLogoutButtonPressed());
  }

  @override
  bool get wantKeepAlive => false;
}
