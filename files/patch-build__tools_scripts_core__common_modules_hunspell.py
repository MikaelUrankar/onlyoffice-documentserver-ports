--- build_tools/scripts/core_common/modules/hunspell.py.orig	2021-12-13 14:55:33.226570000 +0100
+++ build_tools/scripts/core_common/modules/hunspell.py	2021-12-13 14:56:54.388810000 +0100
@@ -15,7 +15,7 @@ def make(build_js = True):
       repo_path = "https://github.com/hunspell/hunspell.git"
       base.cmd("git", ["clone", repo_path])
       os.chdir("hunspell")
-      base.cmd("git", ["checkout", last_stable_commit])
+#      base.cmd("git", ["checkout", last_stable_commit])
       base.replaceInFile("./src/hunspell/filemgr.hxx", "FileMgr& operator=(const FileMgr&);", "FileMgr& operator=(const FileMgr&); \n" 
           +" #ifdef HUNSPELL_WASM_MODULE \n char* memory;size_t index;size_t size; \n #endif") #custon filemgr support watch filemgr_wrapper_new.cxx
       os.chdir("../")
