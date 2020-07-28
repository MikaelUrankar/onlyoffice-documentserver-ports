--- core/DesktopEditor/xmlsec/src/ooxmlsignature.pro.orig	2020-05-22 08:21:42 UTC
+++ core/DesktopEditor/xmlsec/src/ooxmlsignature.pro
@@ -20,6 +20,10 @@ ADD_DEPENDENCY(kernel)
 
 DEFINES -= UNICODE
 
+core_freebsd {
+    CONFIG += signature_openssl
+}
+
 core_linux {
     CONFIG += signature_openssl
 }
