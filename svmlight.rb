class Svmlight < Formula
  desc "Support Vector Machine (SVM) implementation in C."
  homepage "http://svmlight.joachims.org/"
  url "http://osmot.cs.cornell.edu/svm_light"
  version "6.02"
  sha256 "76912d0b1f440ac567f3b5570fa7ea054dd37fb39648e7ead2c4d1e3487ef05a"

  def install
    system "make", "all"
    bin.install "svm_learn"
    bin.install "svm_classify"
  end

  test do
    # write some data for training and testing
    (testpath/"example_file").write("3 qid:1 1:0.53 2:0.12\n2 qid:1 1:0.13 2:0.1\n7 qid:2 1:0.87 2:0.12")
    system "#{bin}/svm_learn", testpath/"example_file", testpath/"model_file"
    # we're testing on the same file used for training
    system "#{bin}/svm_classify", testpath/"example_file", testpath/"model_file", testpath/"predictions"
  end
end
