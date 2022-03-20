part of 'handle_points_bloc.dart';

@freezed
class HandlePointsEvent with _$HandlePointsEvent {
  const factory HandlePointsEvent.panDown(Offset offset) = _PanDown;
  const factory HandlePointsEvent.panUpdate(Offset offset) = _PanUpdate;
  const factory HandlePointsEvent.panEnd() = _PanEnd;
}
