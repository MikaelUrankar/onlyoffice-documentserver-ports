--- core/Common/base.pri.orig	2020-05-22 08:21:42 UTC
+++ core/Common/base.pri
@@ -76,6 +76,14 @@ android {
     DEFINES += __ANDROID__ LINUX _LINUX
 }
 
+freebsd-clang {
+    message("freebsd-clang")
+    CONFIG += core_freebsd
+    CONFIG += core_freebsd_64
+    QMAKE_CC = ccache clang10
+    QMAKE_CXX = ccache clang++10
+}
+
 win32:contains(QMAKE_TARGET.arch, x86_64): {
     CONFIG += core_win_64
 }
