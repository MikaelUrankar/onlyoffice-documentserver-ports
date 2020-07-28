--- core/DesktopEditor/xmlsec/test/OpenSSL_gui_test/OpenSSL_gui_test.pro.orig	2020-05-22 08:21:42 UTC
+++ core/DesktopEditor/xmlsec/test/OpenSSL_gui_test/OpenSSL_gui_test.pro
@@ -19,6 +19,10 @@ CORE_ROOT_DIR = $$PWD/../../../..
 PWD_ROOT_DIR = $$PWD
 include($$CORE_ROOT_DIR/Common/base.pri)
 
+core_freebsd {
+    QMAKE_LFLAGS += -Wl,--rpath=./
+}
+
 core_linux {
     QMAKE_LFLAGS += -Wl,--rpath=./
     QMAKE_LFLAGS += -static-libstdc++ -static-libgcc
