import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'service_constants.g.dart';

class ServiceConstants {
  final cleanServicetxt = 'Cleaning Service';
  final deepCleaningtxt = 'Deep Cleaning';
  final maidServicetxt = 'Maid Services';
  final carcleaningtxt = 'Car Cleaning';
  final addtxt = 'Add +';
  final viewCarttxt = 'VIEW CART';
}

@riverpod
ServiceConstants serviceConstants(ServiceConstantsRef ref) {
  return ServiceConstants();
}
