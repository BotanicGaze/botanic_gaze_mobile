import 'package:botanic_gaze/domain/index.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'save_is_dark_mode_use_case.freezed.dart';

@Injectable()
class SaveIsDarkModeUseCase
    extends BaseFutureUseCase<SaveIsDarkModeInput, SaveIsDarkModeOutput> {
  SaveIsDarkModeUseCase(this._repository);

  final Repository _repository;

  @protected
  @override
  Future<SaveIsDarkModeOutput> buildUseCase(SaveIsDarkModeInput input) async {
    await _repository.saveIsDarkMode(input.isDarkMode);

    return const SaveIsDarkModeOutput();
  }
}

@freezed
class SaveIsDarkModeInput extends BaseInput with _$SaveIsDarkModeInput {
  const factory SaveIsDarkModeInput({
    required bool isDarkMode,
  }) = _SaveIsDarkModeInput;
}

@freezed
class SaveIsDarkModeOutput extends BaseOutput with _$SaveIsDarkModeOutput {
  const factory SaveIsDarkModeOutput() = _SaveIsDarkModeOutput;
  const SaveIsDarkModeOutput._();
}
