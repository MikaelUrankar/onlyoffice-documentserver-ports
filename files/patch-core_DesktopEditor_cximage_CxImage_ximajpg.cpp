--- core/DesktopEditor/cximage/CxImage/ximajpg.cpp.orig	2020-05-22 08:21:42 UTC
+++ core/DesktopEditor/cximage/CxImage/ximajpg.cpp
@@ -9,7 +9,7 @@
 
 #if CXIMAGE_SUPPORT_JPG
 
-#ifdef _LINUX
+#if defined(__FreeBSD__) || defined(_LINUX)
  #include <jmorecfg.h>
 #else
  #include "../jpeg/jmorecfg.h"
