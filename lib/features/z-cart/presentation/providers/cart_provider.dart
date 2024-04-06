import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shopapp/features/z-cart/data/data%20source/cart_datasource_impl.dart';
import 'package:shopapp/features/z-cart/data/models/cart_model.dart';

part 'cart_provider.g.dart';

@riverpod
class Cart extends _$Cart {
  @override
  void build() {}

  /// Add a new service to the cart
  Future<void> addServiceToCart(String serviceId) async {
    final cartData = await CartDataSourceImpl().getCartItem(serviceId);

    if (cartData == null) {
      await CartDataSourceImpl()
          .addToCart(CartModel(service: serviceId, count: 1));
    } else {
      await CartDataSourceImpl()
          .addToCart(cartData.copyWith(count: cartData.count + 1));
    }
  }

  Future<void> deleteCartItem(String serviceId) async {
    final cartData = await CartDataSourceImpl().getCartItem(serviceId);

    if (cartData == null) {
      await CartDataSourceImpl()
          .addToCart(CartModel(service: serviceId, count: 1));
    } else {
      if (cartData.count > 1) {
        await CartDataSourceImpl()
            .addToCart(cartData.copyWith(count: cartData.count - 1));
      } else {
        await CartDataSourceImpl().deleteCartItem(serviceId);
      }
    }
  }
}

@riverpod
Stream<List<CartModel>> getCart(GetCartRef ref) async* {
  await for (final cartItemList in CartDataSourceImpl().getCartList()) {
    yield [
      for (final cartItem in cartItemList.docs) cartItem.data(),
    ];
  }
}
