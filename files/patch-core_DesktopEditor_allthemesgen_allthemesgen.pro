--- core/DesktopEditor/allthemesgen/allthemesgen.pro.orig	2020-05-22 08:21:42 UTC
+++ core/DesktopEditor/allthemesgen/allthemesgen.pro
@@ -17,6 +17,12 @@ DEFINES += KERNEL_USE_DYNAMIC_LIBRARY
 DEFINES += GRAPHICS_USE_DYNAMIC_LIBRARY
 ADD_DEPENDENCY(graphics, kernel, UnicodeConverter, doctrenderer)
 
+core_freebsd {
+    LIBS += -lz -pthread
+
+    QMAKE_LFLAGS += -Wl,--rpath=./
+}
+
 core_windows {
     DEFINES -= UNICODE
     DEFINES -= _UNICODE
