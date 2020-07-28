--- core/Common/DocxFormat/Source/Base/Types_32.h.orig	2020-05-22 08:21:42 UTC
+++ core/Common/DocxFormat/Source/Base/Types_32.h
@@ -38,7 +38,7 @@
 	typedef unsigned __int16	_UINT16;
 	typedef unsigned __int32	_UINT32;
 	typedef unsigned __int64	_UINT64;
-#elif __linux__
+#elif defined(__FreeBSD__) || defined(__linux__)
         typedef int16_t             _INT16;
         typedef int32_t             _INT32;
         typedef int64_t             _INT64;
