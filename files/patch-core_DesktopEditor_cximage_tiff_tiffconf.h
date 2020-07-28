--- core/DesktopEditor/cximage/tiff/tiffconf.h.orig	2020-05-22 08:21:42 UTC
+++ core/DesktopEditor/cximage/tiff/tiffconf.h
@@ -25,7 +25,7 @@
 /* Signed 64-bit type formatter */
 #define TIFF_INT64_FORMAT "%lld"
 
-#ifndef _LINUX
+#if defined(__FreeBSD__) || defined(_LINUX)
 /* Signed 64-bit type */
 #define TIFF_INT64_T signed __int64
 
@@ -33,7 +33,7 @@
 #define TIFF_UINT64_T unsigned __int64
 #endif
 
-#ifdef _LINUX
+#if defined(__FreeBSD__) || defined(_LINUX)
 #include <inttypes.h>
 
 /* Signed 64-bit type */
