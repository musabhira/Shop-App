import 'package:shopapp/features/home/domain/entites/service_entity.dart';

abstract class ServiceRepository {
  Stream<List<ServiceEntity>> getService();
  Future<void> sendService(ServiceEntity service);
}
