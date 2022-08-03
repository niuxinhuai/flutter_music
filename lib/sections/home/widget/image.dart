import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageItemWidget extends StatelessWidget {
  final String? url;
  final double? width;
  final double? height;
  final BoxFit? fit;

  ImageItemWidget({this.url, this.width, this.height, this.fit});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
      child: CachedNetworkImage(
        imageUrl: url ?? "",
        width: width,
        height: height,
        fit: fit,
      ),
    );
  }
}
