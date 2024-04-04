import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'profile_constants.g.dart';

class ProfileConstants {
  final myAccounttxt = 'MyAccount';
  final fathimatxt = 'Fathima Ebrahim';
  final numbertxt = '+91 9087864233';
  final wallettxt = 'Wallet';
  final balancetxt = 'Balance- 125';
  final editprofiletxt = 'Edit Profile';
  final savedAddresstxt = 'Saved Address';
  final termsConditiontxt = 'Terms & Condition';
  final privacyPolicytxt = 'Privacy Policy';
  final referAFriendtxt = 'Refer a friend';
  final customerSupporttxt = 'Customer Support';
  final logOuttxt = 'LogOut';
}

@riverpod
ProfileConstants profileConstants(ProfileConstantsRef ref) {
  return ProfileConstants();
}
