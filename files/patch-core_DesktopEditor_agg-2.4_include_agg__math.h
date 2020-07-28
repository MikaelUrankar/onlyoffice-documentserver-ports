--- core/DesktopEditor/agg-2.4/include/agg_math.h.orig	2020-05-22 08:21:42 UTC
+++ core/DesktopEditor/agg-2.4/include/agg_math.h
@@ -431,7 +431,7 @@ namespace agg
         }
     }
 
-#if defined(_LINUX) || defined(__APPLE__)
+#if defined(__FreeBSD__) || defined(_LINUX) || defined(__APPLE__)
     inline double _hypot(const double& x, const double& y)
     {
         return sqrt(x * x + y * y);
