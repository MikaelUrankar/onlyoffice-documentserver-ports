--- core/DesktopEditor/raster/JBig2/source/LeptonLib/readfile.cpp.orig	2020-05-22 10:21:42.000000000 +0200
+++ core/DesktopEditor/raster/JBig2/source/LeptonLib/readfile.cpp	2020-06-28 18:08:35.198802000 +0200
@@ -68,7 +68,7 @@ static const char *FILE_JPG  =  "/tmp/junkout.jpg";
 /* I found these from the source code to the unix file */
 /* command. man 1 file */
 
-#if defined(__APPLE__)  // compile on xcode
+#if defined(__clang__)  // compile with clang
 
 static const char JP2K_CODESTREAM[4] = {
     (char)0xff, (char)0x4f, (char)0xff, (char)0x51
