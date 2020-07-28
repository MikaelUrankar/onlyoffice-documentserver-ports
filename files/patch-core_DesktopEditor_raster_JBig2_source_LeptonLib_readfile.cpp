--- core/DesktopEditor/raster/JBig2/source/LeptonLib/readfile.cpp.orig	2020-05-22 08:21:42 UTC
+++ core/DesktopEditor/raster/JBig2/source/LeptonLib/readfile.cpp
@@ -81,10 +81,10 @@ static const char JP2K_IMAGE_DATA[12] = {
 };
 
 #else
-static const char JP2K_CODESTREAM[4] = { 0xff, 0x4f, 0xff, 0x51 };
+static const char JP2K_CODESTREAM[4] = { static_cast<char>(0xff), 0x4f, static_cast<char>(0xff), 0x51 };
 static const char JP2K_IMAGE_DATA[12] = { 0x00, 0x00, 0x00, 0x0C,
     0x6A, 0x50, 0x20, 0x20,
-    0x0D, 0x0A, 0x87, 0x0A };
+    0x0D, 0x0A, static_cast<char>(0x87), 0x0A };
 #endif
 
 /*---------------------------------------------------------------------*
