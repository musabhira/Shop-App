import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shopapp/features/home/data/data%20source/service_firestore_datasource.dart';
import 'package:shopapp/features/home/data/models/service_model.dart';

part 'service_firestore_datasource_impl.g.dart';

class ServiceFireStoreDataSourceImpl implements ServiceFireStoreDataSource {
  final collection = FirebaseFirestore.instance
      .collection('service')
      .withConverter(
          fromFirestore: ServiceModel.fromFirestore,
          toFirestore: (model, _) => model.toFirestore());

  @override
  Stream<List<ServiceModel>> getServices() async* {
    final serviceStream = collection.snapshots(includeMetadataChanges: true);
    await for (final services in serviceStream) {
      yield [for (final service in services.docs) service.data()];
    }
  }

  @override
  Future<void> sendService(ServiceModel message) async {
    final docId = collection.add(message);
    await docId;
  }
}

@riverpod
ServiceFireStoreDataSource serviceFireStoreDataSource(
    ServiceFireStoreDataSourceRef ref) {
  return ServiceFireStoreDataSourceImpl();
}
