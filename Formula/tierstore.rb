class Tierstore < Formula
  desc "S3 server over a hot and a cold tier of S3-compatible stores"
  homepage "https://tierstore.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.201/tierstore-0.3.201-macos-arm64.tar.gz"
      sha256 "b16ec534a26ceb0af2bb99e4bd029fd028e2601335615289824429127ac4bcb1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.201/tierstore-0.3.201-linux-aarch64.tar.gz"
      sha256 "98a78d38801c9db21c9eb437293415e20368fccd68ab5115619ebffb253bddf7"
    end
    on_intel do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.201/tierstore-0.3.201-linux-x86_64.tar.gz"
      sha256 "46f95cdb63d29a0fa3d51231785767162e77056a85498652c56ac18b0d8511b4"
    end
  end

  def install
    bin.install "tierstore"
  end

  test do
    assert_match "tierstore #{version}", shell_output("#{bin}/tierstore --version")
  end
end
