--- core/Common/3dParty/icu/icu.pri.orig	2021-09-30 12:13:32 UTC
+++ core/Common/3dParty/icu/icu.pri
@@ -1,4 +1,4 @@
-ICU_MAJOR_VER = 58
+ICU_MAJOR_VER = 70
 
 core_windows {
     exists($$PWD/$$CORE_BUILDS_PLATFORM_PREFIX/icu) {
@@ -8,6 +8,13 @@ core_windows {
     }
 
     LIBS        += -L$$PWD/$$CORE_BUILDS_PLATFORM_PREFIX/build -licuuc
+}
+
+core_freebsd {
+    INCLUDEPATH += /usr/local/include
+
+    LIBS        += /usr/local/lib/libicuuc.so.$$ICU_MAJOR_VER
+    LIBS        += /usr/local/lib/libicudata.so.$$ICU_MAJOR_VER
 }
 
 core_linux {
