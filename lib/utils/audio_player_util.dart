import 'package:audioplayers/audioplayers.dart';

class AudioPlayerUtils {
  static AudioPlayerState get state => _instance._state;
  static Duration get position => _instance._position;
  static Duration get duration => _instance._duration;
  static Stream<Duration> get onPlayerStateChanged =>
      _instance._audioPlayer!.onAudioPositionChanged;

  ///单个播放音频
  static void playerHandle(String url) async {
    await _instance._audioPlayer?.play(url);
  }

  static void pause() async {
    await _instance._audioPlayer?.pause();
  }

  static void resume() async {
    await _instance._audioPlayer?.resume();
  }

  ///释放资源
  static void dispose() {
    _instance._audioPlayer?.release();
    _instance._audioPlayer?.dispose();
    _instance._position = const Duration(seconds: 0);
    _instance._duration = const Duration(seconds: 0);
  }

  ///private
  static final AudioPlayerUtils _instance = AudioPlayerUtils._internal();
  factory AudioPlayerUtils() => _instance;
  AudioPlayer? _audioPlayer;
  AudioPlayerState _state = AudioPlayerState.stopped;
  Duration _position = const Duration(seconds: 0);
  Duration _duration = const Duration(seconds: 0);
  AudioPlayerUtils._internal() {
    _audioPlayer = AudioPlayer();
    // 状态监听
    _audioPlayer?.onPlayerStateChanged.listen((PlayerState playerState) {
      if (_audioPlayer != null) {
        switch (playerState) {
          case PlayerState.STOPPED:
            // TODO: Handle this case.
            _state = AudioPlayerState.stopped;
            break;
          case PlayerState.PLAYING:
            // TODO: Handle this case.
            _state = AudioPlayerState.playing;
            break;
          case PlayerState.PAUSED:
            // TODO: Handle this case.
            _state = AudioPlayerState.paused;
            break;
          case PlayerState.COMPLETED:
            // TODO: Handle this case.
            _state = AudioPlayerState.completed;
            break;
        }
      }
    });

    // 播放进度监听
    _audioPlayer?.onAudioPositionChanged.listen((Duration p) {
      _position = p;
    });

    _audioPlayer?.onDurationChanged.listen((Duration d) {
      _duration = d;
    });
  }
}

/// 播放状态枚举
enum AudioPlayerState {
  stopped, // 初始状态，已停止或发生错误
  playing, // 正在播放
  paused, // 暂停
  completed // 播放结束
}
