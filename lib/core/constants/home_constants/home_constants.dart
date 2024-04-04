import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_constants.g.dart';

class HomeConstants {
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
HomeConstants homeConstants(HomeConstantsRef ref) {
  return HomeConstants();
}
