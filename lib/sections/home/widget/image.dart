import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music/res/colors.dart';

class ImageItemWidget extends StatelessWidget {
  final String? url;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final BorderRadius? borderRadius;
  final bool? needAddParam;

  ImageItemWidget(
      {this.url,
      this.width,
      this.height,
      this.fit,
      this.borderRadius,
      this.needAddParam = false});

  @override
  Widget build(BuildContext context) {
    String imgUrl = url!;
    if (needAddParam! == true) {
      imgUrl = url! +
          (width != null
              ? "?param=${width!}${height != null ? "y${height!}" : ""}"
              : "");
    }
    int? cacheWidth = width != null ? width!.toInt() : null;
    int? cacheHeight = height != null ? height!.toInt() : null;
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.all(Radius.circular(8.0)),
//      child: Image.network(
//        imgUrl,
//        width: width,
//        height: height,
//        fit: fit,
//      ),
      child: CachedNetworkImage(
//        imageUrl: url ?? "",
        imageUrl: imgUrl,
        width: width,
        height: height,
        fit: fit,
        memCacheWidth: cacheWidth,
        memCacheHeight: cacheHeight,
      ),
    );
  }
}
