class Svmrank < Formula
  desc "SVMstruct instance for efficiently training Ranking SVMs"
  homepage "http://www.cs.cornell.edu/people/tj/svm_light/svm_rank.html"
  url "http://osmot.cs.cornell.edu/svm_rank/current/svm_rank.tar.gz"
  version "1.00"
  sha256 "909f67bf57b13916acc78fd6aa8794df93be9f29d90a03e9dc2d7a49fe4dd7b2"

  def install
    system "make", "all"
    bin.install "svm_rank_classify"
    bin.install "svm_rank_learn"
  end

  test do
    # write some data for training and testing
    (testpath/"example_file").write("3 qid:1 1:0.53 2:0.12\n2 qid:1 1:0.13 2:0.1\n7 qid:2 1:0.87 2:0.12")
    system "#{bin}/svm_rank_learn", "-c", "20.0", testpath/"example_file", testpath/"model_file"
    # we're testing on the same file used for training
    system "#{bin}/svm_rank_classify", testpath/"example_file", testpath/"model_file", testpath/"predictions"
  end
end
