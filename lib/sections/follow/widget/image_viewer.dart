import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music/helper/router.dart';
import 'package:flutter_music/widgets/appbar.dart';
import 'package:photo_view/photo_view.dart';

class ImageViewer extends StatefulWidget {
  final String? url;

  ImageViewer({this.url});

  @override
  _ImageViewerState createState() => _ImageViewerState();
}

class _ImageViewerState extends State<ImageViewer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: GpAppBar(
        backgroundColor: Colors.transparent,
        leading: Container(
          width: 0,
          height: 0,
        ),
        actions: [
          UnconstrainedBox(
            child: GestureDetector(
              onTap: () {
                ARouter.pop(context);
              },
              child: Icon(
                Icons.close,
                color: Colors.white,
                size: 30,
              ),
            ),
          )
        ],
      ),
      body: PhotoView.customChild(
          minScale: 0.8,
          maxScale: 1.5,
          child: Hero(
            tag: widget.url!,
            child: CachedNetworkImage(
              imageUrl: widget.url!,
              fit: BoxFit.fitWidth,
            ),
          )),
    );
  }
}
