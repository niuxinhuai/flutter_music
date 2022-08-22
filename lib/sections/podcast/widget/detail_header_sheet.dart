import 'package:flutter/material.dart';
import 'package:flutter_music/res/colors.dart';
import 'package:flutter_music/res/other_theme.dart';
import 'package:flutter_music/sections/home/widget/image.dart';
import 'package:flutter_music/sections/podcast/models/detail.dart';
import 'package:flutter_music/widgets/appbar.dart';
import 'package:flutter_music/widgets/child/collect_widget.dart';
import 'package:flutter_music/widgets/effect.dart';

class PodcastHeaderSheetWidget extends StatelessWidget {
  final PodcastDetailWrap? wrap;
  final VoidCallback? popBack;
  final VoidCallback? collectBack;
  final Size? size;

  PodcastHeaderSheetWidget(
      {this.wrap, this.popBack, this.collectBack, this.size});

  @override
  Widget build(BuildContext context) {
    if (wrap == null) {
      return Container(
        width: 0,
        height: 0,
      );
    }
    print('>>>>>>>>>.width:${double.infinity}');
    return Container(
      width: size?.width,
      height: size?.height,
      child: Stack(
        children: [
          EffectWidget(),
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: GpAppBar(
              leading: Container(
                width: 0,
                height: 0,
              ),
              elevation: 0,
              backgroundColor: Colors.transparent,
            ),
            body: SingleChildScrollView(
              padding: EdgeInsets.only(left: 15, right: 15, bottom: 30),
              child: Column(
                children: [
                  _buildAppbar(context),
                  _buildAva(context),
                  Padding(
                    padding: EdgeInsets.only(top: 20, bottom: 20),
                    child: Text(
                      wrap?.data?.name ?? "",
                      style: GpOtherTheme.size17(context)!
                          .copyWith(color: CommonColors.onPrimaryTextColor),
                    ),
                  ),
                  Container(
                    color: CommonColors.divider,
                    width: double.infinity,
                    height: 1,
                    margin: EdgeInsets.only(bottom: 20),
                  ),
                  if (wrap?.data?.desc != null) _buildDescription(context),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 40,
            width: size?.width,
            child: UnconstrainedBox(
              child: Container(
                child: CollectWidget(
                  collectCount: wrap?.data?.subCount,
                  showRedBg: false,
                  callback: () {
                    if (collectBack != null) {
                      collectBack!();
                    }
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  GpAppBar _buildAppbar(BuildContext context) {
    return GpAppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: Container(
        width: 0,
        height: 0,
      ),
      actions: [
        GestureDetector(
          onTap: () {
            if (popBack != null) {
              popBack!();
            }
          },
          child: Icon(
            Icons.close,
            color: CommonColors.foregroundColor,
            size: 40,
          ),
        )
      ],
    );
  }

  Widget _buildAva(BuildContext context) {
    return ImageItemWidget(
      url: wrap?.data?.picUrl ?? "",
      width: 200,
      height: 200,
    );
  }

  ///description
  Widget _buildDescription(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 15),
          child: Text(
            "内容简介",
            style: GpOtherTheme.size15(context)!
                .copyWith(color: CommonColors.onPrimaryTextColor),
          ),
        ),
        Text(
          wrap?.data?.desc ?? "",
          maxLines: 1000,
          style: GpOtherTheme.size15(context)!.copyWith(
              color: CommonColors.textColorDDD, fontSize: 13, height: 2.0),
        )
      ],
    );
  }
}
