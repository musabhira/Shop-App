import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shopapp/features/home/data/repository/service_repository_impl.dart';
import 'package:shopapp/features/home/domain/entites/service_entity.dart';
import 'package:shopapp/features/home/domain/usecases/get_service_usecase.dart';
import 'package:shopapp/features/home/presentation/providers/service_state.dart';

part 'service_provider.g.dart';

@Riverpod(keepAlive: true)
class Service extends _$Service {
  @override
  ServiceState build() {
    return ServiceState(service: '');
  }

  Stream<List<ServiceEntity>> getServicei() {
    final repository = ref.read(serviceRepositoryProvider);
    return GetServiceUseCase(repository: repository)();
  }
}

@riverpod
Stream<List<ServiceEntity>> getService(GetServiceRef ref) {
  final repository = ref.read(serviceRepositoryProvider);
  return GetServiceUseCase(repository: repository)();
}
