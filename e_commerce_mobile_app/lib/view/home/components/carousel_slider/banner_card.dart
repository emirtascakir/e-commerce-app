import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_mobile_app/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class BannerCard extends StatelessWidget {
  const BannerCard({super.key, required this.imageUrl});
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        child: CachedNetworkImage(
          imageUrl: '$baseUrl$imageUrl',
          fit: BoxFit.cover,
          width: double.infinity,
          progressIndicatorBuilder: (context, url, progress) =>
              Shimmer.fromColors(
            highlightColor: Colors.white,
            baseColor: Colors.grey.shade300,
            child: Container(
              margin: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Container(
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
