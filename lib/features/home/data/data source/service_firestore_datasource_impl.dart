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
  Stream<List<ServiceModel>> getServices(List<String> userIds) async* {
    final service = collection
        .where(Filter.and(
            Filter.or(Filter('service', isEqualTo: userIds.first),
                Filter('service', isEqualTo: userIds.last)),
            Filter.or(Filter('service', isEqualTo: userIds.first),
                Filter('service', isEqualTo: userIds.last))))
        .snapshots();

    await for (var snapshot in service) {
      yield snapshot.docs.map((doc) => doc.data()).toList();
      // ..sort((a, b) => a.timestamp.compareTo(b.timestamp));
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
