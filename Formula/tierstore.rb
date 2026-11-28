class Tierstore < Formula
  desc "S3 server over a hot and a cold tier of S3-compatible stores"
  homepage "https://tierstore.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.211/tierstore-0.3.211-macos-arm64.tar.gz"
      sha256 "3c76b30e821ac9c0a978d24df9147177af07e41bb0844b6dd0f1678f0156199e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.211/tierstore-0.3.211-linux-aarch64.tar.gz"
      sha256 "c30002ce35bebc696af0c60b37285c78bc1e508bfa8b8bd9be4ba18e8194cc98"
    end
    on_intel do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.211/tierstore-0.3.211-linux-x86_64.tar.gz"
      sha256 "8b28139ce6361db95356a8f523855822966ea7a084f76da7819830dfcc028ff8"
    end
  end

  def install
    bin.install "tierstore"
  end

  test do
    assert_match "tierstore #{version}", shell_output("#{bin}/tierstore --version")
  end
end
