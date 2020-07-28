--- core/DesktopEditor/common/Path.cpp.orig	2020-05-22 08:21:42 UTC
+++ core/DesktopEditor/common/Path.cpp
@@ -34,7 +34,7 @@
 
 #if defined(_WIN32) || defined (_WIN64)
     #include <tchar.h>
-#elif __linux__ || MAC
+#elif __FreeBSD__ || __linux__ || MAC
     #include <libgen.h>
 #endif
 
@@ -53,7 +53,7 @@ namespace NSSystemPath
 		sRes.append(tFolder);
 		if(sRes.length() > 0)
 			sRes.erase(sRes.length()-1);
-#elif __linux__ || MAC
+#elif __FreeBSD__ || __linux__ || MAC
 		BYTE* pUtf8 = NULL;
 		LONG lLen = 0;
 		NSFile::CUtf8Converter::GetUtf8StringFromUnicode(strFileName.c_str(), strFileName.length(), pUtf8, lLen, false);
@@ -73,7 +73,7 @@ namespace NSSystemPath
 		sRes.append(tFilename);
 		sRes.append(tExt);
 		return sRes;
-#elif __linux__ || MAC
+#elif __FreeBSD__ || __linux__ || MAC
 		BYTE* pUtf8 = NULL;
 		LONG lLen = 0;
 		NSFile::CUtf8Converter::GetUtf8StringFromUnicode(strFileName.c_str(), strFileName.length(), pUtf8, lLen, false);
