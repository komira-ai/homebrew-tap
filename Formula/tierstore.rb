class Tierstore < Formula
  desc "S3 server over a hot and a cold tier of S3-compatible stores"
  homepage "https://tierstore.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.196/tierstore-0.3.196-macos-arm64.tar.gz"
      sha256 "96ffe391e262d555a2be8f12a4b0257340481859ecda42c170244e5d2993b7ed"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.196/tierstore-0.3.196-linux-aarch64.tar.gz"
      sha256 "ac70f9fca9e05116deba00f2d9f7fe049b35623f4a9dac60db2d65089edb4b1a"
    end
    on_intel do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.196/tierstore-0.3.196-linux-x86_64.tar.gz"
      sha256 "36710336f7d694618a3bdc7f640841660f5ae5c44441c14c3b4544e04cc91d3b"
    end
  end

  def install
    bin.install "tierstore"
  end

  test do
    assert_match "tierstore #{version}", shell_output("#{bin}/tierstore --version")
  end
end
