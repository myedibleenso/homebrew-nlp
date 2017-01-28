class Wngrind < Formula
  desc "Produces support files (ex. lexnames) from a WordNet database."
  homepage "https://wordnet.princeton.edu/wordnet/download/"
  url "http://wordnetcode.princeton.edu/tools/grind/WNgrind-3.0.tar.gz"
  sha256 "f63cb9e3f37ac9e0e31017c1bbc04a1280bde770d05de66de6aee2c5bf785f0b"

  depends_on "wordnet" => :recommended

  # Patch to correct inclusion of malloc function on OSX.
  patch :DATA

  def install
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"

    system "make", "install"
  end

  test do
    system "true"
  end
end
__END__
diff --git a/src/grind/create.c b/src/grind/create.c
index 8c73046..7fa6ad8 100644
--- a/src/grind/create.c
+++ b/src/grind/create.c
@@ -6,7 +6,7 @@
 */

 #include <stdio.h>
-#include <malloc.h>
+#include <stdlib.h>
 #include <string.h>
 #include "wngrind.h"

 diff --git a/src/grind/util.c b/src/grind/util.c
 index aabce3d..3733700 100644
 --- a/src/grind/util.c
 +++ b/src/grind/util.c
 @@ -5,7 +5,7 @@
  */

  #include <string.h>
 -#include <malloc.h>
 +#include <stdlib.h>
  #include "wngrind.h"

  static char *Id = "$Id: util.c,v 1.11 2005/01/31 20:03:36 wn Rel $";
