class Tierstore < Formula
  desc "S3 server over a hot and a cold tier of S3-compatible stores"
  homepage "https://tierstore.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.169/tierstore-0.3.169-macos-arm64.tar.gz"
      sha256 "a2e8cc162929aafb7327ef5f12952964c24a40e349874e44d3ddb3380932a93f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.169/tierstore-0.3.169-linux-aarch64.tar.gz"
      sha256 "77fd89e8a1124c064ade011db8bb3b726a0943a3d795079bc13c40223bb2ded5"
    end
    on_intel do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.169/tierstore-0.3.169-linux-x86_64.tar.gz"
      sha256 "a6fadc7050a56e4876ffae398eb7bf5727731c4ed3c0c1da7152e7010cd78e80"
    end
  end

  def install
    bin.install "tierstore"
  end

  test do
    assert_match "tierstore #{version}", shell_output("#{bin}/tierstore --version")
  end
end
