part of 'feedback_bloc.dart';

sealed class FeedbackEvent extends BaseBlocEvent with EquatableMixin {
  const FeedbackEvent();
}

class SendFeedback extends FeedbackEvent {
  SendFeedback({
    required this.title,
    required this.email,
    required this.content,
  });

  final String title;
  final String email;
  final String content;
  @override
  List<Object?> get props => [];
}
