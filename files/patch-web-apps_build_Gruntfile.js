--- web-apps/build/Gruntfile.js.orig	2021-12-12 18:46:22.196565000 +0100
+++ web-apps/build/Gruntfile.js	2021-12-12 18:46:32.496044000 +0100
@@ -192,17 +192,6 @@ module.exports = function(grunt) {
     }
 
     grunt.initConfig({
-        mocha: {
-            test: {
-                options: {
-                    reporter: 'Spec'
-                },
-                src: [
-                    '../test/common/index.html'
-                ]
-            }
-        },
-
         jshint: {
             options: {
                 curly: true,
