import 'package:shopapp/features/home/domain/entites/service_entity.dart';

abstract class ServiceRepository {
  Stream<List<ServiceEntity>> getMessages(List<String> userIds);
  Future<void> sendMessage(ServiceEntity message);
}
