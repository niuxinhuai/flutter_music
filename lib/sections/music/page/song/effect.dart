import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_music/repository/services/common_service.dart';
import 'package:flutter_music/sections/music/models/lyric.dart';
import 'package:flutter_music/sections/music/models/song.dart';
import 'package:flutter_music/widgets/toast.dart';
import 'action.dart';
import 'state.dart';

Effect<AudioPlayerState>? buildEffect() {
  return combineEffects(<Object, Effect<AudioPlayerState>>{
    AudioPlayerAction.action: _onAction,
    Lifecycle.initState: _initState,
  });
}

void _initState(Action action, Context<AudioPlayerState> ctx) async {
  String url =
      "https://netease-cloud-music-api-sable-gamma.vercel.app/song/url?id=115162";
  SongWrap? songwrap =
      await CommonService.getSongUrl(ctx.state.id!).catchError((e) {
    Toast.toast(
        ctx.context, "音乐无法播放时,网页端调用$url,将json拷贝到assets下的song_url.json下");
  });
  SongLyric? songLyric = await CommonService.getSongLyric(ctx.state.id!);
  if (songwrap != null &&
      songwrap.code == 200 &&
      songLyric != null &&
      songLyric.code == 200) {
    ctx.dispatch(
        AudioPlayerActionCreator.didFetchDataAction(songwrap, songLyric));
  }
}

void _onAction(Action action, Context<AudioPlayerState> ctx) {}
