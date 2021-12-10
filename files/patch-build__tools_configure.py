--- build_tools/configure.py.orig	2021-12-08 10:18:20 UTC
+++ build_tools/configure.py
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python2.7
 
 import os
 import sys
@@ -14,7 +14,7 @@ parser.add_option("--clean", action="store", type="str
 parser.add_option("--module", action="store", type="string", dest="module", default="builder", help="defines what modules to build. You can specify several of them, e.g. --module 'core desktop builder server mobile'")
 parser.add_option("--develop", action="store", type="string", dest="develop", default="0", help="defines develop mode")
 parser.add_option("--beta", action="store", type="string", dest="beta", default="0", help="defines beta mode")
-parser.add_option("--platform", action="store", type="string", dest="platform", default="native", help="defines the destination platform for your build ['win_64', 'win_32', 'win_64_xp', 'win_32_xp', 'linux_64', 'linux_32', 'mac_64', 'ios', 'android_arm64_v8a', 'android_armv7', 'android_x86', 'android_x86_64'; combinations: 'native': your current system (windows/linux/mac only); 'all': all available systems; 'windows': win_64 win_32 win_64_xp win_32_xp; 'linux': linux_64 linux_32; 'mac': mac_64; 'android': android_arm64_v8a android_armv7 android_x86 android_x86_64]")
+parser.add_option("--platform", action="store", type="string", dest="platform", default="native", help="defines the destination platform for your build ['win_64', 'win_32', 'win_64_xp', 'win_32_xp', 'freebsd_64', 'linux_64', 'linux_32', 'mac_64', 'ios', 'android_arm64_v8a', 'android_armv7', 'android_x86', 'android_x86_64'; combinations: 'native': your current system (windows/linux/mac only); 'all': all available systems; 'windows': win_64 win_32 win_64_xp win_32_xp; 'freebsd': freebsd_64;'linux': linux_64 linux_32; 'mac': mac_64; 'android': android_arm64_v8a android_armv7 android_x86 android_x86_64]")
 parser.add_option("--config", action="store", type="string", dest="config", default="", help="provides ability to specify additional parameters for qmake")
 parser.add_option("--qt-dir", action="store", type="string", dest="qt-dir", default="", help="defines qmake directory path. qmake can be found in qt-dir/compiler/bin directory")
 parser.add_option("--qt-dir-xp", action="store", type="string", dest="qt-dir-xp", default="", help="defines qmake directory path for Windows XP. qmake can be found in 'qt-dir/compiler/bin directory")
