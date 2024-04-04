import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_constants.g.dart';

class HomeConstants {
  final locationtxt = '406, Skyline Park Date, MM Road...';
  final searchhinttxt = 'Search for a service';
  final availableServicetxt = 'Available Service';
  final cleaningtxt = 'cleaning';
  final seeAlltxt = 'See All';
  final confirmpassword = 'Confirm Password';
  final signupbtntxt = 'Sign up';
  final forgotpassword = 'Forgot your password?';
  final alternativetxt = 'or continue with';
  final alreadyuser = 'Already have an account?';
  final loginnow = 'Login';
  final movielogo = 'assets/images/movie_logo3.png';
}

@riverpod
HomeConstants homeConstants(HomeConstantsRef ref) {
  return HomeConstants();
}
