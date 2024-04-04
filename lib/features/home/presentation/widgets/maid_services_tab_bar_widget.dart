import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopapp/core/themes/app_theme.dart';
import 'package:shopapp/features/home/presentation/providers/service_provider.dart';
import 'package:shopapp/features/home/presentation/widgets/loading_widget.dart';
import 'package:shopapp/features/home/presentation/widgets/service_listview_widget%20.dart';

class MaidServicesTapbarWidget extends ConsumerWidget {
  const MaidServicesTapbarWidget({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 240, 237, 237),
        body: switch (ref.watch(getServiceProvider)) {
          AsyncData(:final value) => ServiceListviewWidget(
              entity: value,
            ),
          AsyncError() => const Center(
              child: Text('Error while getting data'),
            ),
          _ => const Center(child: LoadingCategoryWidget()),
        });
  }
}
