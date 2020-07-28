--- core/DesktopEditor/cximage/CxImage/ximajpg.h.orig	2020-05-22 08:21:42 UTC
+++ core/DesktopEditor/cximage/CxImage/ximajpg.h
@@ -29,7 +29,7 @@
 #define CXIMAGEJPG_SUPPORT_EXIF CXIMAGE_SUPPORT_EXIF
 
 extern "C" {
-#ifdef _LINUX
+#if defined(__FreeBSD__) || defined(_LINUX)
  #include <jpeglib.h>
  #include <jerror.h>
 #else
