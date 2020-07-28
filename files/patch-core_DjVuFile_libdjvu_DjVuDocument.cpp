--- core/DjVuFile/libdjvu/DjVuDocument.cpp.orig	2020-05-22 08:21:42 UTC
+++ core/DjVuFile/libdjvu/DjVuDocument.cpp
@@ -78,7 +78,7 @@
 
 #include "debug.h"
 
-#if defined(__linux__) || defined(LINUX)
+#if defined(__FreeBSD__) || defined(__linux__) || defined(LINUX)
 typedef unsigned int	UINT;
 #endif
 
