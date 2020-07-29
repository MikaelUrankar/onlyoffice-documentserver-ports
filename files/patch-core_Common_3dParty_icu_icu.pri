XXX /usr/local


--- core/Common/3dParty/icu/icu.pri.orig	2020-05-22 08:21:42 UTC
+++ core/Common/3dParty/icu/icu.pri
@@ -1,5 +1,12 @@
 ICU_MAJOR_VER = 58
 
+core_freebsd {
+    INCLUDEPATH += /usr/local/include
+
+    LIBS        += -licuuc
+    LIBS        += -licudata
+}
+
 core_windows {
     exists($$PWD/$$CORE_BUILDS_PLATFORM_PREFIX/icu) {
         INCLUDEPATH += $$PWD/$$CORE_BUILDS_PLATFORM_PREFIX/icu/include
