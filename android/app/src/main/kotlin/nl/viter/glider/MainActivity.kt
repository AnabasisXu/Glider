package nl.viter.glider

import android.content.ContentValues
import android.os.Build
import android.os.Environment
import android.provider.MediaStore
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.io.File

class MainActivity : FlutterActivity() {
    private val channel = "nl.viter.glider/export"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, channel)
            .setMethodCallHandler { call, result ->
                when (call.method) {
                    "exportToDownloads" -> {
                        val fileName = call.argument<String>("fileName")
                        val content = call.argument<String>("content")
                        if (fileName == null || content == null) {
                            result.error("INVALID_ARGS", "fileName and content are required", null)
                            return@setMethodCallHandler
                        }
                        try {
                            val path = writeToDownloads(fileName, content)
                            result.success(path)
                        } catch (e: Exception) {
                            result.error("WRITE_FAILED", e.message, null)
                        }
                    }
                    else -> result.notImplemented()
                }
            }
    }

    /**
     * Writes [content] to a fixed file named [fileName] in the public Downloads
     * directory, overwriting any previous export so the path stays stable for
     * external sync tooling. Returns the absolute filesystem path.
     */
    private fun writeToDownloads(fileName: String, content: String): String {
        val bytes = content.toByteArray(Charsets.UTF_8)

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
            val resolver = contentResolver
            val collection = MediaStore.Downloads.EXTERNAL_CONTENT_URI

            // Remove any previous export with the same name so we overwrite in
            // place rather than accumulating "glider_favorites (1).tsv".
            resolver.delete(
                collection,
                "${MediaStore.Downloads.DISPLAY_NAME} = ?",
                arrayOf(fileName),
            )

            val values = ContentValues().apply {
                put(MediaStore.Downloads.DISPLAY_NAME, fileName)
                put(MediaStore.Downloads.MIME_TYPE, "text/tab-separated-values")
                put(MediaStore.Downloads.RELATIVE_PATH, Environment.DIRECTORY_DOWNLOADS)
                put(MediaStore.Downloads.IS_PENDING, 1)
            }
            val uri = resolver.insert(collection, values)
                ?: throw IllegalStateException("MediaStore insert returned null")

            resolver.openOutputStream(uri)?.use { it.write(bytes) }
                ?: throw IllegalStateException("Could not open output stream")

            values.clear()
            values.put(MediaStore.Downloads.IS_PENDING, 0)
            resolver.update(uri, values, null, null)

            return "${Environment.DIRECTORY_DOWNLOADS}/$fileName"
        } else {
            val downloads =
                Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_DOWNLOADS)
            if (!downloads.exists()) downloads.mkdirs()
            val file = File(downloads, fileName)
            file.writeBytes(bytes)
            return file.absolutePath
        }
    }
}
