package com.example.flutter_music

import android.app.PendingIntent
import android.appwidget.AppWidgetManager
import android.appwidget.AppWidgetProvider
import android.content.ComponentName
import android.content.Context
import android.content.Intent
import android.os.Build
import android.widget.RemoteViews

class MusicWidgetProvider : AppWidgetProvider() {
    override fun onUpdate(
        context: Context,
        appWidgetManager: AppWidgetManager,
        appWidgetIds: IntArray
    ) {
        appWidgetIds.forEach { appWidgetId ->
            appWidgetManager.updateAppWidget(appWidgetId, buildRemoteViews(context))
        }
    }

    override fun onReceive(context: Context, intent: Intent) {
        super.onReceive(context, intent)
        when (intent.action) {
            MusicWidgetConstants.ACTION_TOGGLE,
            MusicWidgetConstants.ACTION_PAUSE,
            MusicWidgetConstants.ACTION_RESUME,
            MusicWidgetConstants.ACTION_NEXT,
            MusicWidgetConstants.ACTION_PREVIOUS -> {
                MusicWidgetPlaybackService.start(context, intent.action!!)
                updateAll(context)
            }
        }
    }

    companion object {
        fun updateAll(context: Context) {
            val manager = AppWidgetManager.getInstance(context)
            val component = ComponentName(context, MusicWidgetProvider::class.java)
            val ids = manager.getAppWidgetIds(component)
            ids.forEach { appWidgetId ->
                manager.updateAppWidget(appWidgetId, buildRemoteViews(context))
            }
        }

        private fun buildRemoteViews(context: Context): RemoteViews {
            val track = MusicWidgetStorage.readTrack(context)
            val isPlaying = MusicWidgetStorage.isPlaying(context)
            return RemoteViews(context.packageName, R.layout.music_widget).apply {
                setTextViewText(R.id.music_widget_title, track?.title ?: "Flutter Music")
                setTextViewText(R.id.music_widget_artist, track?.artist ?: "点击播放当前歌曲")
                setImageViewResource(
                    R.id.music_widget_play_pause,
                    if (isPlaying) android.R.drawable.ic_media_pause
                    else android.R.drawable.ic_media_play
                )
                setOnClickPendingIntent(
                    R.id.music_widget_root,
                    openAppPendingIntent(context)
                )
                setOnClickPendingIntent(
                    R.id.music_widget_previous,
                    controlPendingIntent(context, MusicWidgetConstants.ACTION_PREVIOUS, 10)
                )
                setOnClickPendingIntent(
                    R.id.music_widget_play_pause,
                    controlPendingIntent(context, MusicWidgetConstants.ACTION_TOGGLE, 11)
                )
                setOnClickPendingIntent(
                    R.id.music_widget_next,
                    controlPendingIntent(context, MusicWidgetConstants.ACTION_NEXT, 12)
                )
            }
        }

        private fun controlPendingIntent(
            context: Context,
            action: String,
            requestCode: Int
        ): PendingIntent {
            val intent = Intent(context, MusicWidgetProvider::class.java).apply {
                this.action = action
            }
            return PendingIntent.getBroadcast(context, requestCode, intent, pendingIntentFlags())
        }

        private fun openAppPendingIntent(context: Context): PendingIntent {
            val intent = Intent(context, MainActivity::class.java)
            return PendingIntent.getActivity(context, 20, intent, pendingIntentFlags())
        }

        private fun pendingIntentFlags(): Int {
            return if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
                PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
            } else {
                PendingIntent.FLAG_UPDATE_CURRENT
            }
        }
    }
}
