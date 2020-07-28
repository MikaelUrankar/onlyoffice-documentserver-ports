--- core/UnicodeConverter/icubuilds-mac/icu/unicode/platform.h.orig	2020-05-22 08:21:42 UTC
+++ core/UnicodeConverter/icubuilds-mac/icu/unicode/platform.h
@@ -150,7 +150,7 @@
 #   include <android/api-level.h>
 #elif defined(__native_client__)
 #   define U_PLATFORM U_PF_BROWSER_NATIVE_CLIENT
-#elif defined(linux) || defined(__linux__) || defined(__linux)
+#elif defined(__FreeBSD__) || defined(linux) || defined(__linux__) || defined(__linux)
 #   define U_PLATFORM U_PF_LINUX
 #elif defined(__APPLE__) && defined(__MACH__)
 #   include <TargetConditionals.h>
