--- core/DesktopEditor/cximage/CxImage/ximainfo.cpp.orig	2020-05-22 08:21:42 UTC
+++ core/DesktopEditor/cximage/CxImage/ximainfo.cpp
@@ -5,7 +5,7 @@
 
 #include "ximage.h"
 
-#if defined(_LINUX) || defined(__APPLE__)
+#if defined(__FreeBSD__) || defined(_LINUX) || defined(__APPLE__)
     #ifdef UNICODE
         #define _tcsnicmp(a,b,c) wcscasecmp(a,b)
     #else
