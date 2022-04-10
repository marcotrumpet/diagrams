part of 'save_bloc.dart';

@freezed
class SaveState with _$SaveState {
  const factory SaveState.initial() = _Initial;
  const factory SaveState.saving() = _Saving;
  const factory SaveState.saved() = _Saved;
  const factory SaveState.errorSaving() = _ErrorSaving;
}
