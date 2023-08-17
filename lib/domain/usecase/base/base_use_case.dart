import 'package:botanic_gaze/domain/index.dart';
import 'package:meta/meta.dart';
import 'package:shared/shared.dart';

abstract class BaseUseCase<Input extends BaseInput, Output> with LogMixin {
  const BaseUseCase();

  @protected
  Output buildUseCase(Input input);
}
