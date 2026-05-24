package com.example.flutter_music

import android.app.Notification
import android.app.NotificationChannel
import android.app.NotificationManager
import android.app.PendingIntent
import android.app.Service
import android.content.Context
import android.content.Intent
import android.media.AudioAttributes
import android.media.MediaPlayer
import android.os.Build
import android.os.IBinder
import android.util.Log

class MusicWidgetPlaybackService : Service() {
    override fun onCreate() {
        super.onCreate()
        startForeground(NOTIFICATION_ID, buildNotification(this))
    }

    override fun onStartCommand(intent: Intent?, flags: Int, startId: Int): Int {
        when (intent?.action) {
            MusicWidgetConstants.ACTION_PLAY_TRACK -> {
                WidgetTrack.fromIntent(intent)?.let { playTrack(it) }
            }
            MusicWidgetConstants.ACTION_TOGGLE -> toggle()
            MusicWidgetConstants.ACTION_PAUSE -> pausePlayback()
            MusicWidgetConstants.ACTION_RESUME -> resumePlayback()
            MusicWidgetConstants.ACTION_STOP -> stopPlayback()
            MusicWidgetConstants.ACTION_NEXT -> replaySavedTrack()
            MusicWidgetConstants.ACTION_PREVIOUS -> replaySavedTrack()
        }
        return START_STICKY
    }

    override fun onBind(intent: Intent?): IBinder? = null

    override fun onDestroy() {
        stopPlayback()
        super.onDestroy()
    }

    private fun playTrack(track: WidgetTrack) {
        MusicWidgetStorage.saveTrack(this, track)
        player?.release()
        player = MediaPlayer().apply {
            setAudioAttributes(
                AudioAttributes.Builder()
                    .setContentType(AudioAttributes.CONTENT_TYPE_MUSIC)
                    .setUsage(AudioAttributes.USAGE_MEDIA)
                    .build()
            )
            setDataSource(track.audioUrl)
            setOnPreparedListener {
                it.start()
                MusicWidgetStorage.setPlaying(this@MusicWidgetPlaybackService, true)
                refreshSurfaces()
            }
            setOnCompletionListener {
                MusicWidgetStorage.setPlaying(this@MusicWidgetPlaybackService, false)
                refreshSurfaces()
            }
            setOnErrorListener { _, what, extra ->
                Log.w(TAG, "MediaPlayer error what=$what extra=$extra")
                MusicWidgetStorage.setPlaying(this@MusicWidgetPlaybackService, false)
                refreshSurfaces()
                true
            }
            prepareAsync()
        }
        refreshSurfaces()
    }

    private fun toggle() {
        if (player?.isPlaying == true) {
            pausePlayback()
        } else {
            resumePlayback()
        }
    }

    private fun pausePlayback() {
        player?.takeIf { it.isPlaying }?.pause()
        MusicWidgetStorage.setPlaying(this, false)
        refreshSurfaces()
    }

    private fun resumePlayback() {
        val currentPlayer = player
        if (currentPlayer == null) {
            replaySavedTrack()
            return
        }
        currentPlayer.start()
        MusicWidgetStorage.setPlaying(this, true)
        refreshSurfaces()
    }

    private fun replaySavedTrack() {
        val track = MusicWidgetStorage.readTrack(this)
        if (track == null) {
            MusicWidgetStorage.setPlaying(this, false)
            refreshSurfaces()
            stopSelf()
            return
        }
        playTrack(track)
    }

    private fun stopPlayback() {
        player?.release()
        player = null
        MusicWidgetStorage.setPlaying(this, false)
        refreshSurfaces()
    }

    private fun refreshSurfaces() {
        val notificationManager =
            getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager
        notificationManager.notify(NOTIFICATION_ID, buildNotification(this))
        MusicWidgetProvider.updateAll(this)
    }

    companion object {
        private const val TAG = "MusicWidgetPlayback"
        private const val CHANNEL_ID = "music_widget_playback"
        private const val NOTIFICATION_ID = 1001
        private var player: MediaPlayer? = null

        fun start(context: Context, action: String, track: WidgetTrack? = null) {
            val intent = Intent(context, MusicWidgetPlaybackService::class.java).apply {
                this.action = action
                track?.putInto(this)
            }
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
                context.startForegroundService(intent)
            } else {
                context.startService(intent)
            }
        }

        fun snapshot(): Map<String, Any> {
            val mediaPlayer = player
            return mapOf(
                "isPlaying" to (mediaPlayer?.isPlaying == true),
                "position" to runCatching { mediaPlayer?.currentPosition ?: 0 }.getOrDefault(0),
                "duration" to runCatching { mediaPlayer?.duration ?: 0 }.getOrDefault(0)
            )
        }

        private fun buildNotification(context: Context): Notification {
            createNotificationChannel(context)
            val track = MusicWidgetStorage.readTrack(context)
            val contentIntent = PendingIntent.getActivity(
                context,
                0,
                Intent(context, MainActivity::class.java),
                pendingIntentFlags()
            )
            val toggleAction = if (MusicWidgetStorage.isPlaying(context)) {
                MusicWidgetConstants.ACTION_PAUSE
            } else {
                MusicWidgetConstants.ACTION_RESUME
            }
            val toggleTitle = if (MusicWidgetStorage.isPlaying(context)) "暂停" else "播放"
            val builder = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
                Notification.Builder(context, CHANNEL_ID)
            } else {
                Notification.Builder(context)
            }
            return builder
                .setSmallIcon(R.mipmap.ic_launcher)
                .setContentTitle(track?.title ?: "Flutter Music")
                .setContentText(track?.artist ?: "桌面小组件播放中")
                .setContentIntent(contentIntent)
                .setOngoing(MusicWidgetStorage.isPlaying(context))
                .addAction(
                    android.R.drawable.ic_media_previous,
                    "上一首",
                    servicePendingIntent(context, MusicWidgetConstants.ACTION_PREVIOUS, 1)
                )
                .addAction(
                    if (MusicWidgetStorage.isPlaying(context)) {
                        android.R.drawable.ic_media_pause
                    } else {
                        android.R.drawable.ic_media_play
                    },
                    toggleTitle,
                    servicePendingIntent(context, toggleAction, 2)
                )
                .addAction(
                    android.R.drawable.ic_media_next,
                    "下一首",
                    servicePendingIntent(context, MusicWidgetConstants.ACTION_NEXT, 3)
                )
                .build()
        }

        private fun servicePendingIntent(
            context: Context,
            action: String,
            requestCode: Int
        ): PendingIntent {
            val intent = Intent(context, MusicWidgetPlaybackService::class.java).apply {
                this.action = action
            }
            return PendingIntent.getService(context, requestCode, intent, pendingIntentFlags())
        }

        private fun createNotificationChannel(context: Context) {
            if (Build.VERSION.SDK_INT < Build.VERSION_CODES.O) {
                return
            }
            val channel = NotificationChannel(
                CHANNEL_ID,
                "桌面小组件播放",
                NotificationManager.IMPORTANCE_LOW
            )
            val manager = context.getSystemService(NotificationManager::class.java)
            manager.createNotificationChannel(channel)
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
