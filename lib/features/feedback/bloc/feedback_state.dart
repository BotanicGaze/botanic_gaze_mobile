part of 'feedback_bloc.dart';

class FeedbackState extends BaseBlocState with EquatableMixin {
  const FeedbackState({this.feedbackSuccess = false});

  final bool feedbackSuccess;

  @override
  List<Object> get props => [feedbackSuccess];

  FeedbackState copyWith({
    bool? feedbackSuccess,
  }) {
    return FeedbackState(
      feedbackSuccess: feedbackSuccess ?? this.feedbackSuccess,
    );
  }
}
