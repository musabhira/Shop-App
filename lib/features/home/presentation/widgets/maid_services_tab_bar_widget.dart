import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopapp/features/home/presentation/providers/service_provider.dart';
import 'package:shopapp/features/home/presentation/widgets/loading_widget.dart';
import 'package:shopapp/features/home/presentation/widgets/service_listview_widget.dart';

class MaidServicesTapbarWidget extends ConsumerWidget {
  const MaidServicesTapbarWidget({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 240, 237, 237),
        body: ref.watch(getServiceProvider).isLoading
            ? const Center(
                child: LoadingCategoryWidget(
                entity: [],
              ))
            : switch (ref.watch(getServiceProvider)) {
                AsyncData(:final value) => ServiceListviewWidget(
                    entity: value,
                  ),
                AsyncError(:final error, :final stackTrace) => Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(error.toString()),
                        Text(stackTrace.toString()),
                        IconButton(
                          onPressed: () {
                            ref.invalidate(getServiceProvider);
                          },
                          icon: const Icon(Icons.refresh),
                        )
                      ],
                    ),
                  ),
                _ => const Center(
                      child: LoadingCategoryWidget(
                    entity: [],
                  )),
              });
  }
}
