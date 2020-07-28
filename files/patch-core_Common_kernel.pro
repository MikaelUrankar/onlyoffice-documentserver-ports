--- core/Common/kernel.pro.orig	2020-05-22 08:21:42 UTC
+++ core/Common/kernel.pro
@@ -32,6 +32,12 @@ HEADERS += \
 
 SOURCES += ./FileDownloader/FileDownloader.cpp
 
+core_freebsd{
+    SOURCES += \
+        ./FileDownloader/FileDownloader_curl.cpp
+
+    LIBS += -lcurl
+}
 core_windows {
     SOURCES += \
         ./FileDownloader/FileDownloader_win.cpp
