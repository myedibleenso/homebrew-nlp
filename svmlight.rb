class Svmlight < Formula
  desc "Support Vector Machine (SVM) implementation in C."
  homepage "http://svmlight.joachims.org/"
  url "http://osmot.cs.cornell.edu/svm_light/v6.02/svm_light.tar.gz"
  version "6.02"
  sha256 "aa48985a4c77eecd84d293de40d4731da767e49a1d2323c6198180652aa8724e"

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
