import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cart_constant.g.dart';

class CartConstants {
  final addMoretxt = 'Add more Service';
  final frequentlytxt = 'Frequently added service';
  final bookSlottxt = 'Book Slot';
}

@riverpod
CartConstants cartConstants(CartConstantsRef ref) {
  return CartConstants();
}
