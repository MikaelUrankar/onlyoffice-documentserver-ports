--- core/DesktopEditor/common/Directory.cpp.orig	2020-05-22 08:21:42 UTC
+++ core/DesktopEditor/common/Directory.cpp
@@ -35,7 +35,7 @@
     #include "windef.h"
     #include <shlobj.h>
     #include <Rpc.h>
-#elif __linux__
+#elif defined(__FreeBSD__) || defined(__linux__)
     #include <sys/types.h>
     #include <sys/stat.h>
     #include <unistd.h>
@@ -120,7 +120,7 @@ namespace NSDirectory
         FindClose( hRes );
 #endif
 
-#ifdef __linux__
+#if defined(__FreeBSD__) || defined(__linux__)
         BYTE* pUtf8 = NULL;
         LONG lLen = 0;
         NSFile::CUtf8Converter::GetUtf8StringFromUnicode(strDirectory.c_str(), strDirectory.length(), pUtf8, lLen, false);
@@ -233,7 +233,7 @@ namespace NSDirectory
 			}
 		} while( FindNextFileW( hRes, &oFD ) );		
 		FindClose( hRes );
-#elif __linux__
+#elif defined(__FreeBSD__) || defined(__linux__)
 		BYTE* pUtf8 = NULL;
 		LONG lLen = 0;
         NSFile::CUtf8Converter::GetUtf8StringFromUnicode(strDirectory.c_str(), strDirectory.length(), pUtf8, lLen, false);
@@ -297,7 +297,7 @@ namespace NSDirectory
 #if defined(_WIN32) || defined (_WIN64)
 		DWORD dwAttrib = ::GetFileAttributesW(strDirectory.c_str());
 		return (dwAttrib != INVALID_FILE_ATTRIBUTES && 0 != (dwAttrib & FILE_ATTRIBUTE_DIRECTORY));
-#elif __linux__
+#elif defined(__FreeBSD__) || defined(__linux__)
         BYTE* pUtf8 = NULL;
         LONG lLen = 0;
         NSFile::CUtf8Converter::GetUtf8StringFromUnicode(strDirectory.c_str(), strDirectory.length(), pUtf8, lLen, false);
@@ -396,7 +396,7 @@ namespace NSDirectory
         return true;
 #endif
 
-#ifdef __linux__
+#if defined(__FreeBSD__) || defined(__linux__)
         BYTE* pUtf8 = NULL;
         LONG lLen = 0;
         NSFile::CUtf8Converter::GetUtf8StringFromUnicode(strSrc.c_str(), strSrc.length(), pUtf8, lLen, false);
@@ -491,7 +491,7 @@ namespace NSDirectory
 		}
 #if defined(_WIN32) || defined (_WIN64)
 		if (deleteRoot) RemoveDirectoryW(strDirectory.c_str());
-#elif __linux__
+#elif defined(__FreeBSD__) ||  defined(__linux__)
 		BYTE* pUtf8 = NULL;
 		LONG lLen = 0;
         NSFile::CUtf8Converter::GetUtf8StringFromUnicode(strDirectory.c_str(), strDirectory.length(), pUtf8, lLen, false);
