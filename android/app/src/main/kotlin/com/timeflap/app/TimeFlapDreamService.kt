package com.timeflap.app

import android.service.dreams.DreamService
import io.flutter.embedding.android.FlutterView
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.dart.DartExecutor

class TimeFlapDreamService : DreamService() {
    private var flutterEngine: FlutterEngine? = null
    private var flutterView: FlutterView? = null

    override fun onAttachedToWindow() {
        super.onAttachedToWindow()
        
        // Set the dream to be interactive so users can control timers
        isInteractive = true
        isFullscreen = true
        
        // Initialize Flutter engine
        flutterEngine = FlutterEngine(this)
        flutterEngine?.dartExecutor?.executeDartEntrypoint(
            DartExecutor.DartEntrypoint.createDefault()
        )
        
        // Create and attach Flutter view safely
        flutterEngine?.let { engine ->
            flutterView = FlutterView(this)
            flutterView?.attachToFlutterEngine(engine)
            setContentView(flutterView)
        }
    }

    override fun onDreamingStarted() {
        super.onDreamingStarted()
    }

    override fun onDreamingStopped() {
        super.onDreamingStopped()
    }

    override fun onDetachedFromWindow() {
        super.onDetachedFromWindow()
        
        // Clean up Flutter resources
        flutterView?.detachFromFlutterEngine()
        flutterEngine?.destroy()
        
        flutterView = null
        flutterEngine = null
    }
}
