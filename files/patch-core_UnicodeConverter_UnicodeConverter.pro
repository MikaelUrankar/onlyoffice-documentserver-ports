--- core/UnicodeConverter/UnicodeConverter.pro.orig	2020-05-22 08:21:42 UTC
+++ core/UnicodeConverter/UnicodeConverter.pro
@@ -15,6 +15,10 @@ include(../Common/base.pri)
 
 DEFINES += UNICODECONVERTER_USE_DYNAMIC_LIBRARY
 
+core_freebsd {
+    QMAKE_LFLAGS += -Wl,--rpath=./
+}
+
 core_linux {
     QMAKE_LFLAGS += -Wl,--rpath=./
 }
