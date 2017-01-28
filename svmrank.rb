class Svmrank < Formula
  desc "SVMstruct instance for efficiently training Ranking SVMs"
  homepage "http://www.cs.cornell.edu/people/tj/svm_light/svm_rank.html"
  url "http://download.joachims.org/svm_rank"
  version "1.0"
  sha256 "53e63648c8bd295c3ddb91be9fcbd185ae8579d263baf3fe60610758e4b4c7b5"

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
