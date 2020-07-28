--- core/DjVuFile/DjVuFile.pro.orig	2020-05-22 08:21:42 UTC
+++ core/DjVuFile/DjVuFile.pro
@@ -21,6 +21,17 @@ DEFINES -= \
     UNICODE \
     _UNICODE
 
+core_freebsd {
+    DEFINES += \
+    HAVE_UNISTD_H \
+    HAVE_MBSTATE_T \
+    GCONTAINER_NO_MEMBER_TEMPLATES="1" \
+    HAS_WCHAR \
+    HAVE_WCHAR_H \
+    UNIX \
+    HAVE_STDINCLUDES
+}
+
 core_linux {
     DEFINES += \
     HAVE_UNISTD_H \
