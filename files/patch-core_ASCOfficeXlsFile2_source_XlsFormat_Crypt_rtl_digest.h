--- core/ASCOfficeXlsFile2/source/XlsFormat/Crypt/rtl/digest.h.orig	2021-09-30 12:13:32 UTC
+++ core/ASCOfficeXlsFile2/source/XlsFormat/Crypt/rtl/digest.h
@@ -31,7 +31,7 @@
  */
 #pragma once
 
-#ifdef __linux__
+#if defined(__linux__) || defined(__FreeBSD__)
     #include <inttypes.h>
 #endif
 
