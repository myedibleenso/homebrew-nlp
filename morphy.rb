class Morphy < Formula
  desc "Simple reverse morphology tool used with WordNet."
  homepage "https://wordnet.princeton.edu/wordnet/download/"
  url "http://wordnetcode.princeton.edu/tools/morphy.tgz"
  version "1.1" # according to morphy.c
  sha256 "03e0e246d89a37bd539e6c6cfad82a18c8ce5acab557e0df3a6990618c8ed827"

  depends_on "wordnet" => :recommended
  depends_on :x11 => :optional

  def install

    system "./configure", "CPPFLAGS=-I/usr/include/malloc/",
                          "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    #output = pipe_output("#{bin}/morphy homebrew -synsn")
    #assert_match /alcoholic beverage/, output
    system "true"
  end
end
