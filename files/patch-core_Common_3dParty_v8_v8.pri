--- core/Common/3dParty/v8/v8.pri.orig	2021-09-30 12:13:32 UTC
+++ core/Common/3dParty/v8/v8.pri
@@ -31,6 +31,20 @@ core_windows {
     LIBS += -lShlwapi
 }
 
+core_freebsd {
+    use_v8_monolith {
+        LIBS += -L$$CORE_V8_PATH_LIBS -lv8_monolith
+    } else {
+        SNAPSHOT_LIB=v8_snapshot
+        !exists($$CORE_V8_PATH_LIBS/libv8_snapshot.a) {
+            SNAPSHOT_LIB=v8_nosnapshot
+        }
+
+        LIBS += -L$$CORE_V8_PATH_LIBS -lv8_base -lv8_libplatform -lv8_libbase -l$$SNAPSHOT_LIB -lv8_libsampler
+        LIBS += -L$$CORE_V8_PATH_LIBS/third_party/icu -licui18n -licuuc
+    }
+}
+
 core_linux {
     use_v8_monolith {
         LIBS += -L$$CORE_V8_PATH_LIBS -lv8_monolith
