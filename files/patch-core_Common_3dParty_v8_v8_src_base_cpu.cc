--- core/Common/3dParty/v8/v8/src/base/cpu.cc.orig	2017-08-28 22:27:25 UTC
+++ core/Common/3dParty/v8/v8/src/base/cpu.cc
@@ -428,6 +428,7 @@ CPU::CPU()
 
 #if V8_OS_LINUX
 
+#if V8_OS_LINUX
   CPUInfo cpu_info;
 
   // Extract implementor from the "CPU implementer" field.
@@ -461,6 +462,7 @@ CPU::CPU()
     }
     delete[] part;
   }
+#endif
 
   // Extract architecture from the "CPU Architecture" field.
   // The list is well-known, unlike the the output of
