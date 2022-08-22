import 'package:flutter/material.dart';
import 'package:flutter_music/res/colors.dart';
import 'package:flutter_music/res/other_theme.dart';
import 'package:flutter_music/sections/home/widget/image.dart';
import 'package:flutter_music/sections/music/widget/play_count.dart';
import 'package:flutter_music/sections/music/widget/user_focus.dart';
import 'package:flutter_music/sections/podcast/models/detail.dart';
import 'package:flutter_music/sections/podcast/models/podcast.dart';
import 'package:flutter_music/sections/podcast/widget/detail_header_sheet.dart';
import 'package:flutter_music/utils/colorUtils.dart';
import 'package:flutter_music/widgets/child/collect_widget.dart';
import 'package:flutter_music/widgets/child/comment_widget.dart';
import 'package:flutter_music/widgets/child/share_widget.dart';

class DetailHeaderWidget extends StatelessWidget {
  final PodcastDetailWrap? wrap;
  final int? playCount;

  DetailHeaderWidget({this.wrap, this.playCount});

  @override
  Widget build(BuildContext context) {
    List<DetailIndicatorModel> models = [];
    if (wrap?.data?.categoryId != null) {
      DetailIndicatorModel model = DetailIndicatorModel();
      model.id = wrap?.data?.categoryId;
      model.title = wrap?.data?.category;
      models.add(model);
    }

    if (wrap?.data?.secondCategoryId != null) {
      DetailIndicatorModel model = DetailIndicatorModel();
      model.id = wrap?.data?.secondCategoryId;
      model.title = wrap?.data?.secondCategory;
      models.add(model);
    }

    int itemPlayCount = playCount ?? 0;
    if (wrap?.data?.playCount != null && wrap?.data?.playCount != 0) {
      itemPlayCount = wrap!.data!.playCount!;
    }

    return Stack(
      children: [
        Positioned.fill(
            child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [
                  0,
                  0.6,
                  1
                ],
                colors: [
                  Colors.transparent,
                  Colors.white.withOpacity(0.5),
                  Colors.white
                ]),
          ),
        )),
        Container(
          padding: EdgeInsets.only(left: 15, right: 15, top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      GestureDetector(
                        onTap: () {
                          _showBottomSheet(context);
                        },
                        child: ImageItemWidget(
                          url: wrap?.data?.picUrl ?? "",
                          width: 120,
                          height: 120,
                        ),
                      ),
                      Positioned.fill(
                          child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          if (wrap?.data?.icon != null)
                            _buildIcon(wrap!.data!.icon!, context),
                          if (wrap?.data?.icon == null)
                            Container(
                              width: 20,
                              height: 0,
                            ),
                          PlayCountWidget(
                            count: itemPlayCount,
                          )
                        ],
                      ))
                    ],
                  ),
                  Expanded(
                      child: Container(
                    padding: EdgeInsets.only(left: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              wrap?.data?.name ?? "",
                              softWrap: true,
                              textAlign: TextAlign.left,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: GpOtherTheme.size17(context)!.copyWith(
                                  color: CommonColors.onPrimaryTextColor),
                            ),
                            if (wrap?.data?.dj != null) _buildUser(context),
                          ],
                        ),
                        if (models.isNotEmpty == true)
                          _buildIndicator(context, models),
                      ],
                    ),
                  ))
                ],
              ),
              _buildDetail(context),
              _buildBottomCount(context),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildIcon(RadiosIcon icon, BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 5, right: 5, top: 2, bottom: 2),
      decoration: BoxDecoration(
          color: HexColor(icon.color!),
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      child: Text(
        icon.value ?? "",
        style: GpOtherTheme.size12(context)!
            .copyWith(color: CommonColors.onPrimaryTextColor, fontSize: 10),
      ),
    );
  }

  Widget _buildUser(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 1),
      child: DetailUserFocusWidget(
        avatarUrl: wrap?.data?.dj?.avatarUrl,
        name: wrap?.data?.dj?.nickname,
      ),
    );
  }

  Widget _buildIndicator(
      BuildContext context, List<DetailIndicatorModel> models) {
    return Container(
      height: 30,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: models.map((e) => _buildIndicatorItem(e, context)).toList(),
      ),
    );
  }

  Widget _buildIndicatorItem(DetailIndicatorModel model, BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.2),
          borderRadius: BorderRadius.all(Radius.circular(3.0))),
      padding: EdgeInsets.all(6.0),
      child: Row(
        children: [
          Text(
            model.title ?? "",
            style: GpOtherTheme.size12(context)!
                .copyWith(color: CommonColors.onPrimaryTextColor),
          ),
          Icon(
            Icons.arrow_forward_ios,
            size: 10,
            color: CommonColors.textColorDDD,
          )
        ],
      ),
    );
  }

  Widget _buildDetail(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showBottomSheet(context);
      },
      child: Padding(
        padding: EdgeInsets.only(top: 15, bottom: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
                child: Text(
              wrap?.data?.desc ?? "",
              maxLines: 3,
              softWrap: true,
              textAlign: TextAlign.left,
              overflow: TextOverflow.ellipsis,
              style: GpOtherTheme.size13(context)!
                  .copyWith(color: CommonColors.textColorDDD),
            )),
            Icon(
              Icons.arrow_forward_ios,
              color: CommonColors.textColorDDD,
              size: 14,
            )
          ],
        ),
      ),
    );
  }

  Widget _buildBottomCount(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ShareWidget(
            count: wrap?.data?.shareCount ?? 0,
          ),
          CommentWidget(count: wrap?.data?.commentCount ?? 0),
          CollectWidget(
            collectCount: wrap?.data?.subCount ?? 0,
          ),
        ],
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext context) {
          return PodcastHeaderSheetWidget(
            wrap: wrap,
            size: size,
            popBack: () {
              Navigator.pop(context);
            },
            collectBack: () {
              Navigator.pop(context);
            },
          );
        },
        backgroundColor: Colors.transparent);
  }
}
