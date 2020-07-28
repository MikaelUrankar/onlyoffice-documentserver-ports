--- core/DesktopEditor/cximage/CxImage/ximage.h.orig	2020-05-22 08:21:42 UTC
+++ core/DesktopEditor/cximage/CxImage/ximage.h
@@ -52,7 +52,7 @@
 #pragma once
 #endif 
 
-#ifdef _LINUX
+#if defined(__FreeBSD__) || defined(_LINUX)
   #define _XOPEN_SOURCE
   #include <unistd.h>
   #include <arpa/inet.h>
