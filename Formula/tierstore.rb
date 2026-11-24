class Tierstore < Formula
  desc "S3 server over a hot and a cold tier of S3-compatible stores"
  homepage "https://tierstore.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.177/tierstore-0.3.177-macos-arm64.tar.gz"
      sha256 "e97f2fece4a0116e457bb4b6b9449e1002c7b5c2437ed151a7dd79f788e54f8a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.177/tierstore-0.3.177-linux-aarch64.tar.gz"
      sha256 "db6da1e049bbf7263f39801b0f721ed908241d8dd911be7858ed3f579bf43830"
    end
    on_intel do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.177/tierstore-0.3.177-linux-x86_64.tar.gz"
      sha256 "d5d86a16e949a475a2c1901b760dfc66a2c3cf003783826f14a1ff807be8a991"
    end
  end

  def install
    bin.install "tierstore"
  end

  test do
    assert_match "tierstore #{version}", shell_output("#{bin}/tierstore --version")
  end
end
