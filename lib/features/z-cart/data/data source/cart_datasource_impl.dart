import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shopapp/features/z-cart/data/data%20source/cart_datasource.dart';
import 'package:shopapp/features/z-cart/data/models/cart_model.dart';

class CartDataSourceImpl implements CartDataSource {
  final cartCollection = FirebaseFirestore.instance
      .collection('user')
      .doc(FirebaseAuth.instance.currentUser?.uid)
      .collection('cart')
      .withConverter(
        fromFirestore: CartModel.fromFirestore,
        toFirestore: (cartItem, options) => cartItem.toFirestore(),
      );

  @override
  Future<void> addItemCount(int count, String itemId) async {
    await cartCollection.doc(itemId).update({"count": count});
  }

  Future<CartModel?> getCartItem(String serviceId) async {
    final cartData = await cartCollection.doc(serviceId).get();
    return cartData.data();
  }

  @override
  Future<void> addToCart(CartModel cartItem) async {
    await cartCollection.doc(cartItem.service).set(cartItem);
  }

  @override
  Future<void> deleteFromCart(String id) async {
    await cartCollection.doc(id).delete();
  }

  @override
  Stream<QuerySnapshot<CartModel>> getCartList() {
    return cartCollection.snapshots();
  }

  @override
  Future<void> deleteCartItem(String serviceId) async {
    await cartCollection.doc(serviceId).delete();
  }
}
