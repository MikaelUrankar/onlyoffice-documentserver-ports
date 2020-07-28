--- core/Common/DocxFormat/Source/DocxFormat/Docx.cpp.orig	2020-05-22 08:21:42 UTC
+++ core/Common/DocxFormat/Source/DocxFormat/Docx.cpp
@@ -67,7 +67,7 @@ namespace OOX {
 	void CDocx::FixAfterRead()
 	{
 		//solve id conflict between comments and documentComments
-		if(NULL != m_pComments && m_pComments->m_arrComments.size() > 0 && NULL != m_pDocumentComments && NULL != m_pDocumentComments->m_arrComments.size() > 0)
+		if(NULL != m_pComments && m_pComments->m_arrComments.size() > 0 && NULL != m_pDocumentComments && NULL != m_pDocumentComments && m_pDocumentComments->m_arrComments.size() > 0)
 		{
 			int maxId = INT_MIN;
 			for (size_t i = 0; i < m_pComments->m_arrComments.size(); ++i)
