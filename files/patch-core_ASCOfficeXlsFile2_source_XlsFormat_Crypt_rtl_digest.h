--- core/ASCOfficeXlsFile2/source/XlsFormat/Crypt/rtl/digest.h.orig	2020-05-22 08:21:42 UTC
+++ core/ASCOfficeXlsFile2/source/XlsFormat/Crypt/rtl/digest.h
@@ -31,7 +31,7 @@
  */
 #pragma once
 
-#ifdef __linux__
+#if defined(__FreeBSD__) || defined(__linux__)
     #include <inttypes.h>
 #endif
 
