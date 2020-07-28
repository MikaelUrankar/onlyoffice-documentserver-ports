--- core/HtmlFile/HtmlFile.pro.orig	2020-05-22 08:21:42 UTC
+++ core/HtmlFile/HtmlFile.pro
@@ -18,6 +18,10 @@ include(../Common/base.pri)
 
 ADD_DEPENDENCY(kernel, UnicodeConverter)
 
+core_freebsd {
+    DEFINES += asc_static_link_libstd
+}
+
 core_linux {
     DEFINES += asc_static_link_libstd
 }
