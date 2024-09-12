--- core/Common/3dParty/html/css/src/StyleProperties.cpp.orig	2024-08-28 20:31:59 UTC
+++ core/Common/3dParty/html/css/src/StyleProperties.cpp
@@ -109,7 +109,7 @@ namespace NSCSS
 	void CString::Clear()
 	{
 		m_oValue.clear();
-		m_unLevel    = NULL;
+		m_unLevel    = 0;
 		m_bImportant = false;
 	}
 
@@ -183,7 +183,7 @@ namespace NSCSS
 	void CDigit::Clear()
 	{
 		m_oValue        = DBL_MAX;
-		m_unLevel       = NULL;
+		m_unLevel       = 0;
 		m_enUnitMeasure = None;
 		m_bImportant    = false;
 	}
@@ -618,7 +618,7 @@ namespace NSCSS
 	void CColor::Clear()
 	{
 		m_oValue.Clear();
-		m_unLevel    = NULL;
+		m_unLevel    = 0;
 		m_bImportant = false;
 	}
 
@@ -2631,7 +2631,7 @@ namespace NSCSS
 	void CEnum::Clear()
 	{
 		m_oValue     = INT_MAX;
-		m_unLevel    = NULL;
+		m_unLevel    = 0;
 		m_bImportant = false;
 	}
 
