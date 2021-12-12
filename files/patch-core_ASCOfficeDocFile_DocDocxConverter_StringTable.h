--- core/ASCOfficeDocFile/DocDocxConverter/StringTable.h.orig	2020-05-22 08:21:42 UTC
+++ core/ASCOfficeDocFile/DocDocxConverter/StringTable.h
@@ -77,13 +77,13 @@ namespace DocFileFormat
 		}
 
 		StringTable( VirtualStreamReader *reader, int code_page_ ): 
-                            code_page(code_page_), fExtend(false), cbData(0), cbExtra(0), DataExtra(NULL)
+                            code_page(code_page_), fExtend(false), cbData(0), cbExtra(0), DataExtra(0)
 		{
             parse( reader, (unsigned int)reader->GetPosition(), 0, false );
 		}
 
 		StringTable( POLE::Stream* tableStream, unsigned int fc, unsigned int lcb, int nWordVersion, bool bReadExta = false) :
-												code_page(1250), fExtend(false), cbData(0), cbExtra(0), DataExtra(NULL)
+												code_page(1250), fExtend(false), cbData(0), cbExtra(0), DataExtra(0)
 		{
 			if ( lcb > 0 )
 			{
