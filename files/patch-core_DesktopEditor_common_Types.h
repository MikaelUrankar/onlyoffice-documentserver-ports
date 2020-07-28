--- core/DesktopEditor/common/Types.h.orig	2020-05-22 08:21:42 UTC
+++ core/DesktopEditor/common/Types.h
@@ -75,7 +75,7 @@ typedef int				INT;
 typedef unsigned int	UINT, *PUINT;
 typedef wchar_t			WCHAR;
 
-#ifdef __linux__
+#if defined(__FreeBSD__) || defined(__linux__)
 #include <inttypes.h>
 typedef int64_t     T_LONG64;
 typedef uint64_t    T_ULONG64;
