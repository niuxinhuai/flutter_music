package com.example.flutter_music

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            MusicWidgetConstants.CHANNEL
        ).setMethodCallHandler { call, result ->
            when (call.method) {
                "playTrack" -> {
                    val track = WidgetTrack.fromMap(call.argument("track"))
                    if (track == null) {
                        result.error("invalid_track", "audioUrl is required", null)
                    } else {
                        MusicWidgetPlaybackService.start(
                            this,
                            MusicWidgetConstants.ACTION_PLAY_TRACK,
                            track
                        )
                        result.success(null)
                    }
                }
                "pause" -> {
                    MusicWidgetPlaybackService.start(this, MusicWidgetConstants.ACTION_PAUSE)
                    result.success(null)
                }
                "resume" -> {
                    MusicWidgetPlaybackService.start(this, MusicWidgetConstants.ACTION_RESUME)
                    result.success(null)
                }
                "stop" -> {
                    MusicWidgetPlaybackService.start(this, MusicWidgetConstants.ACTION_STOP)
                    result.success(null)
                }
                "next" -> {
                    MusicWidgetPlaybackService.start(this, MusicWidgetConstants.ACTION_NEXT)
                    result.success(null)
                }
                "previous" -> {
                    MusicWidgetPlaybackService.start(this, MusicWidgetConstants.ACTION_PREVIOUS)
                    result.success(null)
                }
                "getSnapshot" -> result.success(MusicWidgetPlaybackService.snapshot())
                else -> result.notImplemented()
            }
        }
    }
}
