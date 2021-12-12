--- core/PdfWriter/PdfWriter.pro.orig	2020-05-22 08:21:42 UTC
+++ core/PdfWriter/PdfWriter.pro
@@ -22,6 +22,10 @@ LIBS += -L$$CORE_BUILDS_LIBRARIES_PATH -lCryptoPPLib
 
 DEFINES += NOMINMAX
 
+core_freebsd {
+    QMAKE_CXXFLAGS += -Wno-narrowing
+}
+
 core_linux {
     QMAKE_CXXFLAGS += -Wno-narrowing
 }
