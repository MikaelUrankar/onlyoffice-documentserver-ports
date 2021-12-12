--- core/DesktopEditor/xmlsec/libxmlsec.pro.orig	2020-05-22 08:21:42 UTC
+++ core/DesktopEditor/xmlsec/libxmlsec.pro
@@ -45,6 +45,16 @@ DEFINES += \
     IN_XMLSEC \
     XMLSEC_STATIC
 
+core_freebsd {
+    #CONFIG += use_gcrypt
+    #CONFIG += use_gnutls
+    #CONFIG += use_mscrypto
+    #CONFIG += use_nss
+    CONFIG += use_openssl
+    #CONFIG += use_skeleton
+    #CONFIG += use_xslt
+}
+
 core_linux {
     #CONFIG += use_gcrypt
     #CONFIG += use_gnutls
