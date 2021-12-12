--- core/ASCOfficeRtfFile/RtfFormatLib/source/Utils.h.orig	2020-05-22 08:21:42 UTC
+++ core/ASCOfficeRtfFile/RtfFormatLib/source/Utils.h
@@ -565,7 +565,7 @@ class RtfUtility (public)
 				sResult.erase(outsize_with_0 - 1);
                 ansi = false;
             }
-#elif defined(__linux__)
+#elif defined(__FreeBSD__) || defined(__linux__)
             std::string sCodepage =  "CP" + std::to_string(nCodepage);
 
             iconv_t ic= iconv_open("WCHAR_T", sCodepage.c_str());
