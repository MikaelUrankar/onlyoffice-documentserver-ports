--- core/DesktopEditor/allthemesgen/allthemesgen.pro.orig	2021-09-30 12:13:32 UTC
+++ core/DesktopEditor/allthemesgen/allthemesgen.pro
@@ -33,4 +33,9 @@ core_linux {
     QMAKE_LFLAGS += -Wl,--rpath=./
 }
 
+core_freebsd {
+    LIBS += -liconv
+}
+
+
 SOURCES += main.cpp
