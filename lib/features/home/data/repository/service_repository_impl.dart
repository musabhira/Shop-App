import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shopapp/features/home/data/data%20source/service_firestore_datasource.dart';
import 'package:shopapp/features/home/data/data%20source/service_firestore_datasource_impl.dart';
import 'package:shopapp/features/home/data/models/service_model.dart';
import 'package:shopapp/features/home/domain/entites/service_entity.dart';
import 'package:shopapp/features/home/domain/repository/service_repository.dart';

part 'service_repository_impl.g.dart';

class ServiceRepositoryImpl implements ServiceRepository {
  final ServiceFireStoreDataSource dataSource;

  ServiceRepositoryImpl(this.dataSource);

  @override
  Stream<List<ServiceEntity>> getService() async* {
    final services = dataSource.getServices();
    await for (final snapshot in services) {
      final docs = snapshot;
      yield [
        for (final service in docs) ServiceEntity(service: service.service)
      ];
    }
  }

  @override
  Future<void> sendService(ServiceEntity service) async {
    await dataSource.sendService(ServiceModel(service: service.service));
  }
}

@riverpod
ServiceRepository serviceRepository(ServiceRepositoryRef ref) {
  return ServiceRepositoryImpl(ref.watch(serviceFireStoreDataSourceProvider));
}
