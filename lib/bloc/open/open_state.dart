part of 'open_bloc.dart';

@freezed
class OpenState with _$OpenState {
  const factory OpenState.initial() = _Initial;
  const factory OpenState.saveCurrent() = _SaveCurrent;
  const factory OpenState.opening() = _Opening;
  const factory OpenState.opened() = _Opened;
  const factory OpenState.errorOpening(String error) = _ErrorOpening;
}
