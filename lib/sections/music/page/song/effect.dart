import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_music/repository/services/common_service.dart';
import 'package:flutter_music/sections/music/models/lyric.dart';
import 'package:flutter_music/sections/music/models/song.dart';
import 'package:flutter_music/utils/local_media_repository.dart';
import 'package:flutter_music/utils/local_media_store.dart';
import 'package:flutter_music/widgets/toast.dart';
import 'action.dart';
import 'state.dart';

Effect<AudioPlayerState>? buildEffect() {
  return combineEffects(<Object, Effect<AudioPlayerState>>{
    AudioPlayerAction.action: _onAction,
    AudioPlayerAction.onTapDownload: _onTapDownload,
    Lifecycle.initState: _initState,
  });
}

void _initState(Action action, Context<AudioPlayerState> ctx) async {
  String url =
      "https://netease-cloud-music-api-sable-gamma.vercel.app/song/url?id=115162";
  SongWrap? songwrap = await CommonService.getSongUrl(ctx.state.id!).catchError(
    (e) {
      Toast.toast(
        ctx.context,
        "音乐无法播放时,网页端调用$url,将json拷贝到assets下的song_url.json下",
      );
      return null;
    },
  );
  SongLyric? songLyric = await CommonService.getSongLyric(ctx.state.id!);
  if (songwrap != null &&
      songwrap.code == 200 &&
      songLyric != null &&
      songLyric.code == 200) {
    final sourceUrl =
        songwrap.data?.isNotEmpty == true ? songwrap.data?.first.url : null;
    String? resolvedUrl = sourceUrl;
    if (sourceUrl != null && sourceUrl.isNotEmpty) {
      resolvedUrl = await LocalMediaRepository.resolvePlaybackPath(
        type: LocalMediaType.audio,
        id: ctx.state.id!,
        fallbackUrl: sourceUrl,
      );
    }
    ctx.dispatch(
      AudioPlayerActionCreator.didFetchDataAction(
        songwrap,
        songLyric,
        resolvedUrl,
      ),
    );
  }
}

void _onAction(Action action, Context<AudioPlayerState> ctx) {}

void _onTapDownload(Action action, Context<AudioPlayerState> ctx) async {
  final sourceUrl = ctx.state.sourceUrl ?? ctx.state.url;
  if (ctx.state.id == null || sourceUrl == null || sourceUrl.isEmpty) {
    Toast.toast(ctx.context, "暂无可下载音频");
    return;
  }

  try {
    final item = await LocalMediaRepository.download(
      type: LocalMediaType.audio,
      id: ctx.state.id!,
      sourceUrl: sourceUrl,
      title: ctx.state.name,
    );
    if (!ctx.context.mounted) {
      return;
    }
    ctx.dispatch(
      AudioPlayerActionCreator.didUpdatePlaybackUrlAction(item.localPath),
    );
    Toast.toast(ctx.context, "已下载，将优先本地播放");
  } catch (e) {
    if (!ctx.context.mounted) {
      return;
    }
    Toast.toast(ctx.context, "下载失败，请稍后重试");
  }
}
