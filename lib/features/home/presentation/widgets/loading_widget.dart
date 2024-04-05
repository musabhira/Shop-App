import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shopapp/features/home/domain/entites/service_entity.dart';

class LoadingCategoryWidget extends StatelessWidget {
  final List<ServiceEntity> entity;
  const LoadingCategoryWidget({super.key, required this.entity});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
          child: Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 6.50,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
