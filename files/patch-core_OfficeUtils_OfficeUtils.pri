--- core/OfficeUtils/OfficeUtils.pri.orig	2020-05-22 08:21:42 UTC
+++ core/OfficeUtils/OfficeUtils.pri
@@ -1,6 +1,11 @@
+core_freebsd {
+    QMAKE_CXXFLAGS += -Wall -Wno-ignored-qualifiers
+}
+
 core_linux {
     QMAKE_CXXFLAGS += -Wall -Wno-ignored-qualifiers
 }
+
 core_mac {
     QMAKE_CXXFLAGS += -Wall -Wno-ignored-qualifiers
     DEFINES += unix
