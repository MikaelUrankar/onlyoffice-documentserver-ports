--- core/Common/3dParty/v8/v8.pri.orig	2020-05-22 08:21:42 UTC
+++ core/Common/3dParty/v8/v8.pri
@@ -5,6 +5,11 @@ INCLUDEPATH += \
     $$CORE_V8_PATH_INCLUDE \
     $$CORE_V8_PATH_INCLUDE/include
 
+core_freebsd {
+    LIBS += -lv8_libplatform -lv8_libbase
+    LIBS += -licui18n -licuuc
+}
+
 core_windows {
     CORE_V8_PATH_LIBS = $$CORE_V8_PATH_INCLUDE/out.gn/$$CORE_BUILDS_PLATFORM_PREFIX/$$CORE_BUILDS_CONFIGURATION_PREFIX/obj
 
