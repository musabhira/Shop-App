import 'package:shopapp/features/home/data/models/service_model.dart';

abstract class ServiceFireStoreDataSource {
  Stream<List<ServiceModel>> getServices();
  Future<void> sendService(ServiceModel message);
}
