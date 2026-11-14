class Tierstore < Formula
  desc "S3 server over a hot and a cold tier of S3-compatible stores"
  homepage "https://tierstore.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.102/tierstore-0.3.102-macos-arm64.tar.gz"
      sha256 "119a54d8904b9208227e42af1627361fe052641ea2508a9676cb7ec1b85c103b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.102/tierstore-0.3.102-linux-aarch64.tar.gz"
      sha256 "ef1e98d579da1371a7ebb40496a01c6c8e54e1b2151dfdb81d88f5d43507dccc"
    end
    on_intel do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.102/tierstore-0.3.102-linux-x86_64.tar.gz"
      sha256 "59e5c045f63b9def49556c5c3eaec963aa4b6faa89d03c22e8b50a231db2424d"
    end
  end

  def install
    bin.install "tierstore"
  end

  test do
    assert_match "tierstore #{version}", shell_output("#{bin}/tierstore --version")
  end
end
