--- core/HtmlFile/HtmlFile.cpp.orig	2020-05-22 08:21:42 UTC
+++ core/HtmlFile/HtmlFile.cpp
@@ -45,7 +45,7 @@
 #include <vector>
 #include <map>
 
-#ifdef LINUX
+#if defined(__FreeBSD__) || defined(LINUX)
 #include <unistd.h>
 #include <sys/wait.h>
 #include <stdio.h>
@@ -408,7 +408,7 @@ int CHtmlFile::Convert(const std::vector<std::wstring>
     NSFile::CFileBinary::Remove(sTempFileForParams);
 #endif
 
-#ifdef LINUX
+#if defined(__FreeBSD__) || defined(LINUX)
     std::wstring sTempFileForParams = NSFile::CFileBinary::CreateTempFileWithUniqueName(NSFile::CFileBinary::GetTempPath(), L"XML");
     NSFile::CFileBinary oFile;
     oFile.CreateFileW(sTempFileForParams);
