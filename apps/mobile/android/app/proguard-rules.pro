# Flutter plugins and Drift are resolved through generated registrants and
# reflection. Keep their public entry points while allowing other code to shrink.
-keep class io.flutter.** { *; }
-keep class com.niva.mobile.** { *; }
-keep class * extends android.app.Application { *; }
-keep class * extends android.content.ContentProvider { *; }
