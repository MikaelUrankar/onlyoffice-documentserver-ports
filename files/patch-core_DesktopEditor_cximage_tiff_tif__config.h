--- core/DesktopEditor/cximage/tiff/tif_config.h.orig	2020-05-22 08:21:42 UTC
+++ core/DesktopEditor/cximage/tiff/tif_config.h
@@ -19,7 +19,7 @@
 #define HAVE_SYS_TYPES_H 1
 
 /* Define to 1 if you have the <io.h> header file. */
-#ifndef _LINUX
+#if !defined(__FreeBSD__) && !defined(_LINUX)
 #define HAVE_IO_H 1
 #endif
 
@@ -35,7 +35,7 @@
 /* The size of a `long', as computed by sizeof. */
 #define SIZEOF_LONG 4
 
-#ifndef _LINUX
+#if !defined(__FreeBSD__) && !defined(_LINUX)
 /* Signed 64-bit type */
 #define TIFF_INT64_T signed __int64
 
@@ -43,7 +43,7 @@
 #define TIFF_UINT64_T unsigned __int64
 #endif
 
-#ifdef _LINUX
+#if  defined(__FreeBSD__) || defined(_LINUX)
 #include <inttypes.h>
 
 /* Signed 64-bit type */
@@ -69,7 +69,7 @@
 //# endif
 //#endif
 
-#ifndef _LINUX
+#if !defined(__FreeBSD__) && !defined(_LINUX)
 #define lfind _lfind
 #endif
 /*
