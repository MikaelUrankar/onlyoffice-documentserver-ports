--- core/DesktopEditor/graphics/pro/graphics.pro.orig	2020-05-22 08:21:42 UTC
+++ core/DesktopEditor/graphics/pro/graphics.pro
@@ -34,6 +34,12 @@ DEFINES += \
 
 DEFINES += FT_SUPPORT_UTF8_IN_NAMES
 
+core_freebsd {
+    DEFINES += \
+    HAVE_UNISTD_H
+    QMAKE_CXXFLAGS += -Wno-narrowing
+}
+
 core_linux {
     DEFINES += \
     HAVE_UNISTD_H
