# Documentation: https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/Formula-Cookbook.md
#                /usr/local/Library/Contributions/example-formula.rb
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Nxml2txt < Formula
  homepage ""
  url "https://github.com/myedibleenso/nxml2txt/archive/v1.0.0.tar.gz"
  version "v1.0.0"
  sha1 "ec0fb3bfbf537c6861560c4a4ae69dbb4a53acd0" 

  depends_on :python
  depends_on "libxml2"

  def install
	mkdir_p bin/"src"
	bin.install "data"
	bin.install "nxml2txt"
	(bin/"src").install Dir["src/*"]
    ln_sf bin/"src", "#{HOMEBREW_PREFIX}/bin/src"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test nxml2txt`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
