import 'package:freezed_annotation/freezed_annotation.dart';
part 'service_state.freezed.dart';

@freezed
class ServiceState with _$ServiceState {
  factory ServiceState({
    required String service,
  }) = _ServiceState;
}
