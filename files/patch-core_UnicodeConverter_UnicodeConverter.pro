--- core/UnicodeConverter/UnicodeConverter.pro.orig	2020-08-21 14:25:37 UTC
+++ core/UnicodeConverter/UnicodeConverter.pro
@@ -15,6 +15,11 @@ include(../Common/base.pri)
 
 DEFINES += UNICODECONVERTER_USE_DYNAMIC_LIBRARY
 
+core_freebsd {    
+    QMAKE_LFLAGS += "-Wl,-rpath,\'\$$ORIGIN\'"
+    QMAKE_LFLAGS += -Wl,--disable-new-dtags
+}
+
 core_linux {    
     QMAKE_LFLAGS += "-Wl,-rpath,\'\$$ORIGIN\'"
     QMAKE_LFLAGS += -Wl,--disable-new-dtags
