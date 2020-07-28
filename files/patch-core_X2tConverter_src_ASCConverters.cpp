--- core/X2tConverter/src/ASCConverters.cpp.orig	2020-05-22 08:21:42 UTC
+++ core/X2tConverter/src/ASCConverters.cpp
@@ -3948,7 +3948,7 @@ namespace NExtractTools
 	{
 		bool bMacros = true;
 		
-		_UINT32 nRes = ConvertXls2Xlsx( sFrom, sTo, params.getPassword(), params.getFontPath(), sTemp, NULL, bMacros);
+		_UINT32 nRes = ConvertXls2Xlsx( sFrom, sTo, params.getPassword(), params.getFontPath(), sTemp, 0, bMacros);
 
 		nRes = processEncryptionError(nRes, sFrom, params);
 		return nRes;
@@ -3981,7 +3981,7 @@ namespace NExtractTools
         NSDirectory::CreateDirectory(sResultXlsxDir);
 
 		bool bMacros = true;
-		_UINT32 nRes = ConvertXls2Xlsx( sFrom, sResultXlsxDir, params.getPassword(), params.getFontPath(), sTemp, NULL, bMacros);
+		_UINT32 nRes = ConvertXls2Xlsx( sFrom, sResultXlsxDir, params.getPassword(), params.getFontPath(), sTemp, 0, bMacros);
 
 		nRes = processEncryptionError(nRes, sFrom, params);
 		if (SUCCEEDED_X2T(nRes))
