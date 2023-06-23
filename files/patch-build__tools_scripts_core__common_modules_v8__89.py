--- build_tools/scripts/core_common/modules/v8_89.py.orig	2023-06-14 09:52:10.504034000 +0200
+++ build_tools/scripts/core_common/modules/v8_89.py	2023-06-14 11:18:31.776490000 +0200
@@ -83,39 +83,41 @@ def make():
     base.create_dir(base_dir)
 
   os.chdir(base_dir)
-  if not base.is_dir("depot_tools"):
-    base.cmd("git", ["clone", "https://chromium.googlesource.com/chromium/tools/depot_tools.git"])
+#  if not base.is_dir("depot_tools"):
+#    base.cmd("git", ["clone", "https://chromium.googlesource.com/chromium/tools/depot_tools.git"])
+#
+#  os.environ["PATH"] = base_dir + "/depot_tools" + os.pathsep + os.environ["PATH"]
+#
+#  if ("windows" == base.host_platform()):
+#    base.set_env("DEPOT_TOOLS_WIN_TOOLCHAIN", "0")
+#    base.set_env("GYP_MSVS_VERSION", config.option("vs-version"))
+#
+#  if not base.is_dir("v8"):
+#    base.cmd("./depot_tools/fetch", ["v8"], True)
+#    base.copy_dir("./v8/third_party", "./v8/third_party_new")
+#    if ("windows" == base.host_platform()):
+#      os.chdir("v8")
+#      base.cmd("git", ["config", "--system", "core.longpaths", "true"])
+#      os.chdir("../")
+#    v8_branch_version = "remotes/branch-heads/8.9"
+#    if ("mac" == base.host_platform()):
+#      v8_branch_version = "remotes/branch-heads/9.9"
+#    base.cmd("./depot_tools/gclient", ["sync", "-r", v8_branch_version], True)
+#    base.cmd("gclient", ["sync", "--force"], True)
+#    base.copy_dir("./v8/third_party_new/ninja", "./v8/third_party/ninja")
+#
+#  if ("windows" == base.host_platform()):
+#    base.replaceInFile("v8/build/config/win/BUILD.gn", ":static_crt", ":dynamic_crt")
+#
+#    if not base.is_file("v8/src/base/platform/wrappers.cc"):
+#      base.writeFile("v8/src/base/platform/wrappers.cc", "#include \"src/base/platform/wrappers.h\"\n")
+#
+#  if not base.is_file("v8/third_party/jinja2/tests.py.bak"):
+#    base.copy_file("v8/third_party/jinja2/tests.py", "v8/third_party/jinja2/tests.py.bak")
+#    base.replaceInFile("v8/third_party/jinja2/tests.py", "from collections import Mapping", "try:\n    from collections.abc import Mapping\nexcept ImportError:\n    from collections import Mapping")
 
-  os.environ["PATH"] = base_dir + "/depot_tools" + os.pathsep + os.environ["PATH"]
-
-  if ("windows" == base.host_platform()):
-    base.set_env("DEPOT_TOOLS_WIN_TOOLCHAIN", "0")
-    base.set_env("GYP_MSVS_VERSION", config.option("vs-version"))
-
-  if not base.is_dir("v8"):
-    base.cmd("./depot_tools/fetch", ["v8"], True)
-    base.copy_dir("./v8/third_party", "./v8/third_party_new")
-    if ("windows" == base.host_platform()):
-      os.chdir("v8")
-      base.cmd("git", ["config", "--system", "core.longpaths", "true"])
-      os.chdir("../")
-    v8_branch_version = "remotes/branch-heads/8.9"
-    if ("mac" == base.host_platform()):
-      v8_branch_version = "remotes/branch-heads/9.9"
-    base.cmd("./depot_tools/gclient", ["sync", "-r", v8_branch_version], True)
-    base.cmd("gclient", ["sync", "--force"], True)
-    base.copy_dir("./v8/third_party_new/ninja", "./v8/third_party/ninja")
-
-  if ("windows" == base.host_platform()):
-    base.replaceInFile("v8/build/config/win/BUILD.gn", ":static_crt", ":dynamic_crt")
-
-    if not base.is_file("v8/src/base/platform/wrappers.cc"):
-      base.writeFile("v8/src/base/platform/wrappers.cc", "#include \"src/base/platform/wrappers.h\"\n")
-
-  if not base.is_file("v8/third_party/jinja2/tests.py.bak"):
-    base.copy_file("v8/third_party/jinja2/tests.py", "v8/third_party/jinja2/tests.py.bak")
-    base.replaceInFile("v8/third_party/jinja2/tests.py", "from collections import Mapping", "try:\n    from collections.abc import Mapping\nexcept ImportError:\n    from collections import Mapping")
-
+# ~/onlyoffice-documentserver-ports/work/DocumentServer-7.4.0/core/Common/3dParty/v8_89_89
+  print(base_dir)
   os.chdir("v8")
   
   gn_args = ["v8_static_library=true",
@@ -124,6 +126,10 @@ def make():
              "v8_use_external_startup_data=false",
              "use_custom_libcxx=false",
              "treat_warnings_as_errors=false"]
+
+  if config.check_option("platform", "freebsd_64"):
+    base.cmd2("gn", ["gen", "out.gn/freebsd_64", "--args=\"v8_monolithic=true is_debug=false v8_static_library=true is_component_build=false is_clang=true use_sysroot=false treat_warnings_as_errors=false clang_use_chrome_plugins=false  use_lld=true use_custom_libcxx=false v8_use_external_startup_data=false is_component_build=false\""])
+    base.cmd("ninja", ["-C", "out.gn/freebsd_64"])
 
   if config.check_option("platform", "linux_64"):
     base.cmd2("gn", ["gen", "out.gn/linux_64", make_args(gn_args, "linux")])
