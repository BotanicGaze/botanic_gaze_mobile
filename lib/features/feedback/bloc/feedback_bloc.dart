import 'dart:async';

import 'package:base_bloc/base_bloc.dart';
import 'package:base_network/base_network.dart';
import 'package:botanic_gaze/data_source/index.dart';
import 'package:shared/shared.dart';

part 'feedback_event.dart';
part 'feedback_state.dart';

@Injectable()
class FeedbackBloc extends BaseBloc<FeedbackEvent, FeedbackState> {
  FeedbackBloc() : super(const FeedbackState()) {
    on<SendFeedback>(_onSendFeedback);
  }

  Future<void> _onSendFeedback(
    SendFeedback event,
    Emitter<FeedbackState> emit,
  ) async {
    await runBlocCatching(
      action: () async {
        await getIt<AppApiService>().sendFeedback(
          email: event.email,
          issueText: event.content,
          title: event.title,
          appVersion: getIt<AppInfo>().versionName,
        );
        emit(state.copyWith(feedbackSuccess: true));
      },
      doOnSuccessOrError: () async {
        if (state.feedbackSuccess) {
          await getIt<AppNavigator>().showAppDialog(
            AppPopupInfo.successDialog(
              onButtonPressed: () {
                getIt<AppNavigator>().pop();
              },
              message:
                  'Thank you for sharing your feedback with us! 🚀 Your insights are invaluable and play a crucial role in enhancing ${getIt<AppInfo>().appName}. We appreciate your time and commitment to helping us make ${getIt<AppInfo>().appName} even better.',
            ),
          );
        }
      },
    );
  }
}
