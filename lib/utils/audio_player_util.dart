import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_music/utils/local_media_store.dart';
import 'package:flutter_music/utils/music_widget_bridge.dart';

class AudioPlayerUtils {
  static AudioPlayerState get state => _instance._state;
  static Duration get position => _instance._position;
  static Duration get duration => _instance._duration;
  static Stream<Duration> get onPlayerStateChanged =>
      _instance._positionController.stream;

  ///单个播放音频
  static Future<void> playerHandle(
    String url, {
    String? id,
    String? title,
    String? artist,
    String? artworkUrl,
  }) async {
    if (_instance._useNativeWidgetPlayer) {
      try {
        await MusicWidgetBridge.playTrack(
          MusicWidgetTrack(
            id: id ?? url,
            title: title ?? '正在播放',
            artist: artist,
            artworkUrl: artworkUrl,
            audioUrl: url,
          ),
        );
        _instance._state = AudioPlayerState.playing;
        _instance._startNativeSnapshotPolling();
        return;
      } on PlatformException {
        _instance._nativeWidgetPlayerAvailable = false;
        _instance._snapshotTimer?.cancel();
        _instance._snapshotTimer = null;
      } on MissingPluginException {
        _instance._nativeWidgetPlayerAvailable = false;
        _instance._snapshotTimer?.cancel();
        _instance._snapshotTimer = null;
      }
    }
    _instance._ensureAudioPlayer();
    final source = LocalMediaStore.isLocalPath(url)
        ? DeviceFileSource(url)
        : UrlSource(url);
    await _instance._audioPlayer?.play(source);
  }

  static void pause() async {
    if (_instance._useNativeWidgetPlayer) {
      await MusicWidgetBridge.pause();
      _instance._state = AudioPlayerState.paused;
      return;
    }
    _instance._ensureAudioPlayer();
    await _instance._audioPlayer?.pause();
  }

  static void resume() async {
    if (_instance._useNativeWidgetPlayer) {
      await MusicWidgetBridge.resume();
      _instance._state = AudioPlayerState.playing;
      _instance._startNativeSnapshotPolling();
      return;
    }
    _instance._ensureAudioPlayer();
    await _instance._audioPlayer?.resume();
  }

  static void toggle() {
    if (_instance._state == AudioPlayerState.playing) {
      pause();
    } else {
      resume();
    }
  }

  static void next() async {
    if (_instance._useNativeWidgetPlayer) {
      await MusicWidgetBridge.next();
      _instance._state = AudioPlayerState.playing;
      _instance._startNativeSnapshotPolling();
    }
  }

  static void previous() async {
    if (_instance._useNativeWidgetPlayer) {
      await MusicWidgetBridge.previous();
      _instance._state = AudioPlayerState.playing;
      _instance._startNativeSnapshotPolling();
    }
  }

  ///释放资源
  static void dispose() {
    if (_instance._useNativeWidgetPlayer) {
      _instance._snapshotTimer?.cancel();
      _instance._snapshotTimer = null;
      return;
    }
    _instance._audioPlayer?.release();
    _instance._audioPlayer?.dispose();
    _instance._audioPlayer = null;
    _instance._position = const Duration(seconds: 0);
    _instance._duration = const Duration(seconds: 0);
    _instance._state = AudioPlayerState.stopped;
    _instance._positionController.add(_instance._position);
  }

  ///private
  static final AudioPlayerUtils _instance = AudioPlayerUtils._internal();
  factory AudioPlayerUtils() => _instance;
  final StreamController<Duration> _positionController =
      StreamController<Duration>.broadcast();
  AudioPlayer? _audioPlayer;
  Timer? _snapshotTimer;
  bool _nativeWidgetPlayerAvailable = true;
  AudioPlayerState _state = AudioPlayerState.stopped;
  Duration _position = const Duration(seconds: 0);
  Duration _duration = const Duration(seconds: 0);
  bool get _useNativeWidgetPlayer =>
      _nativeWidgetPlayerAvailable &&
      !kIsWeb &&
      defaultTargetPlatform == TargetPlatform.android;

  AudioPlayerUtils._internal() {
    _ensureAudioPlayer();
  }

  void _ensureAudioPlayer() {
    if (_audioPlayer != null) {
      return;
    }
    _audioPlayer = AudioPlayer();
    // 状态监听
    _audioPlayer?.onPlayerStateChanged.listen((PlayerState playerState) {
      if (_audioPlayer != null) {
        switch (playerState) {
          case PlayerState.stopped:
            // TODO: Handle this case.
            _state = AudioPlayerState.stopped;
            break;
          case PlayerState.playing:
            // TODO: Handle this case.
            _state = AudioPlayerState.playing;
            break;
          case PlayerState.paused:
            // TODO: Handle this case.
            _state = AudioPlayerState.paused;
            break;
          case PlayerState.completed:
            // TODO: Handle this case.
            _state = AudioPlayerState.completed;
            break;
          case PlayerState.disposed:
            _state = AudioPlayerState.stopped;
            break;
        }
      }
    });

    // 播放进度监听
    _audioPlayer?.onPositionChanged.listen((Duration p) {
      _position = p;
      _positionController.add(p);
    });

    _audioPlayer?.onDurationChanged.listen((Duration d) {
      _duration = d;
    });
  }

  void _startNativeSnapshotPolling() {
    _snapshotTimer?.cancel();
    _snapshotTimer = Timer.periodic(const Duration(seconds: 1), (_) async {
      try {
        final snapshot = await MusicWidgetBridge.getSnapshot();
        _position = snapshot.position;
        _duration = snapshot.duration;
        _state = snapshot.isPlaying
            ? AudioPlayerState.playing
            : AudioPlayerState.paused;
        _positionController.add(_position);
      } on PlatformException {
        _snapshotTimer?.cancel();
        _snapshotTimer = null;
      } on MissingPluginException {
        _snapshotTimer?.cancel();
        _snapshotTimer = null;
      }
    });
  }
}

/// 播放状态枚举
enum AudioPlayerState {
  stopped, // 初始状态，已停止或发生错误
  playing, // 正在播放
  paused, // 暂停
  completed, // 播放结束
}
