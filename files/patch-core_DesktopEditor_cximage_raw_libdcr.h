--- core/DesktopEditor/cximage/raw/libdcr.h.orig	2020-05-22 08:21:42 UTC
+++ core/DesktopEditor/cximage/raw/libdcr.h
@@ -42,7 +42,7 @@
  #include <sys/types.h>
 #endif
 
-#if defined(_LINUX) || defined(__APPLE__)
+#if defined(__FreeBSD__) || defined(_LINUX) || defined(__APPLE__)
  #include <setjmp.h>
  #include <sys/types.h>
  #define _swab   swab
