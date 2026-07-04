import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music/res/colors.dart';
import 'package:flutter_music/utils/image_url_utils.dart';

class ImageItemWidget extends StatelessWidget {
  final String? url;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final BorderRadius? borderRadius;
  final bool? needAddParam;

  ImageItemWidget({
    this.url,
    this.width,
    this.height,
    this.fit,
    this.borderRadius,
    this.needAddParam = false,
  });

  @override
  Widget build(BuildContext context) {
    String imgUrl = ImageUrlUtils.normalizeMusicImageUrl(url ?? "");
    final radius = borderRadius ?? BorderRadius.all(Radius.circular(8.0));
    if (imgUrl.isEmpty) {
      return ClipRRect(
        borderRadius: radius,
        child: Container(
          width: width,
          height: height,
          color: CommonColors.disableColor,
        ),
      );
    }
    if (needAddParam! == true) {
      imgUrl =
          imgUrl +
          (width != null
              ? "${imgUrl.contains("?") ? "&" : "?"}param=${width!.toInt()}${height != null ? "y${height!.toInt()}" : ""}"
              : "");
    }
    int? cacheWidth = width != null ? width!.toInt() : null;
    int? cacheHeight = height != null ? height!.toInt() : null;
    return ClipRRect(
      borderRadius: radius,
      //      child: Image.network(
      //        imgUrl,
      //        width: width,
      //        height: height,
      //        fit: fit,
      //      ),
      child: CachedNetworkImage(
        //        imageUrl: url ?? "",
        imageUrl: imgUrl,
        httpHeaders: ImageUrlUtils.musicImageHeaders,
        width: width,
        height: height,
        fit: fit,
        memCacheWidth: cacheWidth,
        memCacheHeight: cacheHeight,
        errorWidget:
            (context, url, error) => Container(
              width: width,
              height: height,
              color: CommonColors.disableColor,
            ),
      ),
    );
  }
}
