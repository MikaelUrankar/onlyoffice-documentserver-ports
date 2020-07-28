--- core/DesktopEditor/cximage/CxImage/ximajas.h.orig	2020-05-22 08:21:42 UTC
+++ core/DesktopEditor/cximage/CxImage/ximajas.h
@@ -16,7 +16,7 @@
 
 #if CXIMAGE_SUPPORT_JASPER
 
-#ifdef _LINUX
+#if defined(__FreeBSD__) || defined(_LINUX)
  #include <jasper/jasper.h>
 #else
  #include "../jasper/include/jasper/jasper.h"
