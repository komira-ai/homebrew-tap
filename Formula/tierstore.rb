class Tierstore < Formula
  desc "S3 server over a hot and a cold tier of S3-compatible stores"
  homepage "https://tierstore.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.161/tierstore-0.3.161-macos-arm64.tar.gz"
      sha256 "efec4d92efcee2f191eb14e4217a772f1ac48c38baae5e7d7d4b35aa54c85400"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.161/tierstore-0.3.161-linux-aarch64.tar.gz"
      sha256 "1a12e61d5a988efc8c86d0f692827c0c7b5afcc2e52e105a3bb37f58f6572507"
    end
    on_intel do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.161/tierstore-0.3.161-linux-x86_64.tar.gz"
      sha256 "e8d1150aef7b3ba2039d4a16fa6c21e4edc6d01e138fd2126760fabb5723005c"
    end
  end

  def install
    bin.install "tierstore"
  end

  test do
    assert_match "tierstore #{version}", shell_output("#{bin}/tierstore --version")
  end
end
