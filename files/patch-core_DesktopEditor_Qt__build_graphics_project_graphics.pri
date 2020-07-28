--- core/DesktopEditor/Qt_build/graphics/project/graphics.pri.orig	2020-05-22 08:21:42 UTC
+++ core/DesktopEditor/Qt_build/graphics/project/graphics.pri
@@ -9,6 +9,12 @@ DEFINES += \
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
