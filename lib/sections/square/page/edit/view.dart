import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music/res/colors.dart';
import 'package:flutter_music/res/other_theme.dart';
import 'package:flutter_music/sections/square/models/catlist.dart';
import 'package:flutter_music/widgets/appbar.dart';
import 'package:flutter_music/widgets/loading_wrap.dart';
import 'package:reorderables/reorderables.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    SquareEditState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    appBar: GpAppBar(
      title: Text("所有歌单"),
      elevation: 0,
    ),
    backgroundColor: CommonColors.foregroundColor,
    body: LoadingWrap(
      loadingState: state.loadingState,
      successChild: Builder(
        builder: (context) {
          return _buildbody(state, dispatch, viewService);
        },
      ),
    ),
  );
}

Widget _buildbody(
    SquareEditState state, Dispatch dispatch, ViewService viewService) {
  return SingleChildScrollView(
    padding: EdgeInsets.only(left: 15, right: 15, bottom: 30, top: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: state.sections!
          .map((e) => _buildItem(state, dispatch, viewService, e))
          .toList(),
    ),
  );
}

Widget _buildItem(SquareEditState state, Dispatch dispatch,
    ViewService viewService, CatlistSectionModel sectionModel) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      if (sectionModel.canEdit == false)
        Text(
          sectionModel.value ?? "",
          style: GpOtherTheme.size15(viewService.context)!
              .copyWith(fontWeight: FontWeight.bold),
        ),
      if (sectionModel.canEdit == true)
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RichText(
              text: TextSpan(
                  text: sectionModel.value ?? "",
                  style: GpOtherTheme.size15(viewService.context)!
                      .copyWith(fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(
                        text: sectionModel.sub ?? "",
                        style: GpOtherTheme.size13(viewService.context)!
                            .copyWith(color: CommonColors.textColor999))
                  ]),
            ),
            GestureDetector(
              onTap: () =>
                  dispatch(SquareEditActionCreator.didTapEditButtonAction()),
              child: Container(
                padding:
                    EdgeInsets.only(left: 20, right: 20, top: 4, bottom: 5),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.red),
                    borderRadius: BorderRadius.all(Radius.circular(15.0))),
                child: Text(
                  state.editing! ? "完成" : "编辑",
                  style: GpOtherTheme.size13(viewService.context)!
                      .copyWith(color: Colors.red),
                ),
              ),
            )
          ],
        ),
      if (sectionModel.isUser() == false)
        _buildGridView(state, dispatch, viewService, sectionModel),
      if (sectionModel.isUser() == true)
        _buildReoderableView(state, dispatch, viewService, sectionModel)
    ],
  );
}

Widget _buildGridView(SquareEditState state, Dispatch dispatch,
    ViewService viewService, CatlistSectionModel sectionModel) {
  return GridView.builder(
      itemCount: sectionModel.items?.length ?? 0,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.only(top: 15, bottom: 20),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 10,
          mainAxisSpacing: 20,
          childAspectRatio: 2.5),
      itemBuilder: (BuildContext context, int index) {
        CatlistSubItem item = sectionModel.items![index];
        return _buildItemWidget(
            state, dispatch, viewService, sectionModel, item);
      });
}

Widget _buildReoderableView(SquareEditState state, Dispatch dispatch,
    ViewService viewService, CatlistSectionModel sectionModel) {
  double size = MediaQuery.of(viewService.context).size.width;
  double itemSize = (size - 30 - 30) / 4.0;
  List<Widget> children = sectionModel.items!
      .map((e) => SizedBox(
            width: itemSize,
            child:
                _buildItemWidget(state, dispatch, viewService, sectionModel, e),
          ))
      .toList();

  return ReorderableWrap(
    children: children,
    onReorder: (oldIndex, newIndex) => dispatch(
        SquareEditActionCreator.didReorderAction(Tuple2(oldIndex, newIndex))),
    runSpacing: 20,
    spacing: 10,
    padding: EdgeInsets.only(top: 15, bottom: 20),
    buildDraggableFeedback:
        (BuildContext context, BoxConstraints constraints, Widget child) {
      return Material(
        color: Colors.transparent,
        child: child,
      );
    },
  );
}

Widget _buildItemWidget(
    SquareEditState state,
    Dispatch dispatch,
    ViewService viewService,
    CatlistSectionModel sectionModel,
    CatlistSubItem item) {
  return Stack(
    alignment: AlignmentDirectional.center,
    children: [
      GestureDetector(
        onTap: () {
          if (state.editing! == true) {
            dispatch(
                SquareEditActionCreator.onTapItemAction(item, sectionModel));
          }
        },
        child: Container(
          padding: EdgeInsets.only(top: 8, bottom: 8),
          decoration: BoxDecoration(
              color: CommonColors.divider,
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (item.hot != null &&
                  item.hot == true &&
                  state.editing! == false)
                Padding(
                  padding: EdgeInsets.only(right: 3),
                  child: Image.asset(
                    'assets/images/cm8_video_icn_fire~iphone.png',
                    color: Colors.red,
                  ),
                ),
              if (state.editing! == true && item.canMove == true)
                Icon(
                  (item.inTop! && sectionModel.isUser())
                      ? Icons.remove
                      : Icons.add,
                  color: CommonColors.onSurfaceTextColor,
                  size: 13,
                ),
              Container(
                child: Text(
                  item.name ?? "",
                  style: GpOtherTheme.size15(viewService.context),
                  maxLines: 1,
                  softWrap: true,
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                ),
                constraints: BoxConstraints(maxWidth: 70),
              )
            ],
          ),
        ),
      ),
      if (item.inTop == true && sectionModel.isUser() == false ||
          (sectionModel.isUser() &&
              item.canMove == false &&
              state.editing! == true))
        Positioned.fill(
          child: Container(
            color: Colors.white.withOpacity(0.6),
          ),
        )
    ],
  );
}
