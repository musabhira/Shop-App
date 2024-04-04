import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopapp/features/home/domain/entites/service_entity.dart';
import 'package:shopapp/features/home/presentation/providers/service_provider.dart';

import '../../../../core/themes/app_theme.dart';

class ServiceListviewWidget extends HookConsumerWidget {
  final List<ServiceEntity> entity;
  const ServiceListviewWidget({super.key, required this.entity});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = AppTheme.of(context);

    return ListView.builder(
      itemCount: entity.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
          child: Stack(children: [
            Container(
              height: MediaQuery.sizeOf(context).height / 6.50,
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: theme.spaces.space_200, right: 15),
                    child: Container(
                      height: MediaQuery.sizeOf(context).height / 9,
                      width: MediaQuery.sizeOf(context).width / 4.20,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: const DecorationImage(
                              image: NetworkImage(
                                  "https://www.homecaresolutions.in/assets/images/newimage/Get%20A%20Deep%20Clean.jpg"),
                              fit: BoxFit.cover)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: theme.spaces.space_250),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ///Row 1
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.star,
                              size: 17,
                              color: Colors.amber,
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(left: theme.spaces.space_100),
                              child: Text(
                                "(4.2/5) 23 orders",
                                style:
                                    TextStyle(color: theme.colors.textSubtle),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          entity[index].service,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        const Text(
                          "60 Minutes",
                          style: TextStyle(color: Colors.grey),
                        ),
                        const Text(
                          "₹ 499.00",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w800),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  height: MediaQuery.sizeOf(context).height / 23,
                  width: MediaQuery.sizeOf(context).width / 5,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15)),
                    color: Colors.green,
                  ),
                  child: const Center(
                    child: Text(
                      "Add +",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 15),
                    ),
                  ),
                ))
          ]),
        );
      },
    );
  }
}
