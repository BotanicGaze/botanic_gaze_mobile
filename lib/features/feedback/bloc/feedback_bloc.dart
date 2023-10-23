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
    await getIt<AppApiService>().sendFeedback(
      email: event.email,
      issueText: event.content,
      title: event.title,
      appVersion: getIt<AppInfo>().applicationId,
    );
  }
}
