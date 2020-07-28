--- core/DesktopEditor/AllFontsGen/AllFontsGen.pro.orig	2020-05-22 08:21:42 UTC
+++ core/DesktopEditor/AllFontsGen/AllFontsGen.pro
@@ -17,6 +17,12 @@ DEFINES += KERNEL_USE_DYNAMIC_LIBRARY
 DEFINES += GRAPHICS_USE_DYNAMIC_LIBRARY
 ADD_DEPENDENCY(graphics, kernel, UnicodeConverter)
 
+core_freebsd {
+    LIBS += -lz -pthread
+
+    QMAKE_LFLAGS += -Wl,--rpath=./
+}
+
 core_windows {
     DEFINES += \
     JAS_WIN_MSVC_BUILD \
