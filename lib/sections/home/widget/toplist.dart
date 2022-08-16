import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music/res/colors.dart';
import 'package:flutter_music/res/other_theme.dart';
import 'package:flutter_music/sections/home/models/home.dart';
import 'package:flutter_music/sections/home/page/action.dart';
import 'package:flutter_music/sections/home/widget/image.dart';
import 'package:flutter_music/utils/colorUtils.dart';
import 'package:flutter_music/widgets/card.dart';

class ToplistItemWidget extends StatefulWidget {
  final CreativesItem? item;
  final double? size;
  final Dispatch? dispatch;

  ToplistItemWidget({this.item, this.size, this.dispatch});

  @override
  _ToplistItemWidgetState createState() => _ToplistItemWidgetState();
}

class _ToplistItemWidgetState extends State<ToplistItemWidget> {
  bool hasHeader = false;
  @override
  void initState() {
    super.initState();

    hasHeader = widget.item!.uiElement?.mainTitle != null &&
        widget.item!.uiElement?.mainTitle?.title != null;
  }

  @override
  Widget build(BuildContext context) {
    return GpCard(
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.only(top: 5, bottom: 5),
      width: widget.size,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (hasHeader)
            Padding(
              padding: EdgeInsets.only(top: 10, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildLeftWidget(context),
                  if (widget.item?.uiElement?.mainTitle?.titleDesc != null)
                    Text(
                      widget.item?.uiElement?.mainTitle?.titleDesc ?? "",
                      style: GpOtherTheme.size13(context)!
                          .copyWith(color: CommonColors.textColor999),
                    )
                ],
              ),
            ),
          if (widget.item?.resources != null &&
              widget.item?.resources?.isNotEmpty == true)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: widget.item!.resources!
                  .map((e) => _buildItem(
                      context, e, widget.item!.resources!.indexOf(e)))
                  .toList(),
            )
        ],
      ),
    );
  }

  Widget _buildLeftWidget(BuildContext context) {
    return Row(
      children: [
        Text(
          widget.item?.uiElement?.mainTitle?.title ?? "",
          style: GpOtherTheme.size15(context)!
              .copyWith(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        Padding(
          padding: EdgeInsets.only(left: 5),
          child: Icon(Icons.arrow_forward_ios),
        )
      ],
    );
  }

  Widget _buildItem(
      BuildContext context, ResourcesItem resourcesItem, int index) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: GestureDetector(
        onTap: () {
          if (widget.dispatch != null) {
            widget.dispatch!(
                HomeMusicActionCreator.onTapToplistItemAction(resourcesItem));
          }
        },
        child: Row(
          children: [
            ImageItemWidget(
              url: resourcesItem.uiElement?.image?.imageUrl,
              width: 60,
              height: 60,
              fit: BoxFit.fill,
            ),
            Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Text(
                "${index + 1}",
                style: GpOtherTheme.size15(context)!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
                child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    resourcesItem.uiElement?.mainTitle?.title ?? "",
                    softWrap: true,
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: GpOtherTheme.size17(context),
                  ),
                  Text(
                    _getNamed(resourcesItem),
                    softWrap: true,
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: GpOtherTheme.size13(context)!
                        .copyWith(color: CommonColors.textColor999),
                  )
                ],
              ),
            )),
            _buildIndicator(resourcesItem)
          ],
        ),
      ),
    );
  }

  String _getNamed(ResourcesItem resourcesItem) {
    String named = "";
    if (resourcesItem.resourceExtInfo?.artists != null &&
        resourcesItem.resourceExtInfo?.artists?.isNotEmpty == true) {
      for (ResourceExtInfoArtists artists
          in resourcesItem.resourceExtInfo!.artists!) {
        if (named.isEmpty) {
          named = artists.name ?? "";
        } else {
          named += "/${artists.name}";
        }
      }
    }
    return named;
  }

  Widget _buildIndicator(ResourcesItem resourcesItem) {
    String named = resourcesItem.uiElement?.labelText?.text ?? "";

    Color indicatorColor = Colors.red;
    if (ColorUtils.colorMap()
        .containsKey(resourcesItem.uiElement?.labelText?.textColor ?? "")) {
      indicatorColor = ColorUtils.colorMap()[
          resourcesItem.uiElement!.labelText?.textColor!]!;
    }

    return Container(
      padding: EdgeInsets.only(left: 2, top: 2, bottom: 2, right: 2),
      margin: EdgeInsets.only(left: 15),
      decoration: BoxDecoration(
          color: indicatorColor.withOpacity(0.1),
          borderRadius: BorderRadius.all(Radius.circular(4.0))),
      child: Text(
        resourcesItem.uiElement?.labelText?.text ?? "",
        style: GpOtherTheme.size12(context)!
            .copyWith(color: indicatorColor, fontWeight: FontWeight.bold),
      ),
    );
  }
}
