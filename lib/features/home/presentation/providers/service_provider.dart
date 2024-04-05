import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shopapp/features/home/data/repository/service_repository_impl.dart';
import 'package:shopapp/features/home/domain/entites/service_entity.dart';
import 'package:shopapp/features/home/domain/usecases/get_service_usecase.dart';

part 'service_provider.g.dart';

@riverpod
class Service extends _$Service {
  @override
  void build() {}
}

@riverpod
Stream<List<ServiceEntity>> getService(GetServiceRef ref) {
  final repository = ref.read(serviceRepositoryProvider);

  return GetServiceUseCase(repository: repository)();
}
