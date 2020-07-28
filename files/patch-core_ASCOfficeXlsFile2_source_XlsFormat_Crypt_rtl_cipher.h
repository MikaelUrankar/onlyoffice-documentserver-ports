--- core/ASCOfficeXlsFile2/source/XlsFormat/Crypt/rtl/cipher.h.orig	2020-05-22 08:21:42 UTC
+++ core/ASCOfficeXlsFile2/source/XlsFormat/Crypt/rtl/cipher.h
@@ -33,7 +33,7 @@
 
 #include <stddef.h>
 
-#ifdef __linux__
+#if defined(__FreeBSD__) || defined(__linux__)
     #include <inttypes.h>
 #endif
 
