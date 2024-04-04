import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopapp/core/constants/home_constants/home_constants.dart';

class CircularImageWidget extends ConsumerWidget {
  const CircularImageWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final constants = ref.watch(homeConstantsProvider);
    return Column(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: ClipOval(
            child: Image.asset('assets/images/leaf.png'),
          ),
        ),
        const SizedBox(height: 5),
        Text(
          constants.cleaningtxt,
        ),
      ],
    );
  }
}
