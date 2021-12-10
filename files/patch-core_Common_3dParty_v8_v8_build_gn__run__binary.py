--- core/Common/3dParty/v8/v8/build/gn_run_binary.py.orig	2021-12-08 18:23:10 UTC
+++ core/Common/3dParty/v8/v8/build/gn_run_binary.py
@@ -19,7 +19,7 @@ path = './' + sys.argv[1]
 # The rest of the arguements are passed directly to the executable.
 args = [path] + sys.argv[2:]
 
-ret = subprocess.call(args)
+ret = subprocess.call(args, env={"CHROME_EXE_PATH":"${WRKSRC}/out/Release/chrome"})
 if ret != 0:
   print '%s failed with exit code %d' % (sys.argv[1], ret)
 sys.exit(ret)
