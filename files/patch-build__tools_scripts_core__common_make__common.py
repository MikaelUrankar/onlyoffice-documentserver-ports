--- build_tools/scripts/core_common/make_common.py.orig	2021-11-16 07:07:24 UTC
+++ build_tools/scripts/core_common/make_common.py
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python2.7
 
 import sys
 sys.path.append('modules')
@@ -7,20 +7,21 @@ sys.path.append('..')
 import config
 import base
 
-import boost
-import cef
-import icu
-import openssl
+#import boost
+#import cef
+#import icu
+#import openssl
 import v8
 import html2
 import hunspell
 import glew
 
 def make():
-  boost.make()
-  cef.make()
-  icu.make()
-  openssl.make()
+  if base.host_platform() != 'freebsd' :
+    boost.make()
+    cef.make()
+    icu.make()
+    openssl.make()
   v8.make()
   html2.make()
   hunspell.make(False)
