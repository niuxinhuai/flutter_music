import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music/repository/services/common_service.dart';
import 'package:flutter_music/res/colors.dart';
import 'package:flutter_music/res/other_theme.dart';
import 'package:flutter_music/sections/video/models/comment.dart';
import 'package:flutter_music/sections/video/widget/video_player.dart';
import 'package:flutter_music/widgets/loading_wrap.dart';

class VideoCommentPage extends StatefulWidget {
  final String? vid;
  final String? url;
  final Duration? position;
  final double? width;

  VideoCommentPage({this.vid, this.url, this.position, this.width});

  @override
  _VideoCommentPageState createState() => _VideoCommentPageState();
}

class _VideoCommentPageState extends State<VideoCommentPage> {
  LoadingState loadingState = LoadingState.isLoading;
  VideoCommentWrap? commentWrap;
  List<String> titles = ["推荐", "最热", "最新"];
  int selectIndex = 0;
  List<VideoCommentItem> items = [];

  @override
  void initState() {
    super.initState();
    _getCommentDataSource();
  }

  void _getCommentDataSource() async {
    VideoCommentWrap? wrap =
        await CommonService.getVideoComment(widget.vid!).catchError((e) {
      if (mounted) {
        setState(() {
          loadingState = LoadingState.error;
        });
      }
    });
    if (mounted) {
      setState(() {
        if (wrap != null) {
          loadingState = LoadingState.success;
          commentWrap = wrap;
          if (commentWrap?.comments != null &&
              commentWrap?.comments?.isNotEmpty == true) {
            items = commentWrap!.comments!;
          }
        } else {
          loadingState = LoadingState.error;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          constraints: BoxConstraints(
            maxHeight: 250,
          ),
          child: Hero(
              tag: widget.url!,
              child: VideoPlayerWidget(
                url: widget.url,
                position: widget.position,
                onTapVideo: () {
                  Navigator.pop(context);
                },
              )),
        ),
        Expanded(
          child: Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: widget.width,
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.keyboard_arrow_down,
                    size: 30,
                  ),
                ),
                _buildTab(),
                Expanded(
                  child: LoadingWrap(
                    loadingState: loadingState,
                    onErrorTap: () {
                      _getCommentDataSource();
                    },
                    successChild: Builder(
                      builder: (context) {
                        return ListView.builder(
                          padding:
                              EdgeInsets.only(top: 20, bottom: 30, left: 20),
                          itemCount: items.length,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            VideoCommentItem item = items[index];
                            return _buildItem(item);
                          },
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        _buildBottomTextfield(),
      ],
    );
  }

  Widget _buildItem(VideoCommentItem item) {
    double size = 36.0;
    VideoBeRepliedItem? beRepliedItem;
    //是否有回复
    bool hasBeReplized = item.beReplied?.isNotEmpty == true;
    if (hasBeReplized) {
      beRepliedItem = item.beReplied!.first;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(size / 2.0)),
              child: CachedNetworkImage(
                imageUrl: item.user?.avatarUrl ?? "",
                fit: BoxFit.fill,
                width: size,
                height: size,
              ),
            ),
            Expanded(
                child: Padding(
              padding: EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.user?.nickname ?? "",
                    style: GpOtherTheme.size15(context)!
                        .copyWith(color: CommonColors.textColor666),
                  ),
                  Text(
                    item.timeStr ?? "",
                    style: GpOtherTheme.size12(context)!.copyWith(
                        color: CommonColors.textColor999, fontSize: 10),
                  ),
                ],
              ),
            )),
            Padding(
              padding: EdgeInsets.only(right: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  if (item.likedCount != null && item.likedCount != 0)
                    Text(
                      '${item.likedCount ?? 0}',
                      style: GpOtherTheme.size13(context)!
                          .copyWith(color: CommonColors.textColor999),
                    ),
                  Image.asset("assets/images/cm6_video_icn_praise~iphone.png")
                ],
              ),
            )
          ],
        ),
        Padding(
          padding: EdgeInsets.only(left: size + 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.content ?? "",
                softWrap: true,
                maxLines: 10,
                textAlign: TextAlign.left,
                overflow: TextOverflow.ellipsis,
                style: GpOtherTheme.size17(context),
              ),
              if (hasBeReplized)
                Container(
                  margin: EdgeInsets.only(right: 20, top: 10),
                  width: double.infinity,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: CommonColors.backgroundColor,
                      borderRadius: BorderRadius.all(Radius.circular(8.0))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                            text: beRepliedItem?.user?.nickname,
                            style: GpOtherTheme.size15(context)!
                                .copyWith(color: Colors.blue),
                            children: [
                              TextSpan(
                                text: ": ${beRepliedItem?.content ?? ""}",
                                style: GpOtherTheme.size17(context),
                              )
                            ]),
                        softWrap: true,
                        maxLines: 5,
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.ellipsis,
                      ),
                      if (item.beReplied!.length >= 2)
                        Text(
                          "${item.beReplied!.length}条回复 >",
                          style: GpOtherTheme.size13(context)!
                              .copyWith(color: Colors.blue),
                        ),
                    ],
                  ),
                ),
            ],
          ),
        ),
        Container(
          height: 1,
          width: double.infinity,
          margin: EdgeInsets.only(left: size + 10, top: 15, bottom: 15),
          color: CommonColors.divider,
        )
      ],
    );
  }

  Widget _buildTab() {
    return Container(
      width: widget.width,
      height: 50,
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [_buildCommentCountWidget(), _buildSegment()],
      ),
    );
  }

  Widget _buildCommentCountWidget() {
    int count = commentWrap?.total ?? 0;
    return Text(
      "评论${count == 0 ? "" : "($count)"}",
      style:
          GpOtherTheme.size15(context)!.copyWith(fontWeight: FontWeight.bold),
    );
  }

  Widget _buildSegment() {
    return Row(
      children: titles.map((e) {
        bool last = titles.last == e;
        int index = titles.indexOf(e);
        return GestureDetector(
          onTap: () {
            if (selectIndex != index) {
              setState(() {
                if (mounted) {
                  items = [];
                  selectIndex = index;
                  if (selectIndex == 0) {
                    if (commentWrap?.comments != null &&
                        commentWrap?.comments?.isNotEmpty == true) {
                      items = commentWrap!.comments!;
                    }
                  } else {
                    if (commentWrap?.hotComments != null &&
                        commentWrap?.hotComments?.isNotEmpty == true) {
                      items = commentWrap!.hotComments!;
                    }
                  }
                }
              });
            }
          },
          child: Row(
            children: [
              Text(
                e,
                style: GpOtherTheme.size13(context)!.copyWith(
                    color: selectIndex == index
                        ? CommonColors.onSurfaceTextColor
                        : CommonColors.textColor999,
                    fontWeight: FontWeight.bold),
              ),
              if (last == false)
                Container(
                  width: 1,
                  height: 15,
                  color: CommonColors.divider,
                  margin: EdgeInsets.only(left: 10, right: 10),
                )
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildBottomTextfield() {
    return Container(
      width: widget.width,
      margin: EdgeInsets.only(bottom: 50),
      decoration: BoxDecoration(
          color: CommonColors.foregroundColor,
          border:
              Border(top: BorderSide(color: CommonColors.divider, width: 1))),
      padding: EdgeInsets.only(left: 20, right: 20, top: 5),
      child: Row(
        children: [
          Expanded(
              child: Container(
            decoration: BoxDecoration(
                color: CommonColors.backgroundColor,
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            padding: EdgeInsets.only(top: 10, bottom: 10, left: 20),
            child: Text(
              "随乐而起，有感而发",
              style: GpOtherTheme.size15(context)!
                  .copyWith(color: CommonColors.textColor999),
            ),
          )),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Image.asset("assets/images/cm4_edit_customemoji~iphone.png"),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child:
                Image.asset("assets/images/cm8_input_biubiubiu_off~iphone.png"),
          )
        ],
      ),
    );
  }
}
