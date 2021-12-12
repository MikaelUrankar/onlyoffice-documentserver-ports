--- core/DesktopEditor/Qt_build/graphics/project/graphics_fonts.pri.orig	2020-05-22 08:21:42 UTC
+++ core/DesktopEditor/Qt_build/graphics/project/graphics_fonts.pri
@@ -3,6 +3,11 @@ DEFINES += \
     _QT \
     FT2_BUILD_LIBRARY
 
+core_freebsd {
+    DEFINES += \
+    HAVE_UNISTD_H
+}
+
 core_linux {
     DEFINES += \
     HAVE_UNISTD_H
