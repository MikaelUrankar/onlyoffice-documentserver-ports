--- build_tools/scripts/deploy_server.py.orig	2021-11-16 07:07:24 UTC
+++ build_tools/scripts/deploy_server.py
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python2.7
 
 import config
 import base
@@ -92,7 +92,7 @@ def make():
       base.copy_file(core_dir + "/Common/3dParty/icu/" + platform + "/build/icudt58.dll", converter_dir + "/icudt58.dll")
       base.copy_file(core_dir + "/Common/3dParty/icu/" + platform + "/build/icuuc58.dll", converter_dir + "/icuuc58.dll")
 
-    if (0 == platform.find("linux")):
+    if (0 == platform.find("linux") and 0 != platform.find('freebsd')):
       base.copy_file(core_dir + "/Common/3dParty/icu/" + platform + "/build/libicudata.so.58", converter_dir + "/libicudata.so.58")
       base.copy_file(core_dir + "/Common/3dParty/icu/" + platform + "/build/libicuuc.so.58", converter_dir + "/libicuuc.so.58")
 
@@ -102,11 +102,14 @@ def make():
 
     if (0 == platform.find("win")):
       base.copy_files(core_dir + "/Common/3dParty/v8/v8/out.gn/" + platform + "/release/icudt*.dat", converter_dir + "/")
+    elif (0 == platform.find("freebsd")):
+      pass
     elif (-1 == config.option("config").find("use_javascript_core")):
       base.copy_file(core_dir + "/Common/3dParty/v8/v8/out.gn/" + platform + "/icudtl.dat", converter_dir + "/icudtl.dat")
 
     # builder
     base.copy_exe(core_build_dir + "/bin/" + platform_postfix, converter_dir, "docbuilder")
+    # XXX warning under FreeBSD
     base.copy_dir(git_dir + "/DocumentBuilder/empty", converter_dir + "/empty")
 
     # js
