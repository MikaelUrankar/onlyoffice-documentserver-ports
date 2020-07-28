--- core/DesktopEditor/common/File.cpp.orig	2020-05-22 08:21:42 UTC
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
@@ -1472,6 +1476,21 @@ namespace NSFile
             std::string sUTF8(buf);
             std::wstring sRet = CUtf8Converter::GetUnicodeStringFromUTF8((BYTE*)sUTF8.c_str(), sUTF8.length());
             return sRet;
+#endif
+#if defined(__FreeBSD__)
+        int mib[4] = {CTL_KERN, KERN_PROC, KERN_PROC_PATHNAME, -1};
+        char buf[NS_FILE_MAX_PATH];
+        size_t size = NS_FILE_MAX_PATH;
+
+        memset(buf, 0, NS_FILE_MAX_PATH);
+        if (sysctl(mib, 4, &buf, &size, NULL, 0) != 0) {
+            size = readlink("/proc/curproc/file", buf, size - 1);
+            if (size < 0)
+            return L"";
+        }
+        std::string sUTF8(buf);
+        std::wstring sRet = CUtf8Converter::GetUnicodeStringFromUTF8((BYTE*)sUTF8.c_str(), sUTF8.length());
+        return sRet;
 #endif
             return L"";
         }
