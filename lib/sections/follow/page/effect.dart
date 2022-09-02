import 'dart:async';
import 'dart:io';

import 'package:fish_redux/fish_redux.dart';
//import 'package:flutter/cupertino.dart' as P;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' as P;
import 'package:flutter_music/res/colors.dart';
import 'package:flutter_music/res/other_theme.dart';
import 'package:flutter_music/widgets/button.dart';
import 'package:path_provider/path_provider.dart';
import 'action.dart';
import 'state.dart';

Effect<MyFocusState>? buildEffect() {
  return combineEffects(<Object, Effect<MyFocusState>>{
    MyFocusAction.action: _onAction,
    Lifecycle.initState: _initState,
    MyFocusAction.viewPortShow: _viewPortShow,
  });
}

void _initState(Action action, Context<MyFocusState> ctx) async {
//  createFileOfPdfUrl(action, ctx).then((value) {
//    ctx.dispatch(MyFocusActionCreator.didRefreshAction(value.path));
//  });
  ctx.dispatch(MyFocusActionCreator.didRefreshImageAction());
}

void _viewPortShow(Action action, Context<MyFocusState> ctx) {
  Tuple2 tuple2 = action.payload;

  print('viewport : [${tuple2.i0},${tuple2.i1}]');
  int first = tuple2.i0;
  int last = tuple2.i1;

  if (ctx.state.list.isNotEmpty) {
    if (ctx.state.list.length < ctx.state.max) {
      if (ctx.state.page * 10 == ctx.state.list.length) {
        if (first > 0 && last == ctx.state.list.length - 4) {
          ctx.dispatch(MyFocusActionCreator.didRefreshImageAction());
        }
      }
    }
  }
}

Future<File> createFileOfPdfUrl(
    Action action, Context<MyFocusState> ctx) async {
  Completer<File> completer = Completer();
  print("Start download file from internet!");
  try {
    // "https://berlin2017.droidcon.cod.newthinking.net/sites/global.droidcon.cod.newthinking.net/files/media/documents/Flutter%20-%2060FPS%20UI%20of%20the%20future%20%20-%20DroidconDE%2017.pdf";
    // final url = "https://pdfkit.org/docs/guide.pdf";
    final url = ctx.state.pdfUrl!; //"http://www.pdf995.com/samples/pdf.pdf";

    final filename = url.substring(url.lastIndexOf("/") + 1);
    var dir = await getApplicationDocumentsDirectory();
    print("${dir.path}/$filename");
    File file = File("${dir.path}/$filename");
    if (file.existsSync()) {
      print(">>>>>>>>存在已经下载的文件");
      completer.complete(file);
      return completer.future;
    }
    var request = await HttpClient().getUrl(Uri.parse(url));
    var response = await request.close();
    var bytes = await consolidateHttpClientResponseBytes(response);

    print("Download files");

    await file.writeAsBytes(bytes, flush: true);
    completer.complete(file);
  } catch (e) {
    throw Exception('Error parsing asset file!');
  }

  return completer.future;
}

void _onAction(Action action, Context<MyFocusState> ctx) {
  P.showDialog(
      context: ctx.context,
      builder: (P.BuildContext context) {
        return P.AlertDialog(
          content: P.Text(
            "此视频中用的例句来自考研真题，不过长难句分析方法在包括考研、六级、雅思、托福等考试中都是相同的，所以虽然例句来自考研，但此视频同样适合于六级、雅思、托福等备考同学来学习。",
            style: GpOtherTheme.size15(context),
          ),
          actions: [
            P.Container(
              alignment: P.Alignment.center,
              width: double.infinity,
              child: GpGreenCornerButton(
                padding:
                    P.EdgeInsets.only(left: 50, right: 50, top: 10, bottom: 10),
                child: P.Text("知道了",
                    style: GpOtherTheme.size15(context)!
                        .copyWith(color: CommonColors.onPrimaryTextColor)),
                onPressed: () {
                  P.Navigator.pop(context);
                },
              ),
            )
          ],
        );
      });
}
