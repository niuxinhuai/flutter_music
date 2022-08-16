import 'package:flutter/material.dart';
import 'package:flutter_music/res/colors.dart';
import 'package:flutter_music/res/other_theme.dart';
import 'package:flutter_music/sections/home/widget/image.dart';
import 'package:flutter_music/sections/square/models/playlist.dart';
import 'package:flutter_music/widgets/appbar.dart';
import 'package:flutter_music/widgets/effect.dart';

class DetailSheetWidget extends StatelessWidget {
  final PlaylistStage? stage;
  final VoidCallback? callback;
  final double? top;

  DetailSheetWidget({this.stage, this.callback, this.top});

  @override
  Widget build(BuildContext context) {
    if (stage == null) {
      return Container(
        width: 0,
        height: 0,
      );
    }
    return Container(
      width: double.infinity,
      height: double.infinity,
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
                    padding: EdgeInsets.only(top: 30, bottom: 20),
                    child: Text(
                      stage?.name ?? "",
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
                  if (stage?.tags != null && stage?.tags?.length != null)
                    _buildTag(context),
                  if (stage?.description != null) _buildDescription(context),
                ],
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
      title: Container(
        padding: EdgeInsets.only(left: 3, right: 3),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
            border: Border.all(color: CommonColors.foregroundColor)),
        child: Text(
          "精品歌单",
          style: GpOtherTheme.size17(context)!
              .copyWith(color: CommonColors.onPrimaryTextColor, fontSize: 13),
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {
            if (callback != null) {
              callback!();
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
    return Stack(
      children: [
        ImageItemWidget(
          url: stage?.coverImgUrl ?? "",
          width: 200,
          height: 200,
        ),
        ClipRRect(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(8.0)),
          child: Image.asset("assets/images/cm6_list_sup_hot_big~iphone.png"),
        ),
      ],
    );
  }

  ///标签
  Widget _buildTag(BuildContext context) {
    return Row(
      children: [
        Text(
          "标签",
          style: GpOtherTheme.size15(context)!
              .copyWith(color: CommonColors.onPrimaryTextColor),
        ),
        Row(
          children: stage!.tags!
              .map((e) => Container(
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    padding:
                        EdgeInsets.only(left: 8, right: 8, top: 2, bottom: 2),
                    margin: EdgeInsets.only(left: 10),
                    child: Text(
                      e,
                      style: GpOtherTheme.size13(context)!
                          .copyWith(color: CommonColors.onPrimaryTextColor),
                    ),
                  ))
              .toList(),
        )
      ],
    );
  }

  ///description
  Widget _buildDescription(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: Text(
        stage?.description ?? "",
        maxLines: 1000,
        style: GpOtherTheme.size15(context)!
            .copyWith(color: CommonColors.onPrimaryTextColor),
      ),
    );
  }
}
