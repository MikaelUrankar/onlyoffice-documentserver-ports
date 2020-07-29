--- core/Common/DocxFormat/Source/XlsxFormat/Common.cpp.orig	2020-05-22 08:21:42 UTC
+++ core/Common/DocxFormat/Source/XlsxFormat/Common.cpp
@@ -43,6 +43,10 @@
 #define _gcvt gcvt
 #endif
 
+#ifdef __FreeBSD__
+#define _gcvt(x,n,b) sprintf(b, "%.*g", n, x);
+#endif
+
 #define DBL_MAX 15
 #define DBL_MAXDIG10 17
 
