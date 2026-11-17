class Tierstore < Formula
  desc "S3 server over a hot and a cold tier of S3-compatible stores"
  homepage "https://tierstore.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.119/tierstore-0.3.119-macos-arm64.tar.gz"
      sha256 "9d898a9d0f22b78394a8a056dca26e93245cec9866b6ed6aa6eff5af86f14f00"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.119/tierstore-0.3.119-linux-aarch64.tar.gz"
      sha256 "aabfae08c03dee056b28b29064e47faca3c463905b114f63af35253b012c161c"
    end
    on_intel do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.119/tierstore-0.3.119-linux-x86_64.tar.gz"
      sha256 "e42e0b162c1f9840a77c125c81cd4b09d945678f5bc196be765c253c3f1c8fc9"
    end
  end

  def install
    bin.install "tierstore"
  end

  test do
    assert_match "tierstore #{version}", shell_output("#{bin}/tierstore --version")
  end
end
