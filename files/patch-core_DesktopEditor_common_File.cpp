--- core/DesktopEditor/common/File.cpp.orig	2020-05-22 10:21:42 UTC
+++ core/DesktopEditor/common/File.cpp
@@ -39,10 +39,14 @@
     #include <windows.h>
 #endif
 
-#if defined(__linux__) || defined(_MAC) && !defined(_IOS)
+#if defined(__FreeBSD__) || defined(__linux__) || defined(_MAC) && !defined(_IOS)
 #include <unistd.h>
 #include <string.h>
+#if defined(__FreeBSD__)
+#include <sys/types.h>
+#include <sys/sysctl.h>
 #endif
+#endif
 
 #ifdef _IOS
     #include <unistd.h>
@@ -1461,7 +1465,7 @@ namespace NSFile
         return std::wstring(buf);
 #endif
 
-#if defined(__linux__) || defined(_MAC) && !defined(_IOS)
+#if defined(__FreeBSD__) || defined(__linux__) || defined(_MAC) && !defined(_IOS)
         char buf[NS_FILE_MAX_PATH];
         memset(buf, 0, NS_FILE_MAX_PATH);
         if (readlink ("/proc/self/exe", buf, NS_FILE_MAX_PATH) <= 0)
@@ -1472,6 +1476,16 @@ namespace NSFile
             std::string sUTF8(buf);
             std::wstring sRet = CUtf8Converter::GetUnicodeStringFromUTF8((BYTE*)sUTF8.c_str(), sUTF8.length());
             return sRet;
+#elif defined(__FreeBSD__)
+        int mib[4] = {CTL_KERN, KERN_PROC, KERN_PROC_PATHNAME, -1};
+	size_t len = sizeof(buf);
+
+        if (sysctl(mib, 4, buf, &len, NULL, 0) == 0)
+        {
+            std::string sUTF8(buf);
+            std::wstring sRet = CUtf8Converter::GetUnicodeStringFromUTF8((BYTE*)sUTF8.c_str(), sUTF8.length());
+            return sRet;
+        }
 #endif
             return L"";
         }
