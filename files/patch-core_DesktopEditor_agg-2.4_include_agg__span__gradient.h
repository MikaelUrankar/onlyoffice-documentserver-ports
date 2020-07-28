--- core/DesktopEditor/agg-2.4/include/agg_span_gradient.h.orig	2020-05-22 08:21:42 UTC
+++ core/DesktopEditor/agg-2.4/include/agg_span_gradient.h
@@ -24,7 +24,7 @@
 
 namespace agg
 {
-#if !defined(_LINUX) && !(defined(_WIN32) || defined (_WIN64)) && !defined(__APPLE__)
+#if !defined(__FreeBSD__) && !defined(_LINUX) && !(defined(_WIN32) || defined (_WIN64)) && !defined(__APPLE__)
     double _hypot(double x, double y)
     {
         return sqrt(x*x + y*y);
