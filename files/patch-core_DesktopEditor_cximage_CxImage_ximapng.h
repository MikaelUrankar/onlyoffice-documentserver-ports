--- core/DesktopEditor/cximage/CxImage/ximapng.h.orig	2020-05-22 08:21:42 UTC
+++ core/DesktopEditor/cximage/CxImage/ximapng.h
@@ -22,7 +22,7 @@
 #if CXIMAGE_SUPPORT_PNG
 
 extern "C" {
-#ifdef _LINUX
+#if defined(__FreeBSD__) || defined(_LINUX)
  #undef _DLL
  #include <png.h>
  #include <pngstruct.h>
