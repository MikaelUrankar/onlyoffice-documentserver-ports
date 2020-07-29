--- server/Gruntfile.js.orig	2020-07-29 13:34:33.066533000 +0200
+++ server/Gruntfile.js	2020-07-29 13:34:45.439203000 +0200
@@ -89,7 +89,6 @@ module.exports = function (grunt) {
   }
   
   grunt.initConfig({
-    clean: packageFile.grunt.clean,
     mkdir: packageFile.grunt.mkdir,
     copy: packageFile.grunt.copy,    
     comments: {
@@ -129,6 +128,6 @@ module.exports = function (grunt) {
   grunt.loadNpmTasks('grunt-banner');
   grunt.loadNpmTasks('grunt-check-dependencies');
   
-  grunt.registerTask('default', ['clean', 'mkdir', 'copy', 'comments', 'usebanner', 'checkDependencies']);
+  grunt.registerTask('default', ['mkdir', 'copy', 'comments', 'usebanner', 'checkDependencies']);
 
-};
\ No newline at end of file
+};
