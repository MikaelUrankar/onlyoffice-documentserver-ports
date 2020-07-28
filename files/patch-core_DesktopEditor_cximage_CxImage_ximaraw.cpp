--- core/DesktopEditor/cximage/CxImage/ximaraw.cpp.orig	2020-05-22 08:21:42 UTC
+++ core/DesktopEditor/cximage/CxImage/ximaraw.cpp
@@ -204,7 +204,7 @@ bool CxImageRAW::Decode(CxFile *hFile)
 				for (c=0; c < dcr.colors; c++) ppm2[col*dcr.colors+c] = dcr.image[soff][c];
 		}
 		if (dcr.opt.output_bps == 16 && !dcr.opt.output_tiff && htons(0x55aa) != 0x55aa)
-#if defined(_LINUX) || defined(__APPLE__)
+#if defined(__FreeBSD__) || defined(_LINUX) || defined(__APPLE__)
 			swab ((char*)ppm2, (char*)ppm2, dcr.width*dcr.colors*2);
 #else
 			_swab ((char*)ppm2, (char*)ppm2, dcr.width*dcr.colors*2);
