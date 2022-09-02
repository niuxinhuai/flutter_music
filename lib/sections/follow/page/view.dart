import 'package:cached_network_image/cached_network_image.dart';
import 'package:extended_image/extended_image.dart';
import 'package:extended_list/extended_list.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music/helper/router.dart';
import 'package:flutter_music/res/colors.dart';
import 'package:flutter_music/res/other_theme.dart';
import 'package:flutter_music/sections/follow/widget/image_viewer.dart';
import 'package:flutter_music/widgets/appbar.dart';
import 'package:flutter_music/widgets/loading_wrap.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:photo_view/photo_view.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    MyFocusState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    appBar: GpAppBar(
      title: GestureDetector(
        child: Text("PDF"),
        onTap: () {
          dispatch(MyFocusActionCreator.onAction());
        },
      ),
      leading: Container(
        width: 0,
        height: 0,
      ),
    ),
    body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
//      height: 100,
          color: Colors.white,
          padding: EdgeInsets.only(left: 0, top: 10, bottom: 10, right: 17),
          child: Row(
            children: [
              Container(
                width: 36,
                height: 36,
                color: Colors.red,
                margin: EdgeInsets.only(left: 15, right: 10),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
//                      color: Colors.cyan,
                      child: Row(
                        children: [
                          Text(
                            "位于构成和事态",
                            style: GpOtherTheme.size15(viewService.context),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 3),
                      child: Container(
//                        color: Colors.amberAccent,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 12,
                              height: 12,
                              color: Colors.red,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 2.5),
                              child: Text(
                                "38:42",
                                style: GpOtherTheme.size12(viewService.context)!
                                    .copyWith(
                                        color: CommonColors
                                            .barViewDarkYellowColor),
                              ),
                            ),
                            Container(
//                              color: Colors.red,
                              alignment: Alignment.centerLeft,
                              height: 20,
                              child: Padding(
                                padding: EdgeInsets.only(left: 4, bottom: 2),
                                child: Text(
                                  "已学26%",
                                  style:
                                      GpOtherTheme.size12(viewService.context)!
                                          .copyWith(
                                    color: CommonColors.kaoyanPayTextColor,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        Expanded(child: Container())
      ],
    ),
//    body: _buildlistViewBody(state, dispatch, viewService),
//    body: LoadingWrap(
//      loadingState: state.loadingState,
//      successChild: Builder(
//        builder: (context) {
//          return _buildBody(state, dispatch, viewService);
//        },
//      ),
//    ),
  );
}

Widget _buildlistViewBody(
    MyFocusState state, Dispatch dispatch, ViewService viewService) {
  return ExtendedListView.builder(
    addRepaintBoundaries: false,
    addAutomaticKeepAlives: false,
    itemBuilder: (context, index) {
      bool f =
          index / 5 == 1 || index / 5 == 2 || index / 5 == 3 || index / 5 == 4;
      return Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: Stack(
          children: [
            GestureDetector(
              onTap: () {
                ARouter.push(
                    viewService.context,
                    ImageViewer(
                      url:
                          "http://cdn-grape.iwordnet.com/yuhang/202208gc/1-${index + 1}.webp",
                    ));
              },
              child: Hero(
                tag:
                    "http://cdn-grape.iwordnet.com/yuhang/202208gc/1-${index + 1}.webp",
                child: CachedNetworkImage(
                  imageUrl:
                      "http://cdn-grape.iwordnet.com/yuhang/202208gc/1-${index + 1}.webp",
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          ],
        ),
      );
    },
    extendedListDelegate:
        ExtendedListDelegate(viewportBuilder: (int first, int last) {
      dispatch(MyFocusActionCreator.viewPortShowAction(first, last));
    }),
    itemCount: state.list.length,
  );
}

Widget _buildBody(
    MyFocusState state, Dispatch dispatch, ViewService viewService) {
  return Stack(
    children: <Widget>[
      PDFView(
        filePath: state.pdfFilePath,
        enableSwipe: true,
        swipeHorizontal: false,
        autoSpacing: true,
        pageFling: false,
        pageSnap: true,
        defaultPage: 0,
        fitPolicy: FitPolicy.WIDTH,
        fitEachPage: true,
        preventLinkNavigation:
            false, // if set to true the link is handled in flutter
        onRender: (_pages) {
//          setState(() {
//            pages = _pages;
//            isReady = true;
//          });
        },
        onError: (error) {
//          setState(() {
//            errorMessage = error.toString();
//          });
          print(error.toString());
        },
        onPageError: (page, error) {
//          setState(() {
//            errorMessage = '$page: ${error.toString()}';
//          });
          print('$page: ${error.toString()}');
        },
        onViewCreated: (PDFViewController pdfViewController) {
//          _controller.complete(pdfViewController);
        },
        onLinkHandler: (String? uri) {
          print('goto uri: $uri');
        },
        onPageChanged: (int? page, int? total) {
          print('page change: $page/$total');
//          setState(() {
//            currentPage = page;
//          });
        },
      ),
//      errorMessage.isEmpty
//          ? !isReady
//          ? Center(
//        child: CircularProgressIndicator(),
//      )
//          : Container()
//          : Center(
//        child: Text(errorMessage),
//      )
    ],
  );
}
