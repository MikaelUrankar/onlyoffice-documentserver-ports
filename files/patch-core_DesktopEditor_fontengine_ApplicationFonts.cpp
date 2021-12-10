--- core/DesktopEditor/fontengine/ApplicationFonts.cpp.orig	2021-09-30 12:13:32 UTC
+++ core/DesktopEditor/fontengine/ApplicationFonts.cpp
@@ -1594,7 +1594,7 @@ void CApplicationFonts::Initialize(bool bIsCheckSelect
 	InitFromReg();
 #endif
 
-#if defined(_LINUX) && !defined(_MAC) && !defined(__ANDROID__)
+#if ( defined(_LINUX) || defined(__FreeBSD__) ) && !defined(_MAC) && !defined(__ANDROID__)
 	m_oList.LoadFromFolder(L"/usr/share/fonts");
 #endif
 
