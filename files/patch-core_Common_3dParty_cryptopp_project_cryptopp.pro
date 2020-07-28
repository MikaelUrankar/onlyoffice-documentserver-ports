--- core/Common/3dParty/cryptopp/project/cryptopp.pro.orig	2020-05-22 08:21:42 UTC
+++ core/Common/3dParty/cryptopp/project/cryptopp.pro
@@ -11,6 +11,7 @@ PWD_ROOT_DIR = $$PWD
 
 include(../../../../Common/base.pri)
 
+core_freebsd:DEFINES -= NDEBUG
 core_linux:DEFINES -= NDEBUG
 core_mac:DEFINES -= MAC
 core_ios:DEFINES -= MAC
