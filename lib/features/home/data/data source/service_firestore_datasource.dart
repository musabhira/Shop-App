import 'package:shopapp/features/home/data/models/service_model.dart';

abstract class ServiceFireStoreDataSource {
  Stream<List<ServiceModel>> getMessages(List<String> userIds);
  Future<void> sendMessage(ServiceModel message);
}
