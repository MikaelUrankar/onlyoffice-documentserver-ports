--- core/X2tConverter/build/Qt/X2tConverter.pri.orig	2020-05-22 08:21:42 UTC
+++ core/X2tConverter/build/Qt/X2tConverter.pri
@@ -100,6 +100,10 @@ ADD_DEPENDENCY(graphics, kernel, UnicodeConverter, Pdf
 CONFIG += core_boost_regex
 include($$PWD/../../../Common/3dParty/boost/boost.pri)
 
+core_freebsd {
+    LIBS += -liconv
+}
+
 core_windows {
     LIBS += -lAdvapi32
 }
