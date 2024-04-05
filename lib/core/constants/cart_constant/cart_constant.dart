import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cart_constant.g.dart';

class CartConstants {
  final locationtxt = '406, Skyline Park Date, MM Road...';
  final searchhinttxt = 'Search for a service';
  final availableServicetxt = 'Available Service';
  final cleaningtxt = 'cleaning';
  final seeAlltxt = 'See All';
  final cleanServicestxt = 'Cleaning Service';
  final homeCleaningtxt = 'Home Cleaning';
  final myAccounttxt = 'My Account';
}

@riverpod
CartConstants cartConstants(CartConstantsRef ref) {
  return CartConstants();
}
