--- core/Common/3dParty/v8/v8/src/base/platform/platform-posix.cc.orig	2017-08-28 22:27:25 UTC
+++ core/Common/3dParty/v8/v8/src/base/platform/platform-posix.cc
@@ -360,6 +360,12 @@ int OS::GetCurrentThreadId() {
   return static_cast<int>(syscall(__NR_gettid));
 #elif V8_OS_ANDROID
   return static_cast<int>(gettid());
+#elif V8_OS_DRAGONFLYBSD || defined(__DragonFly__)
+  return static_cast<int>(lwp_gettid());
+#elif V8_OS_FREEBSD
+  return static_cast<int>(pthread_getthreadid_np());
+#elif V8_OS_NETBSD
+  return static_cast<int>(_lwp_self());
 #elif V8_OS_AIX
   return static_cast<int>(thread_self());
 #elif V8_OS_SOLARIS
