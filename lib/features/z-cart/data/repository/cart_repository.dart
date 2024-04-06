import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shopapp/features/cart/data/models/cart_model.dart';

abstract class CartRepository {
  Future<void> addToCart(CartModel cartItem);
  Stream<QuerySnapshot<CartModel>> getCartList();
  Future<void> addItemCount(int count, String itemId);
  Future<void> deleteFromCart(String id);
  Future<void> deleteCartItem(String serviceId);
}
