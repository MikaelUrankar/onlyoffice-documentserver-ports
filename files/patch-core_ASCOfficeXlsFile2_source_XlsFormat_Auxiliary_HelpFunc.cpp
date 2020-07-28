--- core/ASCOfficeXlsFile2/source/XlsFormat/Auxiliary/HelpFunc.cpp.orig	2020-05-22 08:21:42 UTC
+++ core/ASCOfficeXlsFile2/source/XlsFormat/Auxiliary/HelpFunc.cpp
@@ -352,7 +352,7 @@ const std::wstring unescape_ST_Xstring(const std::wstr
     while(true)
 	{
         
-#if defined(__linux__) || defined(_MAC) || defined(_IOS)
+#if defined(__FreeBSD__) || defined(__linux__) || defined(_MAC) || defined(_IOS)
 		const auto it_range = boost::make_iterator_range(x_pos_noncopied, wstr_end);
         x_pos_next = boost::algorithm::find_first(it_range, L"_x").begin();
 #else
@@ -469,7 +469,7 @@ std::wstring toStdWStringSystem(std::string ansi_strin
 			sResult.erase(outsize_with_0 - 1);
             ansi = false;
         }
-#elif defined(__linux__)
+#elif defined(__FreeBSD__) || defined(__linux__)
         std::string sCodepage =  "CP" + std::to_string(code_page);
 
         iconv_t ic= iconv_open("WCHAR_T", sCodepage.c_str());
