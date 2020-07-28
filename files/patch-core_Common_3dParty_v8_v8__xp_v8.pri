--- core/Common/3dParty/v8/v8_xp/v8.pri.orig	2020-05-22 08:21:42 UTC
+++ core/Common/3dParty/v8/v8_xp/v8.pri
@@ -16,6 +16,11 @@ core_windows {
     LIBS += -lShell32
 }
 
+core_freebsd {
+    LIBS += -lv8_libplatform -lv8_libbase
+    LIBS += -licui18n -licuuc
+}
+
 core_linux {
     LIBS += -L$$CORE_V8_PATH_LIBS -lv8_base -lv8_libplatform -lv8_libbase -lv8_nosnapshot -lv8_external_snapshot
     LIBS += -L$$CORE_V8_PATH_LIBS -licui18n -licuuc -licudata
