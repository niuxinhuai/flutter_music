package com.example.flutter_music

import android.content.Context
import android.content.Intent

data class WidgetTrack(
    val id: String,
    val title: String,
    val artist: String,
    val artworkUrl: String,
    val audioUrl: String
) {
    fun putInto(intent: Intent) {
        intent.putExtra(MusicWidgetConstants.EXTRA_ID, id)
        intent.putExtra(MusicWidgetConstants.EXTRA_TITLE, title)
        intent.putExtra(MusicWidgetConstants.EXTRA_ARTIST, artist)
        intent.putExtra(MusicWidgetConstants.EXTRA_ARTWORK_URL, artworkUrl)
        intent.putExtra(MusicWidgetConstants.EXTRA_AUDIO_URL, audioUrl)
    }

    companion object {
        fun fromMap(map: Map<*, *>?): WidgetTrack? {
            val audioUrl = map?.get(MusicWidgetConstants.EXTRA_AUDIO_URL) as? String
            if (audioUrl.isNullOrBlank()) {
                return null
            }
            return WidgetTrack(
                id = map[MusicWidgetConstants.EXTRA_ID] as? String ?: audioUrl,
                title = map[MusicWidgetConstants.EXTRA_TITLE] as? String ?: "正在播放",
                artist = map[MusicWidgetConstants.EXTRA_ARTIST] as? String ?: "",
                artworkUrl = map[MusicWidgetConstants.EXTRA_ARTWORK_URL] as? String ?: "",
                audioUrl = audioUrl
            )
        }

        fun fromIntent(intent: Intent?): WidgetTrack? {
            val audioUrl = intent?.getStringExtra(MusicWidgetConstants.EXTRA_AUDIO_URL)
            if (audioUrl.isNullOrBlank()) {
                return null
            }
            return WidgetTrack(
                id = intent.getStringExtra(MusicWidgetConstants.EXTRA_ID) ?: audioUrl,
                title = intent.getStringExtra(MusicWidgetConstants.EXTRA_TITLE) ?: "正在播放",
                artist = intent.getStringExtra(MusicWidgetConstants.EXTRA_ARTIST) ?: "",
                artworkUrl = intent.getStringExtra(MusicWidgetConstants.EXTRA_ARTWORK_URL) ?: "",
                audioUrl = audioUrl
            )
        }
    }
}

object MusicWidgetStorage {
    private const val PREFS = "music_widget_player"
    private const val KEY_ID = "id"
    private const val KEY_TITLE = "title"
    private const val KEY_ARTIST = "artist"
    private const val KEY_ARTWORK_URL = "artworkUrl"
    private const val KEY_AUDIO_URL = "audioUrl"
    private const val KEY_IS_PLAYING = "isPlaying"

    fun saveTrack(context: Context, track: WidgetTrack) {
        prefs(context).edit()
            .putString(KEY_ID, track.id)
            .putString(KEY_TITLE, track.title)
            .putString(KEY_ARTIST, track.artist)
            .putString(KEY_ARTWORK_URL, track.artworkUrl)
            .putString(KEY_AUDIO_URL, track.audioUrl)
            .apply()
    }

    fun readTrack(context: Context): WidgetTrack? {
        val audioUrl = prefs(context).getString(KEY_AUDIO_URL, null)
        if (audioUrl.isNullOrBlank()) {
            return null
        }
        return WidgetTrack(
            id = prefs(context).getString(KEY_ID, audioUrl) ?: audioUrl,
            title = prefs(context).getString(KEY_TITLE, "正在播放") ?: "正在播放",
            artist = prefs(context).getString(KEY_ARTIST, "") ?: "",
            artworkUrl = prefs(context).getString(KEY_ARTWORK_URL, "") ?: "",
            audioUrl = audioUrl
        )
    }

    fun setPlaying(context: Context, isPlaying: Boolean) {
        prefs(context).edit().putBoolean(KEY_IS_PLAYING, isPlaying).apply()
    }

    fun isPlaying(context: Context): Boolean {
        return prefs(context).getBoolean(KEY_IS_PLAYING, false)
    }

    private fun prefs(context: Context) =
        context.getSharedPreferences(PREFS, Context.MODE_PRIVATE)
}
