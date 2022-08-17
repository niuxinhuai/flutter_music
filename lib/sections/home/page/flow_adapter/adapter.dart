import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_music/sections/home/models/home.dart';
import 'package:flutter_music/sections/home/page/album/component.dart';
import 'package:flutter_music/sections/home/page/banner/component.dart';
import 'package:flutter_music/sections/home/page/broadcast/component.dart';
import 'package:flutter_music/sections/home/page/calendar/component.dart';
import 'package:flutter_music/sections/home/page/custom/component.dart';
import 'package:flutter_music/sections/home/page/flow_adapter/cell_connector.dart';
import 'package:flutter_music/sections/home/page/recommend/component.dart';
import 'package:flutter_music/sections/home/page/state.dart';
import 'package:flutter_music/sections/home/page/toplist/component.dart';
import 'package:flutter_music/sections/home/page/yuncun/component.dart';
import 'package:flutter_music/utils/typeUtils.dart';

FlowAdapter<HomeMusicState> get adapter => FlowAdapter<HomeMusicState>(
    view: (HomeMusicState state) => DependentArray(
        builder: (int index) {
          MusicItem item = state.musicWrap!.data!.blocks![index];
          String blockCode = item.blockCode ?? "";
          if (blockCode == HomeBlockCodeUtils.banner) {
            ///banner
            return CellConnector(index: index) + BannerComponent();
          } else if (blockCode == HomeBlockCodeUtils.custom) {
            ///topic 2
            return CellConnector(index: index) + TopicCustomComponent();
          } else if (blockCode == HomeBlockCodeUtils.recommendList) {
            ///推荐歌单
            return CellConnector(index: index) + RecommendSongComponent();
          } else if (blockCode == HomeBlockCodeUtils.playlist) {
            ///网易云雷达歌单
            return CellConnector(index: index) + RecommendSongComponent();
          } else if (blockCode == HomeBlockCodeUtils.official) {
            ///专属场景歌单
            return CellConnector(index: index) + RecommendSongComponent();
          } else if (blockCode == HomeBlockCodeUtils.songNewAlbum) {
            ///新歌/新碟/数字专辑
            return CellConnector(index: index) + SongNewAlbumComponent();
          } else if (blockCode == HomeBlockCodeUtils.yuncun) {
            ///云村出品
            return CellConnector(index: index) + YuncunComponent();
          } else if (blockCode == HomeBlockCodeUtils.dragon) {
            ///广播
            return CellConnector(index: index) + BoradcastComponent();
          } else if (blockCode == HomeBlockCodeUtils.vlog ||
              blockCode == HomeBlockCodeUtils.songListAlign) {
            ///热门播客/有声书/歌谣
            return CellConnector(index: index) + SongNewAlbumComponent();
          } else if (blockCode == HomeBlockCodeUtils.calendar) {
            ///音乐日历
            return CellConnector(index: index) + MusicCalendarComponent();
          } else if (blockCode == HomeBlockCodeUtils.toplist) {
            ///排行榜
            return CellConnector(index: index) + ToplistComponent();
          }
        },
        length: state.musicWrap?.data?.blocks?.length ?? 0));
