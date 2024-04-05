import 'package:shopapp/features/cart/data/models/cart_model.dart';

abstract class CartDataSource {
  Future<void> addToCart(CartModel cartItem);
  Future getCartList();
  Future<void> addItemCount(int count);
  Future<void> deleteFromCart(String id);
}
