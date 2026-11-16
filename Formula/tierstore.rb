class Tierstore < Formula
  desc "S3 server over a hot and a cold tier of S3-compatible stores"
  homepage "https://tierstore.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.115/tierstore-0.3.115-macos-arm64.tar.gz"
      sha256 "e9acade270177a821bf68e58056c20e8413eeb14d2325589c609a9d66ddfdc53"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.115/tierstore-0.3.115-linux-aarch64.tar.gz"
      sha256 "ec878a7dafa183abb710b489835de42fc71b48332e3a5e5abc8bf8ac26b7541c"
    end
    on_intel do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.115/tierstore-0.3.115-linux-x86_64.tar.gz"
      sha256 "c74ccd76a4e8a938f2dd8e283a8f439391867a64e265a6a670ffcfe1e8f7dfd3"
    end
  end

  def install
    bin.install "tierstore"
  end

  test do
    assert_match "tierstore #{version}", shell_output("#{bin}/tierstore --version")
  end
end
