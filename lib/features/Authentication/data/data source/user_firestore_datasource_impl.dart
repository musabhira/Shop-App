import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shopapp/features/Authentication/data/data%20source/user_firestore_datasource.dart';
import 'package:shopapp/features/Authentication/data/models/user_model.dart';

part 'user_firestore_datasource_impl.g.dart';

class UserFirestoreDataSourceImpl implements UserFireStoreDataSource {
  final userCollection =
      FirebaseFirestore.instance.collection('user').withConverter(
            fromFirestore: UserModel.fromFirestore,
            toFirestore: (user, options) => user.toFirestore(),
          );

  @override
  Future<void> createUserDocument(User user) async {
    final userData = UserModel(
      uid: user.uid,
      name: user.displayName ?? "Not Available",
      phone: user.phoneNumber ?? "Not Available",
    );
    await userCollection.doc(user.uid).set(userData);
  }
}

@riverpod
UserFireStoreDataSource userFireStore(UserFireStoreRef ref) {
  return UserFirestoreDataSourceImpl();
}
