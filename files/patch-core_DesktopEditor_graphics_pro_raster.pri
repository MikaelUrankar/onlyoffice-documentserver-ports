--- core/DesktopEditor/graphics/pro/raster.pri.orig	2020-05-22 08:21:42 UTC
+++ core/DesktopEditor/graphics/pro/raster.pri
@@ -11,6 +11,12 @@ DEFINES += \
     MNG_STORE_CHUNKS\
     MNG_ERROR_TELLTALE
 
+core_freebsd {
+    DEFINES += \
+    HAVE_UNISTD_H
+    QMAKE_CXXFLAGS += -Wno-narrowing
+}
+
 core_linux {
     DEFINES += \
     HAVE_UNISTD_H
